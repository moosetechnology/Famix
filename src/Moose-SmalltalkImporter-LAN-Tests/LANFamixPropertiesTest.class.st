Class {
	#name : #LANFamixPropertiesTest,
	#superclass : #LANAbstractImportTest,
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #testing }
LANFamixPropertiesTest >> lanInterfaceOriginateMethod [
	^self model entityNamed: #'Smalltalk::LANInterface.originate()'
]

{ #category : #testing }
LANFamixPropertiesTest >> nodeClass [
	^self model entityNamed: LANNode mooseName
]

{ #category : #testing }
LANFamixPropertiesTest >> testAttributeMetrics [
	| attribute1 attribute2 |
	attribute1 := self model entityNamed: #'Smalltalk::LANInterface.nextNode'.
	attribute2 := self model entityNamed: #'Smalltalk::LANOutputServer.serverType'.
	self assert: (attribute1 propertyNamed: #numberOfAccesses) equals: 3.
	self assert: attribute1 numberOfAccesses equals: 3.
	self assert: (attribute1 propertyNamed: #hierarchyNestingLevel) equals: 1.
	self assert: attribute1 hierarchyNestingLevel equals: 1.
	self assert: (attribute1 propertyNamed: #numberOfAccessingClasses) equals: 1.
	self assert: attribute1 numberOfAccessingClasses equals: 1.
	self assert: (attribute1 propertyNamed: #numberOfLocalAccesses) equals: 3.
	self assert: attribute1 numberOfLocalAccesses equals: 3.
	self assert: (attribute1 propertyNamed: #numberOfAccessingMethods) equals: 1.
	self assert: attribute1 numberOfAccessingMethods equals: 1.
	self assert: (attribute2 propertyNamed: #numberOfGlobalAccesses) equals: 1.
	self assert: attribute2 numberOfGlobalAccesses equals: 1
]

{ #category : #testing }
LANFamixPropertiesTest >> testAttributesOfNonStubClasses [
	"testing issue 960"

	self model allClasses do: [ :cl | cl isStub ifFalse: [ self assert: (cl attributes noneSatisfy: [ :att | att isStub ]) ] ]
]

{ #category : #testing }
LANFamixPropertiesTest >> testAttributesOfStubClasses [
	"testing issue 960"
	self model allClasses do: [ :cl |
		(cl isStub) ifTrue: [ self assert: (cl attributes allSatisfy: [:att | att isStub])] ]
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassAllProperties [
	| class |
	class := self model entityNamed: LANNode mooseName.
	self
		denyEmpty:
			(class allDeclaredProperties
				select: [ :each | each name = #isAbstract ])
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassAttributes [

	self assert: self nodeClass numberOfAttributes equals: 2.
	self assert: self nodeClass numberOfAttributesInherited equals: 3.
	self
		assert:
		(self workstationClass propertyNamed: #numberOfAttributesInherited)
		equals: (self totalNumberOfAttributesFor: LANWorkStation superclass).
	self
		assert: self workstationClass numberOfAttributesInherited
		equals: (self totalNumberOfAttributesFor: LANWorkStation superclass)
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassCategories [
"1halt."
	self assert: (self nodeClass propertyNamed: #numberOfMethodProtocols) equals: 6.
	self assert: self nodeClass numberOfMethodProtocols equals: 6
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassComments [
	self model allClasses do: [ :each | self assert: each numberOfComments >= 0 ].
	self assert: (self nodeClass propertyNamed: #numberOfComments) equals: 11.
	self assert: self nodeClass numberOfComments equals: 11
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassHierarchy [
	self assert: (self nodeClass propertyNamed: #numberOfSubclasses) equals: 2.
	self assert: self nodeClass numberOfSubclasses equals: (self nodeClass propertyNamed: #numberOfSubclasses).
	self assert: self nodeClass totalNumberOfSubclasses equals: 4.
	self assert: self nodeClass hierarchyNestingLevel equals: 1
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassInvocations [
	self assert: (self nodeClass propertyNamed: #numberOfMessageSends) equals: 27.
	self assert: self nodeClass numberOfMessageSends equals: 27
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassIsAbstract [
	^ self
		assert:
			(self model entityNamed: #'Smalltalk::LANAbstractDestinationAddress')
				isAbstract
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassLinesOfCode [
	"2020/05/06 - Cyril - I updated the value for the number of lines of code because before we were using only the sum of methods while now we use the tonel export that contains also the class definition."

	self model allClasses do: [ :each | self assert: each numberOfLinesOfCode >= 0 ].
	self assert: (self nodeClass propertyNamed: #numberOfLinesOfCode) equals: 112.
	self assert: self nodeClass numberOfLinesOfCode equals: 112
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassMethods [
	self assert: self nodeClass numberOfMethods equals: 12.
	self assert: (self nodeClass propertyNamed: #numberOfMethodsInherited) equals: 0.
	self assert: (self nodeClass propertyNamed: #numberOfMethodsOverriden) equals: 0.
	self
		assert: (self nodeClass propertyNamed: #numberOfLocallyDefinedMethods)
		equals: (self nodeClass propertyNamed: #numberOfMethods).
	self
		assert: (self workstationClass propertyNamed: #numberOfMethodsInherited)
		equals: 9.
	self assert: (self workstationClass propertyNamed: #numberOfLocallyDefinedMethods) equals: 1.
	self assert: (self workstationClass propertyNamed: #numberOfMethodsOverriden) equals: 3.
	self
		assert:
			(self workstationClass propertyNamed: #numberOfLocallyDefinedMethods)
				+ (self workstationClass propertyNamed: #numberOfMethodsOverriden)
		equals: (self workstationClass propertyNamed: #numberOfMethods)
]

{ #category : #testing }
LANFamixPropertiesTest >> testClassWeightedMethodCount [
	self assert: self nodeClass weightedMethodCount equals: 13
]

{ #category : #testing }
LANFamixPropertiesTest >> testHasComments [
	self deny: self nodeClass hasComments
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodAccesses [
	self assert: self lanInterfaceOriginateMethod numberOfAccesses equals: 22.
	self
		assert: self lanInterfaceOriginateMethod numberOfAccesses
		equals: (self lanInterfaceOriginateMethod propertyNamed: #numberOfAccesses).
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.originator()') numberOfAccesses equals: 3
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodHierarchyNesting [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #hierarchyNestingLevel) equals: 1.
	self assert: self lanInterfaceOriginateMethod hierarchyNestingLevel equals: 1
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodInvocations [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfOutgoingInvocations) equals: 22.
	self assert: self lanInterfaceOriginateMethod numberOfOutgoingInvocations equals: 22.
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.initialize()') numberOfOutgoingInvocations equals: 2
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodInvocationsWithoutCascading [
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.remove()') numberOfOutgoingInvocations equals: 6.
	self
		assert: (self model entityNamed: #'Smalltalk::LANInterface.newWorkstation()') numberOfOutgoingInvocations
		equals: 4
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodLOC [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfLinesOfCode) equals: 22.
	self assert: self lanInterfaceOriginateMethod numberOfLinesOfCode equals: 22
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodSmalltalkConditionals [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfConditionals) equals: 1.
	self assert: self lanInterfaceOriginateMethod numberOfConditionals equals: 1
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodSmalltalkCyclomaticComplexity [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #cyclomaticComplexity) equals: 2.
	self assert: self lanInterfaceOriginateMethod cyclomaticComplexity equals: 2
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodSmalltalkMessageSends [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfMessageSends) equals: 22.
	self assert: self lanInterfaceOriginateMethod numberOfMessageSends equals: 22
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodSmalltalkParameters [
	self assert: self lanInterfaceOriginateMethod numberOfParameters equals: 0.
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfParameters) equals: 0
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodSmalltalkStatements [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfStatements) equals: 15.
	self assert: self lanInterfaceOriginateMethod numberOfStatements equals: 15
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodTimeStamp [
	| method |
	method := self model entityNamed: #'Smalltalk::LANInterface.initialize()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANInterface compiledMethodAt: #initialize) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANInterface.originate()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANInterface compiledMethodAt: #originate) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANInterface.nodeList()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANInterface compiledMethodAt: #nodeList) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANNode.canOriginate()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANNode compiledMethodAt: #canOriginate) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANNode.canOutput()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANNode compiledMethodAt: #canOutput) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANNode.nextNode()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANNode compiledMethodAt: #nextNode) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANFileServer.name()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANFileServer compiledMethodAt: #name) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANFileServer.setServerType()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANFileServer compiledMethodAt: #setServerType) timeStamp
]

{ #category : #testing }
LANFamixPropertiesTest >> testMethodsSimpleProperties [
	| method |
	method := self model entityNamed: #'Smalltalk::LANInterface.initialize()'.
	self assert: method isInitializer.
	self deny: method isInternalImplementation.
	self deny: method isPureAccessor.

	method := self model entityNamed: #'Smalltalk::LANInterface.originate()'.
	self deny: method isInitializer.
	self deny: method isInternalImplementation.
	self deny: method isPureAccessor.

	method := self model entityNamed: #'Smalltalk::LANInterface.nodeList()'.
	self deny: method isInitializer.
	self assert: method isInternalImplementation.
	self deny: method isPureAccessor.
]

{ #category : #testing }
LANFamixPropertiesTest >> testNoDuplicatesOfClassVariables [
	self assert: ((self model entityNamed: #'Smalltalk::Object') attributes contains: [ :each | each name = #DependentsFields ]).
	self assert: (self model entityNamed: #'Smalltalk::Object') attributes first identicalTo: (self model entityNamed: #'Smalltalk::Object') attributes last.
	self assert: (self model entityNamed: #'Smalltalk::Object') attributes size equals: 1
]

{ #category : #testing }
LANFamixPropertiesTest >> testOverridenMethods [
	self assert: (self model entityNamed: #Smalltalk::LANOutputServer) numberOfMethodsOverriden equals: 2
]

{ #category : #testing }
LANFamixPropertiesTest >> testPropertyNamed [
	self assert: (self nodeClass propertyNamed: #numberOfAttributes) equals: 2.
	self assert: self nodeClass numberOfAttributes equals: 2
]

{ #category : #testing }
LANFamixPropertiesTest >> workstationClass [
	^self model entityNamed: #'Smalltalk::LANWorkStation'
]
