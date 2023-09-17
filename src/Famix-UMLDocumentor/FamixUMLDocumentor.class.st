Class {
	#name : #FamixUMLDocumentor,
	#superclass : #Object,
	#instVars : [
		'withStub',
		'modelClasses',
		'umlModel',
		'backend',
		'outputStream',
		'modelColors'
	],
	#category : #'Famix-UMLDocumentor-Generator'
}

{ #category : #accessing }
FamixUMLDocumentor >> backend [

	^ backend
]

{ #category : #accessing }
FamixUMLDocumentor >> backend: anObject [

	backend := anObject
]

{ #category : #api }
FamixUMLDocumentor >> beWithStub [
	self withStub: true
]

{ #category : #api }
FamixUMLDocumentor >> beWithoutStub [
	self withStub: false
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

	modelClasses addAll: (modelColors flatCollect: [ :modelColor |
		(self fm3DescriptionOf: modelColor key) package classes ]).

	self generateUMLClasses.
	self generateUMLInheritance.
	self generateUMLRelations.
	"self generateUMLExternalClasses."

	self backend export: self umlEntities on: outputStream.

	^outputStream
		close ;
		contents

]

{ #category : #generating }
FamixUMLDocumentor >> generateUMLClasses [
	modelClasses do: [ :class | self visitClass: class ].
	
]

{ #category : #generating }
FamixUMLDocumentor >> generateUMLInheritance [

]

{ #category : #generating }
FamixUMLDocumentor >> generateUMLRelations [

]

{ #category : #initialization }
FamixUMLDocumentor >> initialize [
	super initialize.

	modelClasses := Set new.
	"3 seems like a good default maximum value for the model we want to document"
	modelColors := OrderedCollection new: 3.
	self onStream: (WriteStream with: String new).
	umlModel := Dictionary new.
	self plantUMLBackend.
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
	^withStub
]

{ #category : #api }
FamixUMLDocumentor >> mermaidBackend [

	backend := FamixUMLMermaidBackend new
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

{ #category : #api }
FamixUMLDocumentor >> onFile: filename [

	self onStream: filename asFileReference writeStream
]

{ #category : #api }
FamixUMLDocumentor >> onStream: aStream [
	outputStream := aStream
]

{ #category : #api }
FamixUMLDocumentor >> plantUMLBackend [

	backend := FamixUMLPlantUMLBackend new
]

{ #category : #accessing }
FamixUMLDocumentor >> umlEntities [

	^umlModel values
]

{ #category : #visiting }
FamixUMLDocumentor >> visitClass: aFM3Class [

	| entity |
	(self isInUMLModel: aFM3Class) ifTrue: [ ^self ].

	entity := (FamixUMLClass from: aFM3Class).
	entity color: (self colorForEntity: aFM3Class).
		"color: (self plantUMLColorFor: aFM3Class);
		 backgroundColor: (self plantUMLBackgroundColorFor: aFM3Class)"
		umlModel at: aFM3Class put: entity.

"	self checkExternalClass: aFM3Class."

	(self isOfInterest: aFM3Class) ifFalse: [ ^ self ].
	
	aFM3Class primitiveProperties do: [ :prop | self visitProperty: prop of: entity ].
	aFM3Class complexProperties do: [ :rel | self visitRelation: rel of: entity ].
	
	aFM3Class isFM3Trait
		ifFalse: [ self visitInheritance: aFM3Class superclass sub: aFM3Class ].
	aFM3Class implementingClass traits do: [ :trait |
		self visitUsedTrait: trait byClass: aFM3Class ].

]

{ #category : #visiting }
FamixUMLDocumentor >> visitInheritance: aFMSuperClass sub: aFMSubClass [
	(self isOfInterest: aFMSuperClass) ifFalse: [ ^ self ].

	umlModel
		at: (aFMSubClass -> aFMSuperClass)
		put: (FamixUMLInheritance from: aFMSubClass to: aFMSuperClass)
]

{ #category : #visiting }
FamixUMLDocumentor >> visitProperty: aFMProperty of: aUMLClass [
	aUMLClass addProperty: (FamixUMLProperty from: aFMProperty)
]

{ #category : #visiting }
FamixUMLDocumentor >> visitRelation: aFMProperty of: aUMLClass [

	| relatedClass |
	relatedClass := aFMProperty type.
	
	(self isOfInterest: relatedClass) ifFalse: [ ^ self ].
	(self isRedundantRelation: aFMProperty) ifTrue: [ ^ self ].

	umlModel at: aFMProperty put: (FamixUMLAssociation from: aFMProperty).

	self visitClass: relatedClass.
]

{ #category : #visiting }
FamixUMLDocumentor >> visitTrait: aFM3Class [

	| entity |
	(self isInUMLModel: aFM3Class) ifTrue: [ ^self ].

	entity := (FamixUMLClass from: aFM3Class).
		"color: (self plantUMLColorFor: aFM3Class);
		 backgroundColor: (self plantUMLBackgroundColorFor: aFM3Class)"
		umlModel at: aFM3Class put: entity.

"	self checkExternalClass: aFM3Class."

	(self isOfInterest: aFM3Class) ifFalse: [ ^ self ].
	
	aFM3Class primitiveProperties do: [ :prop | self visitProperty: prop of: entity ].
	aFM3Class complexProperties do: [ :rel | self visitRelation: rel of: entity ].
	
	aFM3Class isTrait
		ifFalse: [ self visitInheritance: aFM3Class superclass sub: aFM3Class ].
	aFM3Class implementingClass traits do: [ :trait |
		self visitUsedTrait: trait byClass: aFM3Class ].

]

{ #category : #visiting }
FamixUMLDocumentor >> visitUsedTrait: aTrait byClass: aFMSubClass [
	(self isOfInterest: aTrait) ifFalse: [ ^ self ].

	umlModel
		at: (aFMSubClass -> aTrait)
		put: (FamixUMLUse from: aFMSubClass to: (self fm3DescriptionOf: aTrait))
]

{ #category : #accessing }
FamixUMLDocumentor >> withStub: aBoolean [
	withStub := aBoolean
]
