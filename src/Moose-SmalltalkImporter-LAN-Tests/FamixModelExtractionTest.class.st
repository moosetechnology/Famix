Class {
	#name : #FamixModelExtractionTest,
	#superclass : #LANAbstractImportTest,
	#instVars : [
		'nodeName',
		'nextNode',
		'serverType',
		'acceptNode',
		'canOriginateNode',
		'acceptServer',
		'canOutputNode',
		'canOutputServer',
		'initializeNode',
		'methodWithEmptyBodyNode',
		'outputServer',
		'nameNode',
		'nameNodeColon',
		'nextNodeColon',
		'printOnNode',
		'sendNode',
		'newNodeClass',
		'msePrinterClass',
		'nextNodeMethod'
	],
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #auxiliary }
FamixModelExtractionTest >> assignAttributes [
	nodeName := self model entityNamed: 'Smalltalk.LANNode.name'.
	nextNode := self model entityNamed: 'Smalltalk.LANNode.nextNode'.
	serverType := self model entityNamed: 'Smalltalk.LANOutputServer.serverType'
]

{ #category : #auxiliary }
FamixModelExtractionTest >> assignClasses [
	msePrinterClass := self model entityNamed: LANPrintServer mooseName
]

{ #category : #auxiliary }
FamixModelExtractionTest >> assignMethods [
	methodWithEmptyBodyNode := self model entityNamed: 'Smalltalk.LANNode.methodWithEmptyBody()'.
	outputServer := self model entityNamed: 'Smalltalk.LANOutputServer.output:(Object)'.
	acceptServer := self model entityNamed: 'Smalltalk.LANOutputServer.accept:(Object)'.
	acceptNode := self model entityNamed: 'Smalltalk.LANNode.accept:(Object)'.
	canOutputServer := self model entityNamed: 'Smalltalk.LANOutputServer.canOutput()'.
	canOutputNode := self model entityNamed: 'Smalltalk.LANNode.canOutput()'.
	nameNode := self model entityNamed: 'Smalltalk.LANNode.name()'.
	nameNodeColon := self model entityNamed: 'Smalltalk.LANNode.name:(Object)'.
	nextNodeMethod := self model entityNamed: 'Smalltalk.LANNode.nextNode()'.
	nextNodeColon := self model entityNamed: 'Smalltalk.LANNode.nextNode:(Object)'.
	initializeNode := self model entityNamed: 'Smalltalk.LANNode.initialize()'.
	printOnNode := self model entityNamed: 'Smalltalk.LANNode.printOn:(Object)'.
	sendNode := self model entityNamed: 'Smalltalk.LANNode.send:(Object)'.
	canOriginateNode := self model entityNamed: 'Smalltalk.LANNode.canOriginate()'.
	newNodeClass := self model entityNamed: 'Smalltalk.LANNode.new()'
]

{ #category : #running }
FamixModelExtractionTest >> setUp [
	super setUp.
	self assignClasses.
	self assignAttributes.
	self assignMethods
]

{ #category : #tests }
FamixModelExtractionTest >> testAccessesFromAndToShouldNotBeNil [
	| accesses |
	accesses := self model allAccesses.
	self assertEmpty: (accesses select: [ :a | a source isNil ]).
	self assertEmpty: (accesses select: [ :a | a target isNil ])
]

{ #category : #tests }
FamixModelExtractionTest >> testAccessesReification [
	| accesses |
	accesses := self model allAccesses.
	self denyEmpty: accesses.
	accesses do: [ :each | self assert: (each accessor usesFamixTrait: FamixTMethod) ]
]

{ #category : #tests }
FamixModelExtractionTest >> testAllFormalParameters [
	self
		assert: self model allParameters size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each parameters size ]).
	self
		assert: self model allParameters size
		equals: (self model allMethods flatCollect: [ :each | each parameters ]) size
]

{ #category : #tests }
FamixModelExtractionTest >> testAllHierarchyMethods [ 
	| allHierarchyMethods |
	allHierarchyMethods := msePrinterClass allHierarchyMethods.
	self assert: allHierarchyMethods size equals: 15.
	self assert: (allHierarchyMethods includes: outputServer).
	self assert: (allHierarchyMethods includes: acceptServer).
	self assert: (allHierarchyMethods includes: acceptNode).
	self assert: (allHierarchyMethods includes: canOutputServer).
	self assert: (allHierarchyMethods includes: canOutputNode).	"overridden in OutputServer"
	self assert: (allHierarchyMethods includes: nameNode).
	self assert: (allHierarchyMethods includes: nameNodeColon).
	self assert: (allHierarchyMethods includes: nextNodeMethod).
	self assert: (allHierarchyMethods includes: nextNodeColon).
	self assert: (allHierarchyMethods includes: initializeNode).
	self assert: (allHierarchyMethods includes: printOnNode).
	self assert: (allHierarchyMethods includes: sendNode).
	self assert: (allHierarchyMethods includes: canOriginateNode).
	self assert: (allHierarchyMethods includes: methodWithEmptyBodyNode).
	self deny: (allHierarchyMethods includes: newNodeClass)	"class method of Node"
]

{ #category : #tests }
FamixModelExtractionTest >> testAllLocalVariables [
	self
		assert: self model allLocalVariables size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each localVariables size ]).
	self
		assert: self model allLocalVariables size
		equals: (self model allMethods flatCollect: [ :each | each localVariables ]) size
]

{ #category : #tests }
FamixModelExtractionTest >> testAllOutgoingAccesses [
	self
		assert: self model allAccesses size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each accesses size ])
]

{ #category : #tests }
FamixModelExtractionTest >> testAllOutgoingInvocations [
	self
		assert: self model allInvocations size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each outgoingInvocations size ])
]

{ #category : #tests }
FamixModelExtractionTest >> testFlatCollect [
	self assert: self model allMethods size equals: (self model allClasses flatCollect: #methods) size.
	self assert: self model allInvocations size equals: (self model allMethods flatCollect: #outgoingInvocations) size.
	self assert: self model allAccesses size equals: (self model allMethods flatCollect: #accesses) size
]

{ #category : #tests }
FamixModelExtractionTest >> testHasEmptyBody [
	self assert: methodWithEmptyBodyNode hasEmptyBody.
	self deny: acceptNode hasEmptyBody
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedAttributes [

	| inheritedAtts |
	inheritedAtts := msePrinterClass inheritedAttributes.
	self assert: msePrinterClass superclassHierarchy size equals: 5.
	self assert: inheritedAtts size equals: (self totalNumberOfAttributesFor: LANPrintServer superclass).
	self assert: (inheritedAtts reject: [ :each | each isClassSide ]) size equals: 5.
	self assert: (inheritedAtts includes: nodeName).
	self assert: (inheritedAtts includes: nextNode).
	self assert: (inheritedAtts includes: serverType).
	"In P12 DependentFileds class var gor removed from Object. Remove this condition once P12 will be the minimal version used for this project."
	self assert: (inheritedAtts select: [ :each | each isClassSide ]) size equals: (SystemVersion current major < 12
			 ifTrue: [ 1 ]
			 ifFalse: [ 0 ])
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedMethods [
	| inheritedMethods |
	inheritedMethods := msePrinterClass inheritedMethods.
	self assert: inheritedMethods size equals: 12.
	self assert: (inheritedMethods includes: acceptServer).
	self assert: (inheritedMethods includes: canOutputServer).
	self assert: (inheritedMethods includes: nameNode).
	self assert: (inheritedMethods includes: nameNodeColon).
	self assert: (inheritedMethods includes: nextNodeMethod).
	self assert: (inheritedMethods includes: nextNodeColon).
	self assert: (inheritedMethods includes: initializeNode).
	self assert: (inheritedMethods includes: printOnNode).
	self assert: (inheritedMethods includes: sendNode).
	self assert: (inheritedMethods includes: canOriginateNode).
	self assert: (inheritedMethods includes: methodWithEmptyBodyNode).
	self deny: (inheritedMethods includes: newNodeClass)	"class method of Node"
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedSignatures [
	"Note: non-ST features like private methods and multiple inheritance issues for C++ (and Java
	 interfaces) are not (yet) tested"

	| inheritedSignatures |
	inheritedSignatures := (self model entityNamed: LANPrintServer mooseName) inheritedSignatures.
	#(#output: #accept: #canOutput #name #name: #nextNode #nextNode: #initialize #printOn: #send: #canOriginate #methodWithEmptyBody)
		do: [ :each | self assert: (inheritedSignatures contains: [ :sign | '*' , each , '*' match: sign ]) ].
	self assert: inheritedSignatures size equals: (LANOutputServer selectors , LANNode selectors) asSet size
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedSignaturesToMethod [
	"Note: non-ST features like private methods and multiple inheritance issues for C++ (and Java
	 interfaces) are not (yet) tested"

	| inheritedSignatures |
	inheritedSignatures := msePrinterClass inheritedSignaturesToMethod.
	self assert: (inheritedSignatures at: #'output:(Object)') equals: outputServer.
	self assert: (inheritedSignatures at: #'canOutput()') equals: canOutputServer.
	self assert: (inheritedSignatures at: #'name()') equals: nameNode.
	self assert: (inheritedSignatures at: #'name:(Object)') equals: nameNodeColon.
	self assert: (inheritedSignatures at: #'nextNode()') equals: nextNodeMethod.
	self assert: (inheritedSignatures at: #'nextNode:(Object)') equals: nextNodeColon.
	self assert: (inheritedSignatures at: #'initialize()') equals: initializeNode.
	self assert: (inheritedSignatures at: #'printOn:(Object)') equals: printOnNode.
	self assert: (inheritedSignatures at: #'send:(Object)') equals: sendNode.
	self assert: (inheritedSignatures at: #'canOriginate()') equals: canOriginateNode.
	self assert: (inheritedSignatures at: #'methodWithEmptyBody()') equals: methodWithEmptyBodyNode.
	self assert: (inheritedSignatures at: #'accept:(Object)') equals: acceptServer.
	self assert: inheritedSignatures size equals: 13
]

{ #category : #tests }
FamixModelExtractionTest >> testIsConstructor [
	self assert: (self model entityNamed: (LANNode class>>#new) mooseName) isConstructor
]

{ #category : #tests }
FamixModelExtractionTest >> testIsSide [
	| aFamixClass |
	aFamixClass := self model entityNamed: LANFileServer class mooseName.
	self assert: aFamixClass isClassSide.
	self deny: aFamixClass isInstanceSide.
	aFamixClass := self model entityNamed: LANFileServer mooseName.
	self deny: aFamixClass isClassSide.
	self assert: aFamixClass isInstanceSide
]

{ #category : #tests }
FamixModelExtractionTest >> testModelDoesNotContainDuplicateSharedVars [
	self assert: (self model entities select: [ :e | e name = 'MySharedVariable' ]) size equals: 1
]

{ #category : #tests }
FamixModelExtractionTest >> testNameAndUniqueNameForNotNamed [
	| mseMethod |
	mseMethod := self model entityNamed: 'Smalltalk.LANNode.printOn:(Object)'.
	self assert: (mseMethod outgoingInvocations anySatisfy: [:each | each signature = #'printString()'])
]

{ #category : #tests }
FamixModelExtractionTest >> testNumberOfFormalParameters [
	self assert: acceptNode numberOfParameters equals: 1.
	self assert: canOriginateNode numberOfParameters equals: 0
]

{ #category : #tests }
FamixModelExtractionTest >> testReferenceModel [
	self assert: self model mooseModel isNil.
	self assert: self model localMooseModel identicalTo: self model
]

{ #category : #tests }
FamixModelExtractionTest >> testUnderstands [
	| aFamixClass |
	aFamixClass := self model entityNamed: LANFileServer mooseName.
	self assert: aFamixClass isNotNil.

	"method defined in the same class"
	self assert: (aFamixClass understands: #'output:(Object)').

	"method defined in the superclass"
	self assert: (aFamixClass understands: #'accept:(Object)').

	"method defined in the superclass of superclass"
	self assert: (aFamixClass understands: #'send:(Object)')
]
