Class {
	#name : #FamixNamespaceNavigationChefTest,
	#superclass : #AbstractFamixNavigationTest,
	#category : #'Moose-SmalltalkImporter-KGB-Tests-MooseChef'
}

{ #category : #'tests - clients' }
FamixNamespaceNavigationChefTest >> testClientClasses [
	self
		assertCollection: (self n2FullReferee queryAllIncoming atScope: FamixTType)
		hasSameElements:
			{self c14ReferencerOutSideRefereeOutSide . self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide.
			self c10FullReferencerInSide . self c11FullRefereeOutSide . self c12FullReferencerInSide . self c13FullRefereeInSideOutSide.
			self c9FullRefereeInSide }
]

{ #category : #'tests - clients' }
FamixNamespaceNavigationChefTest >> testClientClassesInto [
	self
		assertCollection: ((self n2FullReferee allClientsAtScope: FamixTType) within: self n3ReferencerReferee)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - clients' }
FamixNamespaceNavigationChefTest >> testClientNamespaces [
	self
		assertCollection: (self n2FullReferee queryAllIncoming atScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n3ReferencerReferee . self n2FullReferee}
]

{ #category : #'tests - references' }
FamixNamespaceNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [
	| modelNamespaces |
	modelNamespaces := self model allNamespaces.
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ]).
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ])
]

{ #category : #'tests - references' }
FamixNamespaceNavigationChefTest >> testEachSureOutgoingReferenceImpliesASureIncomingReference [
	| modelNamespaces |
	modelNamespaces := self model allNamespaces.
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ]).
	self
		assert:
			(modelNamespaces
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTNamespace) includes: referencer ] ])
]

{ #category : #'tests - inheritance' }
FamixNamespaceNavigationChefTest >> testInheritedByClasses [
	self
		assertCollection: (self n2FullReferee queryIncomingInheritances atScope: FamixTType)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c11FullRefereeOutSide}.
	self
		assertCollection: self n2FullReferee queryIncomingInheritances opposites
		hasSameElements: {self c11FullRefereeOutSide . self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixNamespaceNavigationChefTest >> testInheritedByClassesInto [
	self
		assertCollection: ((self n2FullReferee queryIncomingInheritances atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixNamespaceNavigationChefTest >> testInheritedByNamespaces [
	self
		assertCollection: (self n2FullReferee queryIncomingInheritances atScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n2FullReferee}
]

{ #category : #'tests - inheritance' }
FamixNamespaceNavigationChefTest >> testInheritedClasses [
	self
		assertCollection: (self n1InteractedReferencerReferee queryOutgoingInheritances atScope: FamixTType)
		hasSameElements: {self c11FullRefereeOutSide . self cObject . self c6FullReferencerInSideOutSide}.
	self
		assertCollection: self n1InteractedReferencerReferee queryOutgoingInheritances opposites
		hasSameElements: {self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide . self cObject}
]

{ #category : #'tests - inheritance' }
FamixNamespaceNavigationChefTest >> testInheritedClassesInto [
	self
		assertCollection: ((self n1InteractedReferencerReferee queryOutgoingInheritances atScope: FamixTType) within: self n2FullReferee)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixNamespaceNavigationChefTest >> testInheritedNamespaces [
	self
		assertCollection: (self n1InteractedReferencerReferee queryOutgoingInheritances atScope: FamixTNamespace)
		hasSameElements: {self n2FullReferee . self nSmalltalkCore . self n1InteractedReferencerReferee}
]

{ #category : #'tests - providers' }
FamixNamespaceNavigationChefTest >> testProviderClasses [
	self
		assertCollection: (self n1InteractedReferencerReferee queryAllOutgoing atScope: FamixTType)
		hasSameElements:
			{self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self cObject . self c7FullRefereeInSide.
			self c6FullReferencerInSideOutSide . self c2ReferencerOutSideRefereeInSide . self c4FullRefereeInSide . self c3ReferencerInSideRefereeOutSide.
			self c1FullReferencerOutSide . self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - providers' }
FamixNamespaceNavigationChefTest >> testProviderClassesInto [
	| invos refs inh |
	self
		assertCollection:
			((self n1InteractedReferencerReferee queryAllOutgoing atScope: FamixTType) within: self n2FullReferee)
				hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}.
	self assert: 15 equals: (self n1InteractedReferencerReferee queryAllOutgoing within: self n2FullReferee) size.
	invos := (self n1InteractedReferencerReferee queryAllOutgoing within: self n2FullReferee) select: [ :dep | dep usesFamixTrait: FamixTInvocation ].
	self assert: 10 equals: invos size.
	refs := (self n1InteractedReferencerReferee queryAllOutgoing within: self n2FullReferee) select: [ :dep | dep usesFamixTrait: FamixTReference ].
	self assert: 4 equals: refs size.
	inh := (self n1InteractedReferencerReferee queryAllOutgoing within: self n2FullReferee) select: [ :dep | dep usesFamixTrait: FamixTInheritance ].
	self assert: 1 equals: inh size.
	self
		assertCollection:
			((self n1InteractedReferencerReferee queryAllOutgoing within: self n2FullReferee) atScope: FamixTType)
				hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - providers' }
FamixNamespaceNavigationChefTest >> testProviderClassesOutOf [
	| invos refs inh acc |
	self
		assertCollection: ((self n1InteractedReferencerReferee queryAllOutgoing atScope: FamixTType) outOf: self p5FullReferee)
		hasSameElements:
			{self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self cObject . self c6FullReferencerInSideOutSide.
			self c5ReferencerInSideRefereeInSide . self c7FullRefereeInSide . self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide.
			self c4FullRefereeInSide . self c1FullReferencerOutSide}.
	self assert: 55 equals: (self n1InteractedReferencerReferee queryAllOutgoing outOf: self p5FullReferee) size.
	invos := (self n1InteractedReferencerReferee queryAllOutgoing outOf: self p5FullReferee) select: [ :dep | dep usesFamixTrait: FamixTInvocation ].
	self assert: 29 equals: invos size.
	refs := (self n1InteractedReferencerReferee queryAllOutgoing outOf: self p5FullReferee) select: [ :dep | dep usesFamixTrait: FamixTReference ].
	self assert: 10 equals: refs size.
	inh := (self n1InteractedReferencerReferee queryAllOutgoing outOf: self p5FullReferee)
		select: [ :dep | dep usesFamixTrait: FamixTInheritance ].
	self assert: 7 equals: inh size.
	acc := (self n1InteractedReferencerReferee queryAllOutgoing outOf: self p5FullReferee) select: [ :dep | dep usesFamixTrait: FamixTAccess ].
	self assert: 9 equals: acc size.
	self
		assertCollection: ((self n1InteractedReferencerReferee queryAllOutgoing outOf: self p5FullReferee) atScope: FamixTType)
		hasSameElements:
			{self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self cObject . self c6FullReferencerInSideOutSide.
			self c5ReferencerInSideRefereeInSide . self c7FullRefereeInSide . self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide.
			self c4FullRefereeInSide . self c1FullReferencerOutSide}
]

{ #category : #'tests - providers' }
FamixNamespaceNavigationChefTest >> testProviderNamespaces [
	self
		assertCollection: (self n1InteractedReferencerReferee queryAllOutgoing atScope: FamixTNamespace)
		hasSameElements: {self n2FullReferee . self n3ReferencerReferee . self nSmalltalkCore . self n1InteractedReferencerReferee}
]

{ #category : #'tests - outgoing invocations' }
FamixNamespaceNavigationChefTest >> testReferencedClasses [
	self
		assertCollection: (self n1InteractedReferencerReferee queryAllOutgoingInvocations atScope: FamixTType)
		hasSameElements:
			{self c11FullRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c13FullRefereeInSideOutSide . self c5ReferencerInSideRefereeInSide.
			self c7FullRefereeInSide . self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide . self c4FullRefereeInSide.
			self c1FullReferencerOutSide}
]

{ #category : #'tests - outgoing invocations' }
FamixNamespaceNavigationChefTest >> testReferencedClassesInto [
	self
		assertCollection: ((self n1InteractedReferencerReferee queryAllOutgoingInvocations atScope: FamixTType) within: self n2FullReferee)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - outgoing invocations' }
FamixNamespaceNavigationChefTest >> testReferencedNamespaces [
	self
		assertCollection: (self n1InteractedReferencerReferee queryAllOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n2FullReferee . self n3ReferencerReferee . self n1InteractedReferencerReferee}
]

{ #category : #'tests - incoming invocations' }
FamixNamespaceNavigationChefTest >> testReferencingClasses [
	self
		assertCollection: (self n2FullReferee queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements:
			{self c14ReferencerOutSideRefereeOutSide . self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c12FullReferencerInSide.
			self c13FullRefereeInSideOutSide . self c10FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixNamespaceNavigationChefTest >> testReferencingClassesInto [
	self
		assertCollection: ((self n2FullReferee queryAllIncomingInvocations atScope: FamixTType) within: self n3ReferencerReferee)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixNamespaceNavigationChefTest >> testReferencingNamespaces [
	self
		assertCollection: (self n2FullReferee queryAllIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n3ReferencerReferee . self n2FullReferee}
]

{ #category : #'tests - sure invocations' }
FamixNamespaceNavigationChefTest >> testSureReferencedClasses [
	self
		assertCollection: (self n1InteractedReferencerReferee querySureOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide . self c14ReferencerOutSideRefereeOutSide . self c4FullRefereeInSide}
]

{ #category : #'tests - sure invocations' }
FamixNamespaceNavigationChefTest >> testSureReferencedClassesInto [
	self
		assertCollection: ((self n1InteractedReferencerReferee querySureOutgoingInvocations atScope: FamixTType) within: self n2FullReferee)
		hasSameElements: {self c11FullRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - sure invocations' }
FamixNamespaceNavigationChefTest >> testSureReferencedNamespaces [
	self
		assertCollection: (self n1InteractedReferencerReferee querySureOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n2FullReferee . self n3ReferencerReferee . self n1InteractedReferencerReferee}
]

{ #category : #'tests - sure invocations' }
FamixNamespaceNavigationChefTest >> testSureReferencingClasses [
	self
		assertCollection: (self n2FullReferee querySureIncomingInvocations atScope: FamixTType)
		hasSameElements:
			{self c14ReferencerOutSideRefereeOutSide . self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide.
			self c13FullRefereeInSideOutSide . self c12FullReferencerInSide . self c10FullReferencerInSide}
]

{ #category : #'tests - sure invocations' }
FamixNamespaceNavigationChefTest >> testSureReferencingClassesInto [
	self
		assertCollection: ((self n2FullReferee querySureIncomingInvocations atScope: FamixTType) within: self n3ReferencerReferee)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FamixNamespaceNavigationChefTest >> testSureReferencingNamespaces [
	self
		assertCollection: (self n2FullReferee querySureIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n2FullReferee . self n3ReferencerReferee}
]
