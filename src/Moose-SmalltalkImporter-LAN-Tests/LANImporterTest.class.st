Class {
	#name : #LANImporterTest,
	#superclass : #LANAbstractImportTest,
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #tests }
LANImporterTest >> testAccessReification [ 
	 
	self model allAccesses 
		do: 
			[:each |  
			self assert: (each accessor usesFamixTrait: FamixTMethod). 
			self assert: (each variable usesFamixTrait: FamixTAccessible) ]
]

{ #category : #tests }
LANImporterTest >> testAccessToPoolVariable [
	| lanEditorAccess group |
	group := self model allAccesses select: [ :each | each variable name = 'LANEditor' ].
	self assert: group size equals: 1.
	lanEditorAccess := group first.
	self assert: lanEditorAccess accessor name equals: #accessPoolVariable.
	self assert: lanEditorAccess accessor mooseName equals: #'Smalltalk.LANNode.accessPoolVariable()'
]

{ #category : #tests }
LANImporterTest >> testAllEntitiesHaveABackReferenceToTheModel [
	self model do: [ :each | self assert: each mooseModel equals: self model ]
]

{ #category : #tests }
LANImporterTest >> testAllImplicitVariablesAreStoredInTheModel [
	self 
		assert: (self model allMethods flatCollect: #implicitVariables) size 
		equals: self model allImplicitVariables size
]

{ #category : #tests }
LANImporterTest >> testClassIsAbstract [ 
	self
		assert:
			(self model entityNamed: #'Smalltalk.LANAbstractDestinationAddress')
				isAbstract.
	self
		deny: (self model entityNamed: #'Smalltalk.LANPacket') isAbstract
]

{ #category : #tests }
LANImporterTest >> testClassName [
	self model allClasses do: [ :each | self deny: (each name includes: Character space) ]
]

{ #category : #tests }
LANImporterTest >> testClassNameAndUniqueName [
	| mseClass |
	mseClass := self model entityNamed: LANNode mooseName.
	self assert: mseClass name equals: #LANNode.
	self assert: mseClass mooseName equals: 'Smalltalk.LANNode'.
	self assert: mseClass mooseName equals: LANNode mooseName
]

{ #category : #tests }
LANImporterTest >> testClassNameDoesNotIncludeSpace [
	self denyEmpty: self model allClasses.
	self model allClasses do: [ :each | self deny: (each name includes: Character space) ]
]

{ #category : #tests }
LANImporterTest >> testClassSides [
	| node nodeClass |
	node := self model entityNamed: LANNode mooseName.
	nodeClass := self model entityNamed: LANNode class mooseName.
	self assert: node instanceSide identicalTo: node.
	self assert: node classSide identicalTo: nodeClass.
	self assert: nodeClass classSide identicalTo: nodeClass.
	self assert: nodeClass instanceSide identicalTo: node
]

{ #category : #tests }
LANImporterTest >> testCommonSuperClasses [
	self assert: (self model allPackages entityNamed: #'Moose-TestResources-LAN') localClassesGroup commonExternalSuperclasses size equals: 12
]

{ #category : #tests }
LANImporterTest >> testCorrectInvocations [
	self model allInvocations
		do: [ :each | 
			self assert: each sender isMethod.
			each candidates do: [ :eachCandidate | eachCandidate ifNotNil: [ self assert: eachCandidate isMethod ] ] ]
]

{ #category : #tests }
LANImporterTest >> testCorrectnessOfImport [
	| node outputServer nodeName workstationName fileServerName printServerName uiModelName nodeSubclasses outputServerName outputServerSubclasses |
	nodeName := LANNode mooseName.
	workstationName := LANWorkStation mooseName.
	fileServerName := LANFileServer mooseName.
	printServerName := LANPrintServer mooseName.
	uiModelName := Model mooseName.
	outputServerName := LANOutputServer mooseName.
	node := self model entityNamed: nodeName.
	outputServer := self model entityNamed: outputServerName.	"UI.Model superclass LAN.Node and has two subclasses"
	self assert: node superInheritances size equals: 1.
	self assert: ((node superInheritances collect: [ :each | each subclass mooseName ]) includes: nodeName).
	self assert: ((node superInheritances collect: [ :each | each superclass mooseName ]) includes: uiModelName).
	self assert: node subInheritances size equals: 2.
	nodeSubclasses := node subInheritances collect: [ :each | each subclass mooseName ].
	self assert: (nodeSubclasses includes: workstationName).
	self assert: (nodeSubclasses includes: outputServerName).
	self assert: outputServer superInheritances size equals: 1.
	self assert: ((outputServer superInheritances collect: [ :each | each subclass mooseName ]) includes: outputServerName).
	self assert: ((outputServer superInheritances collect: [ :each | each superclass mooseName ]) includes: nodeName).
	self assert: outputServer subInheritances size equals: 2.
	outputServerSubclasses := outputServer subInheritances collect: [ :each | each subclass mooseName ].
	self assert: (outputServerSubclasses includes: fileServerName).
	self assert: (outputServerSubclasses includes: printServerName)
]

{ #category : #tests }
LANImporterTest >> testEntityUniquelyNamed [
	| classes |
	classes := self model allClasses.
	self assert: (classes entityNamed: LANNode mooseName) isNotNil.
	self assert: (classes entityNamed: LANNode class mooseName) isNotNil
]

{ #category : #tests }
LANImporterTest >> testHierarchyRoot [ 
	self assert: (self model entityNamed: LANNode mooseName) isHierarchyRoot. 
	self deny: ((self model entityNamed: LANNode mooseName) 
				isHierarchyRootWithin: self model allClasses)
]

{ #category : #tests }
LANImporterTest >> testImportCategory [
	self assert: (self model entityNamed: #'Smalltalk.LANInterface.cancel()') protocol equals: #actions.
	self assert: (self model entityNamed: #'Smalltalk.LANInterface.addressee()') protocol equals: #aspects
]

{ #category : #tests }
LANImporterTest >> testImportClassComments [
	self denyEmpty: (self model allComments select: [ :each | each belongsTo isClass ]).
	self denyEmpty: (self model allClasses reject: [ :each | each comments isEmpty ]).
	self denyEmpty: (self model entityNamed: #'Smalltalk.LANInterface') comments
]

{ #category : #tests }
LANImporterTest >> testImportMethodComments [
	self model allComments do: [ :eachComment | self assert: (self model entityNamed: eachComment belongsTo mooseName) isNotNil ].
	self assert: (self model entityNamed: #'Smalltalk.LANInterface.accept()') comments size equals: 1.
	self assert: (self model entityNamed: #'Smalltalk.LANInterface.originate()') comments size equals: 6
]

{ #category : #tests }
LANImporterTest >> testIncomingInvocationReification [ 
	 
	self model allInvocations 
		do: 
			[:each |  
			each candidates 
				do: 
					[:eachCandidate | self assert: (eachCandidate incomingInvocations includes: each)]]
]

{ #category : #tests }
LANImporterTest >> testInheritanceReification [
	| inheritances |
	inheritances := self model allInheritanceDefinitions.
	self denyEmpty: inheritances.
	inheritances
		do: [ :each | 
			self assert: (each superclass usesFamixTrait: FamixTClass).
			self assert: (each subclass usesFamixTrait: FamixTClass) ]
]

{ #category : #tests }
LANImporterTest >> testInheritsFrom [ 
	 
	self 
		assert: 
			((self model entityNamed: #'Smalltalk.LANPrintServer') 
				inheritsFrom: (self model entityNamed: LANNode mooseName)). 
	self 
		assert: 
			((self model entityNamed: #'Smalltalk.LANPrintServer') 
				inheritsFrom: 
					(self model entityNamed: #'Smalltalk.LANOutputServer')). 
	self 
		assert: 
			((self model entityNamed: #'Smalltalk.LANPrintServer') 
				inheritsFrom: (self model entityNamed: #'Smalltalk.Model'))
]

{ #category : #tests }
LANImporterTest >> testInvocationReification [
	self model allInvocations
		do: [ :each | 
			self assert: (each sender usesFamixTrait: FamixTMethod).
			each candidates
				do: [ :eachCandidate | 
					self assert: (eachCandidate usesFamixTrait: FamixTMethod).
					self assert: eachCandidate signature equals: each signature ] ]
]

{ #category : #tests }
LANImporterTest >> testLonely [
	| lonely |
	lonely := self model allModelClasses select: [ :each | each isLonelyWithin: self model allModelClasses ].
	self assert: lonely size equals: 8
]

{ #category : #tests }
LANImporterTest >> testMethodIsAbstract [
	self
		assert:
			(self model entityNamed: #'Smalltalk.LANOutputServer.output:(Object)')
				isAbstract.
	self
		deny:
			(self model entityNamed: #'Smalltalk.LANWorkStation.canOriginate()')
				isAbstract
]

{ #category : #tests }
LANImporterTest >> testMethodOverriding [ 
	 
	self assert: (self model entityNamed: (LANOutputServer>>#canOutput) mooseName) isOverriding. 
	self assert: (self model entityNamed: (LANNode>>#canOutput) mooseName) isOverridden
]

{ #category : #tests }
LANImporterTest >> testMinimalStateofEntity [
	| node |
	node := self model entityNamed: LANNode mooseName.
	self assert: (node subInheritances at: 1) mooseModel equals: self model.
	self assert: (node superInheritances at: 1) mooseModel equals: self model
]

{ #category : #tests }
LANImporterTest >> testMooseName [
	self assert: LANNode mooseName equals: #'Smalltalk.LANNode'.
	self assert: 'Smalltalk.LANNode' mooseName equals: #'Smalltalk.LANNode'.
	self assert: LANNode class mooseName equals: 'Smalltalk.LANNode_class'	"we could also  test here that all the famix entities  understand mooseName but for that we should create model so
	this is done in LANTest "
]

{ #category : #tests }
LANImporterTest >> testNameAndUniqueName [
	| mseClass mseMethod mseAttribute mseGlobalVar mseImplicitVar mseLocalVariable mseFormalParameter transcriptName |
	mseClass := self model entityNamed: LANNode mooseName.
	self assert: mseClass name identicalTo: #LANNode.
	self assert: mseClass mooseName identicalTo: #'Smalltalk.LANNode'.
	self assert: mseClass mooseName identicalTo: LANNode mooseName.
	mseMethod := self model entityNamed: #'Smalltalk.LANPacket.printOn:(Object)'.
	self assert: mseMethod name identicalTo: #printOn:.
	self assert: mseMethod mooseName identicalTo: #'Smalltalk.LANPacket.printOn:(Object)'.
	self assert: mseMethod signature identicalTo: #'printOn:(Object)'.
	mseAttribute := self model entityNamed: (LANNode mooseNameOf: 'name') asSymbol.
	self assert: mseAttribute mooseName identicalTo: (LANNode mooseNameOf: 'name').
	self assert: mseAttribute name identicalTo: #name.
	transcriptName := #Transcript.
	mseGlobalVar := self model entityNamed: transcriptName.
	self assert: mseGlobalVar name identicalTo: transcriptName.
	self assert: mseGlobalVar mooseName identicalTo: transcriptName.	"self assert: (mseGlobalVar interfaceSignatures includes: #cr)."
	mseImplicitVar := self model entityNamed: LANNode mooseName , '.accept:(Object).self'.
	self assert: mseImplicitVar name identicalTo: #self.
	self assert: mseImplicitVar mooseName equals: LANNode mooseName , '.accept:(Object).self'.	"self assert: (mseImplicitVar interfaceSignatures includes: #send:)."
	mseImplicitVar := self model entityNamed: LANNode mooseName , '.printOn:(Object).super'.
	self assert: mseImplicitVar name identicalTo: #super.
	self assert: mseImplicitVar mooseName identicalTo: (LANNode mooseName , '.printOn:(Object).super') asSymbol.
	mseLocalVariable := self model entityNamed: #'Smalltalk.LANInterface.originate().packet'.
	self assert: mseLocalVariable name identicalTo: #packet.
	self assert: mseLocalVariable mooseName identicalTo: #'Smalltalk.LANInterface.originate().packet'.
	mseFormalParameter := self model entityNamed: (LANNode mooseNameOf: 'nextNode:(Object).aNode').
	self assert: mseFormalParameter name identicalTo: #aNode.
	self assert: mseFormalParameter mooseName identicalTo: (LANNode mooseNameOf: 'nextNode:(Object).aNode')	"self assert: mseFormalParameter position = 1"
]

{ #category : #tests }
LANImporterTest >> testNamespace [
	| namespace |
	namespace := self model entityNamed: #Smalltalk.
	self assert: (namespace usesFamixTrait: FamixTNamespace)
]

{ #category : #tests }
LANImporterTest >> testNamespaceReification [
	self model allClasses do: [ :each | self assert: (each parents anySatisfy: [ :p | p usesFamixTrait: FamixTNamespace ]) ]
]

{ #category : #tests }
LANImporterTest >> testNodeIsInModelWithGoodName [
	self deny: (self model entityNamed: LANNode mooseName) isNil
]

{ #category : #tests }
LANImporterTest >> testOutgoingInvocationReification [ 
	 
	self model allInvocations 
		do: 
			[:each | self assert: (each sender outgoingInvocations includes: each)]
]

{ #category : #tests }
LANImporterTest >> testPackageReification [
	self model allClasses do: [ :each | self assert: (each parentPackage usesFamixTrait: FamixTPackage) ].
	self model allPackages
		do: [ :each | each localClasses do: [ :eachClass | self assert: eachClass parentPackage equals: each ] ].
	self assert: (self model allPackages entityNamed: #'Moose-TestResources-LAN') localClasses size equals: 22
]

{ #category : #tests }
LANImporterTest >> testPoolVariablesAreReified [
	| poolVar |
	poolVar := self model entityNamed: #'Smalltalk.LANPool.LANEditor'.
	self assert: poolVar parentType name equals: #LANPool
]

{ #category : #tests }
LANImporterTest >> testReferenceModelInEntities [
	self model entities do: [ :each | self assert: each mooseModel identicalTo: self model ]
]

{ #category : #tests }
LANImporterTest >> testStubClassesCreation [
	self deny: (self model entityNamed: LANNode mooseName) isStub.
	self assert: (self model entityNamed: #'Smalltalk.Object') isStub.
	self deny: (self model entityNamed: #'Smalltalk.LANFileServer_class') isStub.
	self assert: (self model allClasses reject: [ :each | each isStub ]) size equals: 22
]

{ #category : #tests }
LANImporterTest >> testSubClassHierarchy [
	self assert: (self model entityNamed: LANNode mooseName) subclassHierarchy size equals: 4.
	self assert: (self model entityNamed: LANNode mooseName) withSubclassHierarchy size equals: 5
]

{ #category : #tests }
LANImporterTest >> testSuperClassHierarchy [
	self assert: (self model entityNamed: #'Smalltalk.LANPrintServer') superclassHierarchy size equals: 5
]
