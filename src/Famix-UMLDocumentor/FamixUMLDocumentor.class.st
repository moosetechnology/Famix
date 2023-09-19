Class {
	#name : #FamixUMLDocumentor,
	#superclass : #Object,
	#instVars : [
		'withStub',
		'umlModel',
		'modelColors',
		'onlyModelClasses',
		'fmClasses'
	],
	#category : #'Famix-UMLDocumentor-Generation'
}

{ #category : #api }
FamixUMLDocumentor >> beWithStub [

	withStub := true
]

{ #category : #api }
FamixUMLDocumentor >> beWithoutStub [

	withStub := false
]

{ #category : #private }
FamixUMLDocumentor >> colorForEntity: aFMEntity [
	^modelColors
		detect: [ :modelColor |
			(self fm3DescriptionOf: modelColor key) package classes
				includes: aFMEntity ]
		ifFound: [ :modelColor | modelColor value ]
		ifNone:  [ Color white ]
.

]

{ #category : #private }
FamixUMLDocumentor >> defaultColor: i [

	^Color perform: ( #(white lightYellow lightBlue lightGreen pink) at: i )
]

{ #category : #testing }
FamixUMLDocumentor >> entityAlreadyInUMLModel: aFM3Entity [

	^umlModel at: aFM3Entity ifPresent: [true] ifAbsent: [false]
]

{ #category : #api }
FamixUMLDocumentor >> exportWith: aBackend [

	^aBackend export: self umlEntities
]

{ #category : #private }
FamixUMLDocumentor >> fm3: metamodel descriptionOf: anFM3Element [

	^metamodel descriptionOf: anFM3Element ifAbsent: [ nil ]
]

{ #category : #private }
FamixUMLDocumentor >> fm3DescriptionOf: anFM3Element [

	modelColors do: [ :modelColor |
		(self
			fm3: modelColor key metamodel
			descriptionOf: anFM3Element)
		ifNotNil: [ :description | ^description ]
	].

	^nil
]

{ #category : #private }
FamixUMLDocumentor >> fm3DescriptionsOf: aCollection [

	^aCollection collect: [ :aClass | self fm3DescriptionOf: aClass ]
]

{ #category : #accessing }
FamixUMLDocumentor >> fmClasses: aCollection [
	fmClasses addAll: aCollection 
]

{ #category : #api }
FamixUMLDocumentor >> generate [

	modelColors ifEmpty: [ Error signal: 'no meta-model(s) to work on' ].

	"if no classes specified, generate the entire meta-model"
	fmClasses := onlyModelClasses
		ifNil: [ self getClassesFromModels ]
		ifNotNil: [ self fm3DescriptionsOf: onlyModelClasses ].

	fmClasses do: [ :class | self generateClass: class ]
]

{ #category : #generating }
FamixUMLDocumentor >> generateClass: aFM3Class [

	| entity |
	(self entityAlreadyInUMLModel: aFM3Class) ifTrue: [ ^self ].

	entity := (FamixUMLClass from: aFM3Class).
	entity color: (self colorForEntity: aFM3Class).
	umlModel at: aFM3Class put: entity.

"	self checkExternalClass: aFM3Class."

	(self isStubClass: aFM3Class) ifTrue: [ ^ self ].
	
	aFM3Class primitiveProperties do: [ :prop | self generateProperty: prop of: entity ].
	aFM3Class complexProperties do: [ :rel | self generateRelation: rel of: entity ].
	
	aFM3Class isFM3Trait
		ifFalse: [ self generateInheritance: aFM3Class superclass sub: aFM3Class ].
	aFM3Class implementingClass traits do: [ :trait |
		self generateUsedTrait: (self fm3DescriptionOf: trait) byClass: aFM3Class ].

]

{ #category : #generating }
FamixUMLDocumentor >> generateInheritance: aFMSuperClass sub: aFMSubClass [
	(self shouldBeInUMLModel: aFMSuperClass) ifFalse: [ ^ self ].

	self generateClass: aFMSuperClass.

	umlModel
		at: (aFMSubClass -> aFMSuperClass)
		put: (FamixUMLInheritance from: aFMSubClass to: aFMSuperClass)
]

{ #category : #generating }
FamixUMLDocumentor >> generateProperty: aFMProperty of: aUMLClass [
	aUMLClass addProperty: (FamixUMLProperty from: aFMProperty)
]

{ #category : #generating }
FamixUMLDocumentor >> generateRelation: aFMProperty of: aUMLClass [

	| relatedClass |

	(self relationAlreadyInUMLModel: aFMProperty) ifTrue: [ ^ self ].
	
	relatedClass := aFMProperty type.
	(self shouldBeInUMLModel: relatedClass) ifFalse: [ ^ self ].

	umlModel at: aFMProperty put: (FamixUMLAssociation from: aFMProperty).

	self generateClass: relatedClass.
]

{ #category : #generating }
FamixUMLDocumentor >> generateUsedTrait: aTrait byClass: aFMSubClass [
	(self shouldBeInUMLModel: aTrait) ifFalse: [ ^ self ].

	self generateClass: aTrait.

	umlModel
		at: (aFMSubClass -> aTrait)
		put: (FamixUMLUse from: aFMSubClass to: aTrait)
]

{ #category : #private }
FamixUMLDocumentor >> getClassesFromModels [

	^modelColors flatCollect: [ :modelColor |
		(self fm3DescriptionOf: modelColor key) package classes ]
]

{ #category : #initialization }
FamixUMLDocumentor >> initialize [
	super initialize.

	fmClasses := Set new.
	"3 seems like a good default maximum value for the model we want to document"
	modelColors := OrderedCollection new: 3.
	umlModel := Dictionary new.
	self beWithoutStub.
]

{ #category : #api }
FamixUMLDocumentor >> initializeClassesToShow [

	fmClasses := onlyModelClasses
		             ifNil: [ self getClassesFromModels ]
		             ifNotNil: [ self fm3DescriptionsOf: onlyModelClasses ]
]

{ #category : #testing }
FamixUMLDocumentor >> isStubClass: aFMClass [
	"aFMClass is a model class to export"

	^(fmClasses includes: aFMClass) not
]

{ #category : #testing }
FamixUMLDocumentor >> isWithStub [

	^withStub
]

{ #category : #accessing }
FamixUMLDocumentor >> model [
	^ modelColors anyOne key
]

{ #category : #api }
FamixUMLDocumentor >> model: aModel [

	| modelColor |
	modelColor := self defaultColor: (modelColors size + 1).
	modelColors add: (aModel -> modelColor)
]

{ #category : #api }
FamixUMLDocumentor >> model: aModel color: aColor [

	modelColors add: (aModel -> aColor)
]

{ #category : #accessing }
FamixUMLDocumentor >> modelColors [

	^ modelColors
]

{ #category : #api }
FamixUMLDocumentor >> onlyClasses: aCollection [

	onlyModelClasses := aCollection
]

{ #category : #testing }
FamixUMLDocumentor >> relationAlreadyInUMLModel: aFMRelation [

	(self entityAlreadyInUMLModel: aFMRelation) ifTrue: [ ^true ].
	
	aFMRelation hasOpposite ifFalse: [ ^false ].
	
	^(self entityAlreadyInUMLModel: aFMRelation opposite)
]

{ #category : #testing }
FamixUMLDocumentor >> shouldBeInUMLModel: aFMClass [

	^ self isWithStub
		  ifTrue: [ aFMClass class ~= FM3Object ]
		  ifFalse: [ (self isStubClass: aFMClass) not ]
]

{ #category : #accessing }
FamixUMLDocumentor >> umlEntities [

	^umlModel values
]
