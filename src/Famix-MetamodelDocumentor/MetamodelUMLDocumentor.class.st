"
A class to create plantUML graphs from a metamodel

A bit different from FmxMBPlantTextVisitor in that it works on the metamodel itself, and not on the builder

currently needs a model to access its metamodel and creates a plantUML class diagram for a collection of classes given to it

```language=Pharo
MetamodelUMLDocumentor new
  model: FAMIXModel ;
  generatePlantUMLWith: { FamixTAccess . FamixTAccessible . FamixTWithAccesses }. 
```

returns a string with a script to feed into PlantUML.com

Other interesting method is: `#generatePlantUMLFile: aFileName with: aCollectionOfClasses` that dumps the PlantUML script into a `aFileName.puml`
"
Class {
	#name : #MetamodelUMLDocumentor,
	#superclass : #Object,
	#instVars : [
		'model',
		'outputStream',
		'classesOfInterest'
	],
	#category : #'Famix-MetamodelDocumentor'
}

{ #category : #generating }
MetamodelUMLDocumentor >> generatePlantUML: aCollection on: aStream [
	outputStream := aStream.
	classesOfInterest := aCollection
		collect: [:stClass | model metamodel descriptionOf: stClass ].

	self plantUMLHeader.
	outputStream cr.
	self generatePlantUMLClasses.
	outputStream cr.
	self generatePlantUMLInheritance.
	outputStream cr.
	self generatePlantUMLRelations.
	outputStream cr.
	self plantUMLFooter.

]

{ #category : #generating }
MetamodelUMLDocumentor >> generatePlantUMLClasses [
	classesOfInterest do: [ :clazz | clazz accept: self ]
]

{ #category : #generating }
MetamodelUMLDocumentor >> generatePlantUMLFile: aString with: aCollection [
	| filename |
	filename := (aString endsWith: self plantUMLExtension)
		ifTrue: [ aString ]
		ifFalse: [ aString , self plantUMLExtension].
	^filename asFileReference writeStreamDo: [ :stream |
		self generatePlantUML: aCollection on: stream.
	] 
]

{ #category : #generating }
MetamodelUMLDocumentor >> generatePlantUMLInheritance [
	classesOfInterest do: [ :clazz | 
			self visitClassInheritances: clazz
	]
]

{ #category : #generating }
MetamodelUMLDocumentor >> generatePlantUMLRelations [
	classesOfInterest do: [ :clazz | 
			self visitClassRelations: clazz
		]
]

{ #category : #generating }
MetamodelUMLDocumentor >> generatePlantUMLWith: aCollection [
	^String streamContents: [ :stream |
		self generatePlantUML: aCollection on: stream.
	] 
]

{ #category : #testing }
MetamodelUMLDocumentor >> isRedundantRelation: aFM3Prop [
	"whena relation has an opposite, we want to display process only one of them (the 'non redundant' one.
	HEre are some rules to decide which one is redudant.
	Some of these rules are pretty arbitrary, but a decision has to be made"
	
	aFM3Prop opposite ifNil: [ ^false ].

	aFM3Prop isDerived ifTrue: [ ^true ].
	aFM3Prop isContainer ifTrue: [ ^false ].

	"don't know what else to test, but a decision has to be made"
	^aFM3Prop name < aFM3Prop opposite name
]

{ #category : #accessing }
MetamodelUMLDocumentor >> model [
	^ model
]

{ #category : #accessing }
MetamodelUMLDocumentor >> model: anObject [
	model := anObject
]

{ #category : #testing }
MetamodelUMLDocumentor >> ofInterest: aFMClass [
	^classesOfInterest includes: aFMClass 
]

{ #category : #accessing }
MetamodelUMLDocumentor >> outputStream [
	^ outputStream
]

{ #category : #accessing }
MetamodelUMLDocumentor >> outputStream: anObject [
	outputStream := anObject
]

{ #category : #private }
MetamodelUMLDocumentor >> plantUMLColorFor: aFMClass [
	^ (aFMClass name first = $T)
		ifTrue: [ 'lightGrey' ]
		ifFalse: [ 'white' ]
]

{ #category : #accessing }
MetamodelUMLDocumentor >> plantUMLExtension [
	^'.puml'
]

{ #category : #private }
MetamodelUMLDocumentor >> plantUMLFooter [
	outputStream nextPutAll:
	'
@enduml
'
]

{ #category : #private }
MetamodelUMLDocumentor >> plantUMLHeader [
	outputStream nextPutAll:
	'@startuml
hide empty members

skinparam class {
  BackgroundColor white
  ArrowColor black
  BorderColor darkGray
}
'
]

{ #category : #private }
MetamodelUMLDocumentor >> plantUMLMarkerFor: aFMClass [
	^(aFMClass name first = $T)
		ifTrue: [ 'T' ]
		ifFalse: [ 'C' ]
]

{ #category : #visiting }
MetamodelUMLDocumentor >> visitClass: aFMClass [
	outputStream
		nextPutAll: 'class ' ;
		nextPutAll: aFMClass name ;
		nextPutAll: ' << (' ;
		nextPutAll: (self plantUMLMarkerFor: aFMClass) ;
		nextPut: $, ;
		nextPutAll: (self plantUMLColorFor: aFMClass) ;
		nextPutAll: ') >> {' ;
		cr.
	aFMClass
		primitiveProperties do: [ :prop | prop accept: self ].
	outputStream
		nextPutAll: '}' ;
		cr.
]

{ #category : #visiting }
MetamodelUMLDocumentor >> visitClassInheritances: aFMClass [
	self visitInheritance: aFMClass superclass sub: aFMClass.
	aFMClass traits do: [ :trait | self visitInheritance: trait sub: aFMClass ]
]

{ #category : #visiting }
MetamodelUMLDocumentor >> visitClassRelations: aFMClass [
	aFMClass
		complexProperties do: [ :rel | self visitRelation: rel ]
]

{ #category : #visiting }
MetamodelUMLDocumentor >> visitDualRelation: aFM3Prop [
	"only called when we already verified that the relation should be processed"
	| opposite |
	opposite := aFM3Prop opposite.

	outputStream
		nextPutAll: aFM3Prop implementingClass name ;
		nextPutAll: ' "' ;
		nextPutAll: opposite name ;
		nextPutAll: '" -- "' ;
		nextPutAll: aFM3Prop name ;
		nextPutAll: '" ' ;
		nextPutAll: aFM3Prop type name ;
		cr
]

{ #category : #visiting }
MetamodelUMLDocumentor >> visitInheritance: aFMSuperClass sub: aFMSubClass [
	(self ofInterest: aFMSuperClass) ifFalse: [ ^ self ].
	(self ofInterest: aFMSubClass) ifFalse: [ ^ self ].
	outputStream
		nextPutAll: aFMSuperClass name ;
		nextPutAll: ' <|-- ' ;
		nextPutAll: aFMSubClass name ;
		cr
]

{ #category : #visiting }
MetamodelUMLDocumentor >> visitProperty: aFMProperty [
	outputStream
		nextPutAll: '  ' ;
		nextPutAll: aFMProperty type name ;
		space ;
		nextPutAll: aFMProperty name ;
		cr
]

{ #category : #visiting }
MetamodelUMLDocumentor >> visitRelation: aFM3Prop [
	(self ofInterest: aFM3Prop type) ifFalse: [ ^ self ].
	(self isRedundantRelation: aFM3Prop) ifTrue: [ ^self ].

	aFM3Prop opposite ifNotNil: [ ^ self visitDualRelation: aFM3Prop ].

	outputStream
		nextPutAll: aFM3Prop implementingClass name ;
		nextPutAll: ' -- "' ;
		nextPutAll: aFM3Prop name ;
		nextPutAll: '" ' ;
		nextPutAll: aFM3Prop type name ;
		cr
]
