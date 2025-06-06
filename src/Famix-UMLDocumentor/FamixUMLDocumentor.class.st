"
A Tool to generate an UML representation of Famix meta-models

## Simple use:
```
FamixUMLDocumentor new
  model: FamixStModel ;
  generate ;
  exportWith: (FamixUMLPlantUMLBackend new).
```

## API:
- `model:` adds a meta-model to export (entities of the meta-model will have an automatically assigned color)
  several meta-models can be specified
- `model:color:` same as previous but manually assign a color to the entities of this meta-model
- `onlyClasses:` a list of the classes to export (additional classes may appear with `beWithStubs`)
- `excludeClasses:` a list of classes to exclude from the export (they could appear as External with `beWithStubs`). As precedence over `onlyClasses:`
- `beWithStubs` also export the super-classes and used traits of classes exported, even if these super-classes/traits or not part of the meta-models. These stubs have an automatically selected color.
- `beWithoutStubs` opposite of the preceding, default option
- `generate` creates an internal representation of a UML class diagram according to the options given before
- `exportWith:` exports the internal representation with the ""backend"" given

## Backends

The backends export the model in some specific format.
- `FamixUMLTextBackend`: exports a textual description of the model
- `FamixUMLPlantUMLBackend`: exports a description of the model in PlantUML format
- `FamixUMLMermaidBackend`: exports a textual description of the model in Mermaid format
- `FamixUMLRoassalBackend`: creates a Roassal representation of the model (work in progress)
"
Class {
	#name : #FamixUMLDocumentor,
	#superclass : #Object,
	#instVars : [
		'withStub',
		'umlModel',
		'modelColors',
		'onlyModelClasses',
		'excludeModelClasses',
		'shouldGenerateProperties'
	],
	#category : #'Famix-UMLDocumentor-Generation'
}

{ #category : #api }
FamixUMLDocumentor >> beWithStubs [

	withStub := true
]

{ #category : #api }
FamixUMLDocumentor >> beWithoutStubs [

	withStub := false
]

{ #category : #private }
FamixUMLDocumentor >> classesForUML [
	"if no classes specified, generate the entire meta-model"

	^onlyModelClasses
		ifNotNil: [
			onlyModelClasses collect: [ :aClass | self fm3DescriptionOf: aClass ]
		]
		ifNil: [
			modelColors flatCollect: [ :modelColor |
				(self fm3DescriptionOf: modelColor key) package classes ]
		]

]

{ #category : #private }
FamixUMLDocumentor >> colorForEntity: aFMEntity [
	"find the color of the meta-model associated with aFMEntity
	 if is a stub, try to find another color"

	(self userRequestedClass: aFMEntity)
		ifFalse: [ ^self defaultColor: modelColors size + 1 ].

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

{ #category : #api }
FamixUMLDocumentor >> excludeClasses: aCollection [

	excludeModelClasses := aCollection
]

{ #category : #api }
FamixUMLDocumentor >> exportWith: aBackend [

	^aBackend export: self umlEntities
]

{ #category : #private }
FamixUMLDocumentor >> fm3: metamodel descriptionOf: aClass [

	^metamodel descriptionOf: aClass ifAbsent: [ nil ]
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

	self classesForUML do: [ :fmClass | self generateClass: fmClass ].

	self umlClassesDo: [ :fmClass :umlClass | self generateInheritance: fmClass uml: umlClass ].
	self umlClassesDo: [ :fmClass :umlClass | self generateProperties: fmClass uml: umlClass ].
	self umlClassesDo: [ :fmClass :umlClass | self generateRelations: fmClass uml: umlClass ].
]

{ #category : #generating }
FamixUMLDocumentor >> generateClass: aFM3Class [

	| umlClass |
	(self umlModelIncludes: aFM3Class) ifTrue: [ ^self ].
	(self shouldGenerateClass: aFM3Class) ifFalse: [ ^self ].

	umlClass := FamixUMLClass from: aFM3Class.
	(self userRequestedClass: aFM3Class) ifFalse: [ umlClass beStub ].
	umlClass color: (self colorForEntity: aFM3Class).

	umlModel at: aFM3Class put: umlClass.

	umlClass isStub
	ifFalse: [
		self generateSuperClasses: aFM3Class
	]
	
]

{ #category : #generating }
FamixUMLDocumentor >> generateInheritance: umlLink sub: aFMSubClass super: aFMSuperClass [

	(self shouldGenerateClass: aFMSubClass) ifFalse: [ ^ self ].
	(self shouldGenerateClass: aFMSuperClass) ifFalse: [ ^ self ].
	(self umlModelIncludes: (aFMSubClass -> aFMSuperClass)) ifTrue: [ ^self ].

	umlModel
		at: (aFMSubClass -> aFMSuperClass)
		put: (umlLink from: aFMSubClass to: aFMSuperClass)
]

{ #category : #generating }
FamixUMLDocumentor >> generateInheritance: fmClass uml: umlClass [

	fmClass isFM3Trait
	ifFalse: [
		self
			generateInheritance: FamixUMLInheritance
			sub: fmClass
			super: fmClass superclass ].

	fmClass implementingClass traits
	do: [ :trait |
		self 
			generateInheritance: FamixUMLUse
			sub: fmClass
			super: (self fm3DescriptionOf: trait) ].
]

{ #category : #generating }
FamixUMLDocumentor >> generateProperties: aFMClass uml: umlClass [
	"accept FM3Object as a primitive type (#isRoot = true)"

	shouldGenerateProperties ifFalse: [ ^ self ].

	aFMClass properties do: [ :prop |
		(prop type isPrimitive or: [ prop type isRoot ]) ifTrue: [
			umlClass addProperty: (FamixUMLProperty from: prop) ] ]
]

{ #category : #generating }
FamixUMLDocumentor >> generateRelation: aFMProperty from: fmClass [

	| relatedClass |

	relatedClass := aFMProperty type.
	
	(self umlModelIncludes: fmClass) ifFalse: [ ^ self ].
	(self umlModelIncludes: relatedClass) ifFalse: [ ^ self ].
	(self umlModelIncludesRelation: aFMProperty) ifTrue: [ ^ self ].

	umlModel at: aFMProperty put: (FamixUMLAssociation from: aFMProperty).

]

{ #category : #generating }
FamixUMLDocumentor >> generateRelations: fmClass uml: umlClass [
	"umlClass actually not needed, but kept for coherence with other method names"

	fmClass complexProperties do: [ :rel |
		self generateRelation: rel from: fmClass ].
]

{ #category : #generating }
FamixUMLDocumentor >> generateSuperClasses: aFM3Class [
	
	aFM3Class isFM3Trait
	ifFalse: [self generateClass: aFM3Class superclass].

	aFM3Class implementingClass traits
	do: [ :trait | self generateClass: (self fm3DescriptionOf: trait) ].
]

{ #category : #initialization }
FamixUMLDocumentor >> initialize [

	super initialize.

	"3 seems like a good default maximum size for the models we want to document"
	modelColors := OrderedCollection new: 3.
	umlModel := Dictionary new.
	excludeModelClasses := #(  ).
	self beWithoutStubs.
	shouldGenerateProperties := true
]

{ #category : #accessing }
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
FamixUMLDocumentor >> noProperties [

	shouldGenerateProperties := false
]

{ #category : #api }
FamixUMLDocumentor >> onlyClasses: aCollection [

	onlyModelClasses := aCollection
]

{ #category : #testing }
FamixUMLDocumentor >> shouldGenerateClass: aFMClass [
	"should generate if user asked for stub (except for explicitly excluded classes)
	 or if user asked for this class
	nil parameter could happen with some stub classes"

	aFMClass ifNil: [ ^false ].
	^self isWithStub
		  ifTrue: [ (excludeModelClasses includes: aFMClass implementingClass) not ]
		  ifFalse: [ self userRequestedClass: aFMClass ]
]

{ #category : #private }
FamixUMLDocumentor >> umlClassesDo: aBlock [
	"aBlock takes 2 argument: fmClass and corresponding umlClass.
	It is applied on all mathcing pairs in umlModel"

	^umlModel keysAndValuesDo: [ :fmEntity :umlEntity |
		(umlEntity class = FamixUMLClass)
			ifTrue: [ aBlock value: fmEntity value: umlEntity ]
	]
]

{ #category : #accessing }
FamixUMLDocumentor >> umlEntities [

	^umlModel values
]

{ #category : #testing }
FamixUMLDocumentor >> umlModelIncludes: aFM3Entity [

	^umlModel at: aFM3Entity ifPresent: [true] ifAbsent: [false]
]

{ #category : #testing }
FamixUMLDocumentor >> umlModelIncludesRelation: aFMRelation [

	(self umlModelIncludes: aFMRelation) ifTrue: [ ^true ].
	
	aFMRelation hasOpposite ifFalse: [ ^false ].
	
	^(self umlModelIncludes: aFMRelation opposite)
]

{ #category : #testing }
FamixUMLDocumentor >> userRequestedClass: aFMClass [
	"requested by user if:
	 - is not explicitly excluded
	 - is in onlyClasses
	 - onlyClasses is empty and is a class from one of requested models"

	(excludeModelClasses includes: aFMClass implementingClass)
		ifTrue: [ ^false ].
	
	onlyModelClasses
		ifNotNil: [ ^onlyModelClasses includes: aFMClass implementingClass ].

	^modelColors anySatisfy: [:modelColor | (self fm3DescriptionOf: modelColor key) package classes includes: aFMClass]
		

]
