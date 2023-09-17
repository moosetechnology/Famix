Class {
	#name : #FamixUMLDocumentor,
	#superclass : #Object,
	#instVars : [
		'withStub',
		'modelClasses',
		'umlModel',
		'modelColors'
	],
	#category : #'Famix-UMLDocumentor-Generator'
}

{ #category : #api }
FamixUMLDocumentor >> beWithStub [

	withStub := OrderedCollection new
]

{ #category : #api }
FamixUMLDocumentor >> beWithoutStub [

	withStub := nil
]

{ #category : #private }
FamixUMLDocumentor >> colorForEntity: aFMEntity [
	^modelColors
		detect: [ :modelColor | (self fm3DescriptionOf: modelColor key) package classes includes: aFMEntity ]
		ifFound: [ :modelColor | modelColor value ]
		ifNone:  [ Color white ]
.

]

{ #category : #accessing }
FamixUMLDocumentor >> defaultColor: i [

	^Color perform: ( #(white lightYellow lightBlue lightGreen pink) at: i )
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

{ #category : #api }
FamixUMLDocumentor >> generate [

	modelColors ifEmpty: [ Error signal: 'no meta-model(s) to work on' ].

	"if no classes specified, generate the entire meta-model"
	modelClasses ifEmpty: [
		modelClasses := (modelColors flatCollect: [ :modelColor |
			(self fm3DescriptionOf: modelColor key) package classes ])].

	self generateUMLClasses.
	self generateUMLInheritance.
	self generateUMLRelations.
	"self generateUMLExternalClasses."

]

{ #category : #generating }
FamixUMLDocumentor >> generateClass: aFM3Class [

	| entity |
	(self isInUMLModel: aFM3Class) ifTrue: [ ^self ].

	entity := (FamixUMLClass from: aFM3Class).
	entity color: (self colorForEntity: aFM3Class).
		"color: (self plantUMLColorFor: aFM3Class);
		 backgroundColor: (self plantUMLBackgroundColorFor: aFM3Class)"
		umlModel at: aFM3Class put: entity.

"	self checkExternalClass: aFM3Class."

	(self isOfInterest: aFM3Class) ifFalse: [ ^ self ].
	
	aFM3Class primitiveProperties do: [ :prop | self generateProperty: prop of: entity ].
	aFM3Class complexProperties do: [ :rel | self generateRelation: rel of: entity ].
	
	aFM3Class isFM3Trait
		ifFalse: [ self generateInheritance: aFM3Class superclass sub: aFM3Class ].
	aFM3Class implementingClass traits do: [ :trait |
		self generateUsedTrait: trait byClass: aFM3Class ].

]

{ #category : #generating }
FamixUMLDocumentor >> generateInheritance: aFMSuperClass sub: aFMSubClass [
	(self isOfInterest: aFMSuperClass) ifFalse: [ ^ self ].

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
	relatedClass := aFMProperty type.
	
	(self isOfInterest: relatedClass) ifFalse: [ ^ self ].
	(self isRedundantRelation: aFMProperty) ifTrue: [ ^ self ].

	umlModel at: aFMProperty put: (FamixUMLAssociation from: aFMProperty).

	self generateClass: relatedClass.
]

{ #category : #generating }
FamixUMLDocumentor >> generateUMLClasses [
	modelClasses do: [ :class | self generateClass: class ].
	
]

{ #category : #generating }
FamixUMLDocumentor >> generateUMLInheritance [

]

{ #category : #generating }
FamixUMLDocumentor >> generateUMLRelations [

]

{ #category : #generating }
FamixUMLDocumentor >> generateUsedTrait: aTrait byClass: aFMSubClass [
	(self isOfInterest: aTrait) ifFalse: [ ^ self ].

	umlModel
		at: (aFMSubClass -> aTrait)
		put: (FamixUMLUse from: aFMSubClass to: (self fm3DescriptionOf: aTrait))
]

{ #category : #initialization }
FamixUMLDocumentor >> initialize [
	super initialize.

	modelClasses := Set new.
	"3 seems like a good default maximum value for the model we want to document"
	modelColors := OrderedCollection new: 3.
	umlModel := Dictionary new.
	self beWithoutStub.
]

{ #category : #testing }
FamixUMLDocumentor >> isInUMLModel: aFM3Entity [

	^umlModel at: aFM3Entity ifPresent: [true] ifAbsent: [false]
]

{ #category : #testing }
FamixUMLDocumentor >> isOfInterest: aFMClass [

	^self isWithStub
		ifTrue: [ aFMClass class ~= FM3Object ]
		ifFalse: [ modelClasses includes: aFMClass ]
]

{ #category : #testing }
FamixUMLDocumentor >> isRedundantRelation: aFM3Prop [

	(self isInUMLModel: aFM3Prop) ifTrue: [ true ].
	
	aFM3Prop hasOpposite ifFalse: [ false ].
	
	^(self isInUMLModel: aFM3Prop opposite)
]

{ #category : #testing }
FamixUMLDocumentor >> isWithStub [

	^withStub isCollection
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

{ #category : #api }
FamixUMLDocumentor >> modelClasses: aCollection [
	modelClasses addAll: aCollection 
]

{ #category : #accessing }
FamixUMLDocumentor >> modelColors [

	^ modelColors
]

{ #category : #accessing }
FamixUMLDocumentor >> umlEntities [

	^umlModel values
]
