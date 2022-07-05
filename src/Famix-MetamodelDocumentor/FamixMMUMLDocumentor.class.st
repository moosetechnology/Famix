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
		'classesOfNoInterest'
	],
	#category : #'Famix-MetamodelDocumentor'
}

{ #category : #generating }
FamixMMUMLDocumentor >> generateClassesOfNoInterest: aFM3Class [
	outputStream nextPutAll: 'hide '.
		self generateClassName: aFM3Class.
	outputStream cr.
]

{ #category : #generating }
FamixMMUMLDocumentor >> generateExternalClass: aFM3Class [

	outputStream nextPutAll: 'class '.
	self generateClassName: aFM3Class.
	(self ofInterest: aFM3Class) ifFalse: [ 
		outputStream nextPutAll: ' <<'.
		aFM3Class isFM3Class
			ifTrue: [ outputStream nextPutAll: '(C,LightYellow)' ]
			ifFalse: [ outputStream nextPutAll: '(T,LightYellow)' ].
		outputStream nextPutAll: 'External>>' ].
	outputStream cr
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUML: aCollection onStream: aStream [
	outputStream := aStream.
	classesOfInterest := aCollection
		collect: [:stClass | self findDescriptionOf: stClass ].
	externalClasses := Set new.

	self plantUMLHeader.
	outputStream cr.
	self generatePlantUMLClasses.
	outputStream cr.
	self generatePlantUMLInheritance.
	outputStream cr.
	self generatePlantUMLRelations.
	outputStream cr.
	self generatePlantUMLExternalClasses.
	outputStream cr.
	self plantUMLFooter.

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
	| filename |
	filename := (aString endsWith: self plantUMLExtension)
		ifTrue: [ aString ]
		ifFalse: [ aString , self plantUMLExtension].
	^filename asFileReference writeStreamDo: [ :stream |
		self generatePlantUML: aCollection onStream: stream.
	] 
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLHideClassesOfNoInterest [
	classesOfNoInterest do: [:clazz | self generateClassesOfNoInterest: clazz]
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLInheritance [

	| aVisitor |
	aVisitor := FamixMMUMLInheritanceDocumentor new
		            outputStream: outputStream;
		            classesOfInterest: classesOfInterest;
		            externalClasses: externalClasses;
		            withStub: withStub;
		            models: self models.
	classesOfInterest do: [ :clazz | clazz accept: aVisitor ]
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModel [

	| aStream |
	aStream := ReadWriteStream with: (String new).
	self generatePlantUMLModelOnStream: aStream.
	^ outputStream contents 
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelFile: aString [
	| filename |
	filename := (aString endsWith: self plantUMLExtension)
		ifTrue: [ aString ]
		ifFalse: [ aString , self plantUMLExtension].
	^filename asFileReference writeStreamDo: [ :stream |
		self generatePlantUMLModelOnStream: stream.
	] 
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelFile: aString without: aCollection [
	| filename |
	filename := (aString endsWith: self plantUMLExtension)
		ifTrue: [ aString ]
		ifFalse: [ aString , self plantUMLExtension].
	^filename asFileReference writeStreamDo: [ :stream |
		self generatePlantUMLModelWithout: aCollection onStream: stream.
	] 
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelOnStream: aStream [

	outputStream := aStream.
	classesOfInterest := models flatCollect: [ :model | (self findDescriptionOf: model model) package classes ] as: Set.
	externalClasses := Set new.

	self plantUMLHeader.
	outputStream cr.
	self generatePlantUMLClasses.
	outputStream cr.
	self generatePlantUMLInheritance.
	outputStream cr.
	self generatePlantUMLRelations.
	outputStream cr.
	self generatePlantUMLExternalClasses.
	outputStream cr.
	self plantUMLFooter
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelWithout: aCollection [

	| aStream |
	aStream := ReadWriteStream with: String new.

	aCollection isEmpty
		ifTrue: [ self generatePlantUMLModelOnStream: aStream ]
		ifFalse: [ 
		self generatePlantUMLModelWithout: aCollection onStream: aStream ].
	^ outputStream contents
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLModelWithout: aCollection onStream: aStream [

	outputStream := aStream.
	classesOfNoInterest := aCollection
		collect: [:stClass | self findDescriptionOf: stClass ].
	classesOfInterest := models flatCollect: [ :model | (self findDescriptionOf: model model) package classes ] as: Set..
	externalClasses := Set new.

	self plantUMLHeader.
	outputStream cr.
	self generatePlantUMLClasses.
	outputStream cr.
	self generatePlantUMLInheritance.
	outputStream cr.
	self generatePlantUMLRelations.
	outputStream cr.
	self generatePlantUMLExternalClasses.
	outputStream cr.
	self generatePlantUMLHideClassesOfNoInterest.
	outputStream cr.
	self plantUMLFooter
]

{ #category : #generating }
FamixMMUMLDocumentor >> generatePlantUMLRelations [
	classesOfInterest do: [ :clazz | 
			self visitClassRelations: clazz
		]
]

{ #category : #'api - generation' }
FamixMMUMLDocumentor >> generatePlantUMLWith: aCollection [
	^String streamContents: [ :stream |
		self generatePlantUML: aCollection onStream: stream.
	] 
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

{ #category : #testing }
FamixMMUMLDocumentor >> isRedundantRelation: aFM3Prop [
	"whena relation has an opposite, we want to display process only one of them (the 'non redundant' one.
	HEre are some rules to decide which one is redudant.
	Some of these rules are pretty arbitrary, but a decision has to be made"
	
	aFM3Prop opposite ifNil: [ ^false ].

	aFM3Prop isDerived ifTrue: [ ^true ].
	aFM3Prop isContainer ifTrue: [ ^false ].

	"check whether opposite is redundant"
	aFM3Prop opposite isDerived ifTrue: [ ^false ].
	aFM3Prop isContainer ifTrue: [ ^true ].

	"don't know what else to test, but a decision has to be made"
	^aFM3Prop name < aFM3Prop opposite name
]

{ #category : #testing }
FamixMMUMLDocumentor >> isTrait: aFMClass [
	^aFMClass implementingClass isTrait
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

{ #category : #visiting }
FamixMMUMLDocumentor >> visitClass: aFMClass [
	outputStream
		nextPutAll: 'class ' ;
		nextPutAll: aFMClass name ;
		nextPutAll: ' << (' ;
		nextPutAll: (self plantUMLMarkerFor: aFMClass) ;
		nextPut: $, ;
		nextPutAll: (self plantUMLColorFor: aFMClass) ;
		nextPutAll: ') >>' ;
		nextPutAll: ' #';
		nextPutAll: (self plantUMLBackgroundColorFor: aFMClass) ;
		nextPutAll: ' {';
		cr.
	aFMClass
		primitiveProperties do: [ :prop | prop accept: self ].
	outputStream
		nextPutAll: '}' ;
		cr.
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitClassInheritances: aFMClass [
	self visitInheritance: aFMClass superclass sub: aFMClass.
	aFMClass traits do: [ :trait | self visitInheritance: trait sub: aFMClass ]
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitClassRelations: aFMClass [
	aFMClass
		complexProperties do: [ :rel | self visitRelation: rel ]
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitInheritance: aFMSuperClass sub: aFMSubClass [
	(self relationEndOfInterest: aFMSuperClass) ifFalse: [ ^ self ].
	(self relationEndOfInterest: aFMSubClass) ifFalse: [ ^ self ].

	self generateClassName: aFMSuperClass.
	outputStream nextPutAll: ' <|-- '.
	self generateClassName: aFMSubClass.
	outputStream cr
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitProperty: aFMProperty [
	outputStream
		nextPutAll: '  ' ;
		nextPutAll: aFMProperty type name ;
		space ;
		nextPutAll: aFMProperty name ;
		cr
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitRelation: aFM3Prop [
	(self relationEndOfInterest: aFM3Prop mmClass)
		ifFalse: [ ^ self ].
	(self relationEndOfInterest: aFM3Prop type)
		ifFalse: [ ^ self ].

	(self isRedundantRelation: aFM3Prop) ifTrue: [ ^ self ].

	self generateRelationSource: aFM3Prop.
	outputStream space.
	aFM3Prop opposite ifNotNil: [
		self generateRelationTargetRole: aFM3Prop.
		outputStream space.
	].
	self generateRelationSymbol: aFM3Prop.
	outputStream space.
	self generateRelationSourceRole: aFM3Prop.
	outputStream space.
	self generateRelationTarget: aFM3Prop.
	outputStream cr
]

{ #category : #visiting }
FamixMMUMLDocumentor >> visitTrait: aFMTrait [
	outputStream
		nextPutAll: 'class ' ;
		nextPutAll: aFMTrait name ;
		nextPutAll: ' << (' ;
		nextPutAll: (self plantUMLMarkerFor: aFMTrait) ;
		nextPut: $, ;
		nextPutAll: (self plantUMLColorFor: aFMTrait) ;
		nextPutAll: ') >>' ;
		nextPutAll: ' #';
		nextPutAll: (self plantUMLBackgroundColorFor: aFMTrait) ;
		nextPutAll: ' {';
		cr.
	aFMTrait 
		primitiveProperties do: [ :prop | prop accept: self ].
	outputStream
		nextPutAll: '}' ;
		cr.
]
