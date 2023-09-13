"
Class: FamixMMUMLDocumentor
                                                                                                    

A class to create plantUML graphs from a metamodel

Different from FmxMBPlantTextVisitor in that it works on the metamodel itself, and not on the builder

Currently needs a model to access its metamodel and creates a plantUML class diagram for a collection of classes given to it

```language=Pharo
FamixMMUMLDocumentor new
 model: FAMIXModel ;
 generatePlantUMLWith: { FamixTAccess . FamixTAccessible . FamixTWithAccesses }. 
```

returns a string with a script to feed into PlantUML.com
The scripts displays the 3 classes to generate with their inter-relationships and properties

Can also display  ""external classes"" (kindof ""stubs""): entities related to the ones we are interested in, but not in the list of classes to generate.
For this, use #beWithStub.

Other interesting method is: #generatePlantUMLFile: aFileName with: aCollectionOfClasses that dumps the PlantUML script into a aFileName.puml

If you don't know the model you want to analyze, I can generate the associated plantUML code on all these entities via generatePlantUMLModel or generatePlantUMLModelFile:.

```language=Pharo
FamixMMUMLDocumentor new
 model: FAMIXModel ;
 generatePlantUMLModel.
```
"
Class {
	#name : #FamixMMUMLDocumentor,
	#superclass : #FamixMMUMLAbstractDocumentor,
	#instVars : [
		'classesOfNoInterest',
		'umlModel',
		'backend',
		'outputStream'
	],
	#category : #'Famix-MetamodelDocumentor-Generate'
}

{ #category : #accessing }
FamixMMUMLDocumentor >> backend [

	^ backend
]

{ #category : #accessing }
FamixMMUMLDocumentor >> backend: anObject [

	backend := anObject
]

{ #category : #visiting }
FamixMMUMLDocumentor >> checkExternalClass: aFM3Class [

	(self isOfInterest: aFM3Class) ifFalse: [
		externalClasses add: aFM3Class ]
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generate [

	models ifEmpty: [ Error signal: 'no meta-model(s) to work on' ].

	classesOfInterest := (models flatCollect: [ :modelColorTuple |
		(self findDescriptionOf: modelColorTuple model) package classes ] as: Set).

	externalClasses := Set new.
	
	classesOfInterest do: [ :c | c accept: self ].
	externalClasses do: [ :ec | ec accept: self ].

	self backend generate: self umlModel on: outputStream.

	^outputStream
		close ;
		contents

]

{ #category : #generating }
FamixMMUMLDocumentor >> generateClassesOfNoInterest: aFM3Class [

	umlModel
		at: aFM3Class
		put: ((FamixMMUMLClass from: aFM3Class)
			hide: true ;
			yourself)
	"self generateClassName: aFM3Class"
]

{ #category : #generating }
FamixMMUMLDocumentor >> generateExternalClass: aFM3Class [

	umlModel at: aFM3Class put: (FamixMMUMLClass from: aFM3Class)
	"self generateClassName: aFM3Class.
	(self isOfInterest: aFM3Class) ifFalse: [ 
		outputStream nextPutAll: 'External>>' ]"
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUML: aCollection onStream: aStream [
	self onStream: aStream.
	self with: aCollection.
	^self generate
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLClasses [
	classesOfInterest do: [ :clazz | clazz accept: self ]
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLExternalClasses [
	externalClasses do: [ :clazz |
		self generateExternalClass: clazz ]
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLFile: aString with: aCollection [
	self onFile: aString.
	self with: aCollection.
	^self generate
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLHideClassesOfNoInterest [
	classesOfNoInterest do: [:clazz | self generateClassesOfNoInterest: clazz]
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLInheritance [

	| aVisitor |
	aVisitor := FamixMMUMLInheritanceDocumentor new
		            backend: backend ;
		            classesOfInterest: classesOfInterest;
		            externalClasses: externalClasses;
		            withStub: withStub;
		            models: self models.
	classesOfInterest do: [ :clazz | clazz accept: aVisitor ]
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModel [

	^self generate
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelFile: aString [
	self onFile: aString.

	^self generate
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelFile: aString without: aCollection [
	self onFile: aString.
	^self generatePlantUMLModelWithout: aCollection
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelOnStream: aStream [
	self onStream: aStream.
	^self generatePlantUMLModel

]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelWithout: aCollection [
	self without: aCollection.
	^self generatePlantUMLModel
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelWithout: aCollection onStream: aStream [
	self onStream: aStream.
	^self generatePlantUMLModelWithout: aCollection
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLRelations [
	classesOfInterest do: [ :clazz | 
			self visitClassRelations: clazz
		]
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLWith: aCollection [
	self with: aCollection.
	^self generate
]

{ #category : #generating }
FamixMMUMLDocumentor >> generateRelationSource: aFM3Prop [
	self generateClassName: aFM3Prop mmClass
]

{ #category : #generating }
FamixMMUMLDocumentor >> generateRelationSourceRole: aFM3Prop [
	outputStream
		nextPut: $".
	aFM3Prop isMultivalued
		ifTrue: [ outputStream nextPutAll: ' *' ].
	outputStream
		nextPutAll: aFM3Prop name;
		nextPut: $"
]

{ #category : #generating }
FamixMMUMLDocumentor >> generateRelationSymbol: aFM3Prop [
	| symbol |
	symbol :=
		aFM3Prop isContainer "#isContainer means the property *points to* the container"
			ifTrue: [ '--o' ]
			ifFalse: [
				((aFM3Prop hasOpposite) and: [ aFM3Prop opposite isContainer ])
				ifTrue: [ 'o--' ]
				ifFalse: [ '--' ]
		].
	outputStream
		nextPutAll: symbol
]

{ #category : #generating }
FamixMMUMLDocumentor >> generateRelationTarget: aFM3Prop [
	self generateClassName: aFM3Prop type
]

{ #category : #generating }
FamixMMUMLDocumentor >> generateRelationTargetRole: aFM3Prop [
	outputStream
		nextPut: $".
	(aFM3Prop hasOpposite and: aFM3Prop opposite isMultivalued)
		ifTrue: [ outputStream nextPutAll: ' *' ].
	outputStream
		nextPutAll: aFM3Prop opposite name ;
		nextPut: $"
]

{ #category : #initialization }
FamixMMUMLDocumentor >> initialize [ 
	super initialize.

	umlModel := Dictionary new.
	self onStream: (WriteStream with: String new).
	self plantUMLBackend
]

{ #category : #testing }
FamixMMUMLDocumentor >> isInUMLModel: aFM3Entity [

	^umlModel at: aFM3Entity ifPresent: [true] ifAbsent: [false]
]

{ #category : #testing }
FamixMMUMLDocumentor >> isRedundantRelation: aFM3Prop [

	(self isInUMLModel: aFM3Prop) ifTrue: [ true ].
	
	aFM3Prop hasOpposite ifFalse: [ false ].
	
	^(self isInUMLModel: aFM3Prop opposite)
]

{ #category : #testing }
FamixMMUMLDocumentor >> isTrait: aFMClass [
	^aFMClass implementingClass isTrait
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> mermaidBackend [

	backend := FamixMMUMLMermaidBackend new
]

{ #category : #accessing }
FamixMMUMLDocumentor >> onFile: aString [
	| filename |
	filename := (aString endsWith: self plantUMLExtension)
		ifTrue: [ aString ]
		ifFalse: [ aString , self plantUMLExtension].

	self onStream: filename asFileReference writeStream
]

{ #category : #accessing }
FamixMMUMLDocumentor >> onStream: aStream [
	outputStream := aStream
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> plantUMLBackend [

	backend := FamixMMUMLPlantUMLBackend new
]

{ #category : #private }
FamixMMUMLDocumentor >> plantUMLBackgroundColorFor: aFMClass [
	^ (self tupleForEntity: aFMClass) color asHexString
]

{ #category : #private }
FamixMMUMLDocumentor >> plantUMLColorFor: aFMClass [
	^ (self isTrait: aFMClass)
		ifTrue: [ 'lightGrey' ]
		ifFalse: [ 'white' ]
]

{ #category : #accessing }
FamixMMUMLDocumentor >> plantUMLExtension [
	^'.puml'
]

{ #category : #private }
FamixMMUMLDocumentor >> plantUMLFooter [
	outputStream nextPutAll:
	'
@enduml
'
]

{ #category : #private }
FamixMMUMLDocumentor >> plantUMLHeader [
	outputStream nextPutAll:
	'@startuml'; cr.

	prefs do: [:p | outputStream nextPutAll: p; cr].

	outputStream nextPutAll: 'hide empty members
skinparam class {
  BackgroundColor white
  ArrowColor black
  BorderColor darkGray
  BackgroundColor<<External>> LightYellow
  BorderColor<<External>> LightGray
}
'.
]

{ #category : #private }
FamixMMUMLDocumentor >> plantUMLMarkerFor: aFMClass [
	^(self isTrait: aFMClass)
		ifTrue: [ 'T' ]
		ifFalse: [ 'C' ]
]

{ #category : #private }
FamixMMUMLDocumentor >> tupleForEntity: aFM3Class [

	^ models detect: [ :model | (self findDescriptionOf: model model) package = aFM3Class package ]
]

{ #category : #accessing }
FamixMMUMLDocumentor >> umlClassNamed: aString [
	^umlModel values detect: [ :each |
		(each class = FamixMMUMLClass) and:
		[ each name = aString ]
	]
]

{ #category : #accessing }
FamixMMUMLDocumentor >> umlModel [
	^umlModel values
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitClass: aFM3Class [

	| entity |
	(self isInUMLModel: aFM3Class) ifTrue: [ ^self ].

	entity := (FamixMMUMLClass from: aFM3Class)
		          color: (self plantUMLColorFor: aFM3Class);
		          yourself.
	"self plantUMLBackgroundColorFor: aFMClass"
	self checkExternalClass: aFM3Class.

	entity properties:
		(aFM3Class primitiveProperties collect: [ :prop | prop accept: self ]).

	umlModel at: aFM3Class put: entity.

	^entity
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitClassInheritances: aFM3Class [

	self checkExternalClass: aFM3Class.
	self visitInheritance: aFM3Class superclass sub: aFM3Class.
	aFM3Class traits do: [ :trait | self visitInheritance: trait sub: aFM3Class ]
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitClassRelations: aFM3Class [
	
	self checkExternalClass: aFM3Class.
	aFM3Class
		complexProperties do: [ :rel | self visitRelation: rel ]
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitInheritance: aFMSuperClass sub: aFMSubClass [
	(self relationEndOfInterest: aFMSuperClass) ifFalse: [ ^ self ].
	(self relationEndOfInterest: aFMSubClass) ifFalse: [ ^ self ].

	umlModel
		at: (aFMSubClass -> aFMSuperClass)
		put: (FamixMMUMLInheritance from: aFMSubClass to: aFMSuperClass)
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitProperty: aFMProperty [

	^FamixMMUMLProperty from: aFMProperty
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitRelation: aFM3Prop [
	(self relationEndOfInterest: aFM3Prop mmClass) ifFalse: [ ^ self ].
	(self relationEndOfInterest: aFM3Prop type) ifFalse: [ ^ self ].
	(self isRedundantRelation: aFM3Prop) ifTrue: [ ^ self ].

	umlModel at: aFM3Prop put: (FamixMMUMLAssociation from: aFM3Prop).

	aFM3Prop mmClass accept: self.
	aFM3Prop type accept: self.
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitTrait: aFMTrait [

	^self visitClass: aFMTrait
]

{ #category : #accessing }
FamixMMUMLDocumentor >> with: aCollection [
	classesOfInterest := aCollection
		collect: [:stClass | self findDescriptionOf: stClass ].
]

{ #category : #accessing }
FamixMMUMLDocumentor >> without: aCollection [
	classesOfNoInterest := aCollection
		collect: [:stClass | self findDescriptionOf: stClass ].


]
