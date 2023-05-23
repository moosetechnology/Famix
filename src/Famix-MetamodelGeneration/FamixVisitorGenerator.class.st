"
A tool to generate an abstract visitor for a Famix or FAST metamodel.

1. Takes a root class (eg. FASTJavaEntity), generates an AbstractVisitor for this metamodel.
2. For all subclasses Xyz of the root entity generates a #visitXyz: method
3. In all subclasses of the root entity, adds an extension #accept: that calls the proper #visitXyz: method

generic #accept: method in Xyz class:
```
accept: aVisitor
	<generated>

	aVisitor visitXyz: self
```

Generic #visitXyz: method calls first the visit method for the super class, then sends accept for each children accessor of the class (see `#isChildSelecto:in:`)
```
visitXyz: aNode
	<generated>

	super visitSuperOfXyz: aNode.
	aNode childAccessor1 accept: self.
	aNode childAccessor2 accept: self.
```
"
Class {
	#name : #FamixVisitorGenerator,
	#superclass : #Object,
	#instVars : [
		'rootEntityClass',
		'visitorClass',
		'packageName'
	],
	#category : #'Famix-MetamodelGeneration'
}

{ #category : #running }
FamixVisitorGenerator >> acceptMethodFor: aClass [
	| code |
	code := String streamContents: [ :str |
		str
			<< 'accept: aVisitor' ;
			cr.
		self generatedPragmaOn: str.
		str	<< 	'	aVisitor '.
		self visitMethodName: aClass on: str.
		str
			<< ' self' ;
			cr
		].

	aClass compile: code classified: '*' , packageName 

]

{ #category : #'private - emitting code' }
FamixVisitorGenerator >> allChildrenAccessors: aClass [
	"Finds all children accessors on instance variable (not inherited) of aClass"
	
	^aClass instVarNames select: [ :instVarName | self isChildSelector: instVarName in: aClass ]
]

{ #category : #'private - emitting code' }
FamixVisitorGenerator >> generatedPragmaOn: aStream [
	aStream
		<< '	<generated>' ;
		cr ;
		cr
]

{ #category : #'private - emitting code' }
FamixVisitorGenerator >> isChildSelector: aSelector in: aClass [
	"Children accessor must not have the pragma <container>"
	
	^aClass
		compiledMethodAt: aSelector
		ifPresent: [ :compiledMethod |
			(compiledMethod pragmaAt: #container)
				ifNil: [ true ]
				ifNotNil: [ false ]
		]
		ifAbsent: [ false ]
]

{ #category : #accessing }
FamixVisitorGenerator >> packageName [

	^ packageName
]

{ #category : #accessing }
FamixVisitorGenerator >> packageName: anObject [

	packageName := anObject
]

{ #category : #accessing }
FamixVisitorGenerator >> rootEntityClass [

	^ rootEntityClass
]

{ #category : #accessing }
FamixVisitorGenerator >> rootEntityClass: anObject [

	rootEntityClass := anObject
]

{ #category : #running }
FamixVisitorGenerator >> run [
	rootEntityClass ifNil: [ Notification signal: 'rootEntityClass not set' ].
	visitorClass ifNil: [ Notification signal: 'visitorClass not set' ].
	packageName ifNil: [ Notification signal: 'packageName not set' ].

	rootEntityClass withAllSubclassesDo: [ :subclass |
		self acceptMethodFor: subclass.
		self visitMethodFor: subclass.
	]
]

{ #category : #'private - emitting code' }
FamixVisitorGenerator >> visitChildrenOf: aClass on: aStream [
	"for each accessor on an instance variable xyz, creates a line:
	 '  aNode xyz accept: self.' "

	^(self allChildrenAccessors: aClass) do: [ :childSelector |
		aStream
			<< '	aNode ' ;
			<< childSelector ;
			<< ' accept: self.' ;
			cr.
	]
]

{ #category : #running }
FamixVisitorGenerator >> visitMethodFor: aClass [
	| code |
	code := String streamContents: [ :str |
		self visitMethodName: aClass on: str.
		str << ' aNode' ; cr.
		self generatedPragmaOn: str.
		self visitSuperclass: aClass on: str.
		self visitChildrenOf: aClass on: str
	].

	visitorClass compile: code classified: 'visiting'
]

{ #category : #'private - emitting code' }
FamixVisitorGenerator >> visitMethodName: aClass on: aStream [
	^aStream
		<< 'visit' ;
		<< aClass name ;
		<< $:
]

{ #category : #'private - emitting code' }
FamixVisitorGenerator >> visitSuperclass: aClass on: aStream [
	(aClass = rootEntityClass) ifTrue: [ ^self ].

	aStream << '	super '.
	self visitMethodName: aClass superclass on: aStream.
	aStream
		<< ' aNode.' ;
		cr. 

]

{ #category : #accessing }
FamixVisitorGenerator >> visitorClass [

	^ visitorClass
]

{ #category : #accessing }
FamixVisitorGenerator >> visitorClass: anObject [

	visitorClass := anObject
]
