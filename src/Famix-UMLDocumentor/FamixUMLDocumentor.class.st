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
	"find the color of the meta-model associated with aFMEntity
	 if is a stub, try to find another color"

	(self isStubClass: aFMEntity)
		ifTrue: [ ^self defaultColor: modelColors size + 1 ].

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
	"note: colors chosen from Color class>>#defaultColors3"

	^Color perform: ( #(white lightYellow lightGreen veryPaleRed lightBlue lightMagenta lightOrange paleTan lightCyan lightBrown ) at: i )
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

{ #category : #private }
FamixUMLDocumentor >> fmClassToUMLClass: aFM3Class [

	| umlClass |
	umlClass := FamixUMLClass from: aFM3Class.
	(self isStubClass: aFM3Class) ifTrue: [ umlClass beStub ].
	umlClass color: (self colorForEntity: aFM3Class).

	umlModel at: aFM3Class put: umlClass.
	
	^umlClass
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

	| umlClass |
	(self entityAlreadyInUMLModel: aFM3Class) ifTrue: [ ^self ].

	umlClass := self fmClassToUMLClass: aFM3Class.

	self generateProperties: umlClass fromFMClass: aFM3Class.
	self generateInheritancesFromFMClass: aFM3Class
]

{ #category : #generating }
FamixUMLDocumentor >> generateInheritance: umlLink sub: aFMSubClass super: aFMSuperClass [
	"only generates inheritance if both ends are in the UML model and it has not be generated yet
	 make sure both classes (or Trait) exist before creating the link (recursive call)
	 Note that #generateClass: tests that the class is not already generated before doing anything"

	(self shouldBeInUMLModel: aFMSubClass) ifFalse: [ ^ self ].
	(self shouldBeInUMLModel: aFMSuperClass) ifFalse: [ ^ self ].
	(self entityAlreadyInUMLModel: (aFMSubClass -> aFMSuperClass)) ifTrue: [ ^self ].

	self generateClass: aFMSubClass.
	self generateClass: aFMSuperClass.

	umlModel
		at: (aFMSubClass -> aFMSuperClass)
		put: (umlLink from: aFMSubClass to: aFMSuperClass)
]

{ #category : #generating }
FamixUMLDocumentor >> generateInheritancesFromFMClass: aFM3Class [

	aFM3Class isFM3Trait
		ifFalse: [
			self
				generateInheritance: FamixUMLInheritance
				sub: aFM3Class
				super: aFM3Class superclass ].

	aFM3Class implementingClass traits do: [ :trait |
		self 
			generateInheritance: FamixUMLUse
			sub: aFM3Class
			super: (self fm3DescriptionOf: trait) ].
]

{ #category : #generating }
FamixUMLDocumentor >> generateProperties: umlClass fromFMClass: aFM3Class [

	aFM3Class primitiveProperties do: [ :prop | self generateProperty: prop in: umlClass ].
	aFM3Class complexProperties do: [ :rel | self generateRelation: rel for: umlClass ].
]

{ #category : #generating }
FamixUMLDocumentor >> generateProperty: aFMProperty in: aUMLClass [
	aUMLClass addProperty: (FamixUMLProperty from: aFMProperty)
]

{ #category : #generating }
FamixUMLDocumentor >> generateRelation: aFMProperty for: aUMLClass [
	"assumes owner of perperty should be in uml model
	 only generates relation if other end should be in the UML model
	  and the relation has not be generated yet and its opposite has not been generated either
	 make sure other end exist before creating the link (recursive call)
	 Note that #generateClass: tests that the class is not already generated before doing anything"

	| relatedClass |

	relatedClass := aFMProperty type.
	
	(self shouldBeInUMLModel: relatedClass) ifFalse: [ ^ self ].
	(self relationAlreadyInUMLModel: aFMProperty) ifTrue: [ ^ self ].

	self generateClass: relatedClass.	

	umlModel at: aFMProperty put: (FamixUMLAssociation from: aFMProperty).

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
