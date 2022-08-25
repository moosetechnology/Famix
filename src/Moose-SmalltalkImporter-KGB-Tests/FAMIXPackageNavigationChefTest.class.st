Class {
	#name : #FamixPackageNavigationChefTest,
	#superclass : #AbstractFamixNavigationTest,
	#category : #'Moose-SmalltalkImporter-KGB-Tests-MooseChef'
}

{ #category : #'tests - clients' }
FamixPackageNavigationChefTest >> testClientClasses [
	self
		assertCollection: (self p5FullReferee queryAllIncoming atScope: FamixTType)
		hasSameElements:
			{self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide}
]

{ #category : #'tests - clients' }
FamixPackageNavigationChefTest >> testClientClassesInto [
	self
		assertCollection: ((self p5FullReferee queryAllIncoming atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - clients' }
FamixPackageNavigationChefTest >> testClientPackages [
	self
		assertCollection: (self p5FullReferee queryAllIncoming atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p2InteractedReferencerReferee . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [
	| modelPackages |
	modelPackages := self model allPackages.
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTPackage) includes: referencer ] ]).
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTPackage) includes: referencer ] ])
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testEachStaticOutgoingReferenceImpliesAStaticIncomingReference [
	| modelPackages |
	modelPackages := self model allPackages.
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTPackage) includes: referencer ] ]).
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTPackage) includes: referencer ] ])
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testEachSureOutgoingReferenceImpliesASureIncomingReference [
	| modelPackages |
	modelPackages := self model allPackages.
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTPackage) includes: referencer ] ]).
	self
		assert:
			(modelPackages
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTPackage) includes: referencer ] ])
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedByClasses [
	self assertCollection: self p6InteractedReferee queryIncomingInheritances opposites hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedByClassesInto [
	self assertCollection: (self p6InteractedReferee queryIncomingInheritances opposites within: self p5FullReferee) hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedByPackages [
	self assertCollection: (self p6InteractedReferee queryIncomingInheritances atScope: FamixTPackage) hasSameElements: {self p5FullReferee}
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClasses [
	self assertCollection: self p5FullReferee queryOutgoingInheritances opposites hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClassesAsSourceOfInheritance [
	self
		assertCollection: (self c6FullReferencerInSideOutSide  queryIncomingInheritances sourcesAtScope: FamixTClass)
		hasSameElements: {self c8FullReferencerInSide}.
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClassesAsTargetOfInheritance [
	self
		assertCollection: (self c8FullReferencerInSide queryOutgoingInheritances targetsAtScope: FamixTClass)
		hasSameElements: {self c6FullReferencerInSideOutSide }
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClassesInto [
	self
		assertCollection: (self p5FullReferee queryOutgoingInheritances opposites within: self p6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedPackages [
	self assertCollection: (self p5FullReferee queryOutgoingInheritances atScope: FamixTPackage) hasSameElements: {self p6InteractedReferee}
]

{ #category : #'tests - providers' }
FamixPackageNavigationChefTest >> testProviderClasses [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoing atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - providers' }
FamixPackageNavigationChefTest >> testProviderClassesInto [
	self assertCollection: ((self p8FullReferencer queryAllOutgoing atScope: FamixTType) within: self p11FullReferee) hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer queryAllOutgoing atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - providers' }
FamixPackageNavigationChefTest >> testProviderPackages [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoing atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self p7ReferencerReferee . self pExtensions}
]

{ #category : #'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testReferencedClasses [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testReferencedClassesInto [
	self
		assertCollection: ((self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testReferencedPackages [
	self
		assertCollection: (self p8FullReferencer queryAllOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self pExtensions}.
	self assertCollection: (self pExtensions queryAllOutgoingInvocations atScope: FamixTPackage) hasSameElements: {self p11FullReferee}
]

{ #category : #'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testReferencingClasses [
	self
		assertCollection: (self p5FullReferee queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testReferencingClassesInto [
	self
		assertCollection: ((self p5FullReferee queryAllIncomingInvocations atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testReferencingPackages [
	self
		assertCollection: (self p5FullReferee queryAllIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p3InteractedReferencer . self p7ReferencerReferee . self p5FullReferee}
]

{ #category : #'tests - inheritance' }
FamixPackageNavigationChefTest >> testSourceClassesInInheritedClasses [
	self
		assertCollection: (self p3InteractedReferencer queryOutgoingInheritances sourcesAtScope: FamixTClass)
		hasSameElements: {self c5ReferencerInSideRefereeInSide . self c6FullReferencerInSideOutSide . self c7FullRefereeInSide . self c8FullReferencerInSide}.

	self
		assertCollection: (self p3InteractedReferencer queryOutgoingInheritances withoutSelfLoops sourcesAtScope: FamixTClass)
		hasSameElements: {self c5ReferencerInSideRefereeInSide . self c6FullReferencerInSideOutSide . self c7FullRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testSourceClassesInReferencedClasses [
	self
		assertCollection: (self p3InteractedReferencer queryAllOutgoingInvocations sourcesAtScope: FamixTClass)
		hasSameElements: {self c5ReferencerInSideRefereeInSide . self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticClientClasses [
	self
		assertCollection: (self p5FullReferee queryAllIncoming atScope: FamixTType)
		hasSameElements:
			{self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticClientClassesInto [

	self
		assertCollection:
			((self p5FullReferee queryAllIncoming atScope: FamixTType) within:
				 self p1FullReferencer)
		hasSameElements: { self c1FullReferencerOutSide }
]

{ #category : #'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticClientPackages [
	self
		assertCollection: (self p5FullReferee queryAllIncoming atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p2InteractedReferencerReferee . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticProviderClasses [

	self
		assertCollection:
		(self p8FullReferencer queryAllOutgoing atScope: FamixTType)
		hasSameElements: { 
				self c18FullRefereeInSideOutSide.
				self c19FullRefereeOutSide.
				self c14ReferencerOutSideRefereeOutSide }
]

{ #category : #'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticProviderClassesInto [

	self
		assertCollection:
			((self p8FullReferencer queryAllOutgoing atScope: FamixTType) 
				 within: self p11FullReferee)
		hasSameElements: { self c19FullRefereeOutSide }.
	self assertEmpty:
		((self p8FullReferencer queryAllOutgoing atScope: FamixTType) 
			 within: self pExtensions)
]

{ #category : #'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticProviderPackages [
<expectedFailure>
" distinction between static and other associations is no more done. This test is henceforth expected to fail."
	self
		assertCollection:
		(self p8FullReferencer queryAllOutgoing atScope: FamixTPackage)
		hasSameElements: { 
				self p10InteractedReferee.
				self p11FullReferee.
				self p7ReferencerReferee }
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencedClasses [
	self
		assertCollection: (self p8FullReferencer queryOutgoingReferences atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencedClassesInto [
	self
		assertCollection: ((self p8FullReferencer queryOutgoingReferences atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer queryOutgoingReferences atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencedPackages [
	self
		assertCollection: (self p8FullReferencer queryOutgoingReferences atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencingClasses [
	self
		assertCollection: (self p5FullReferee queryIncomingReferences atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencingClassesInto [
	self
		assertCollection: ((self p5FullReferee queryIncomingReferences atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencingPackages [
	self
		assertCollection: (self p5FullReferee queryIncomingReferences atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - sure invocations' }
FamixPackageNavigationChefTest >> testSureReferencedClasses [
	self
		assertCollection: (self p8FullReferencer querySureOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testSureReferencedClassesIncludeAllStaticReferencedClasses [

	self assert: (self model allPackages allSatisfy: [ :referencer | 
			 referencer queryAllOutgoing includesAll:
				 referencer queryAllOutgoing ])
]

{ #category : #'tests - sure invocations' }
FamixPackageNavigationChefTest >> testSureReferencedClassesInto [
	self
		assertCollection: ((self p8FullReferencer querySureOutgoingInvocations atScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self assertEmpty: ((self p8FullReferencer querySureOutgoingInvocations atScope: FamixTType) within: self pExtensions)
]

{ #category : #'tests - sure invocations' }
FamixPackageNavigationChefTest >> testSureReferencedPackages [
	self
		assertCollection: (self p8FullReferencer querySureOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self pExtensions}
]

{ #category : #'tests - sure invocations' }
FamixPackageNavigationChefTest >> testSureReferencingClasses [
	self
		assertCollection: (self p5FullReferee querySureIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testSureReferencingClassesIncludeAllStaticReferencingClasses [

	self assert: (self model allPackages allSatisfy: [ :referencer | 
			 referencer queryAllIncoming includesAll:
				 referencer queryAllIncoming ])
]

{ #category : #'tests - sure invocations' }
FamixPackageNavigationChefTest >> testSureReferencingClassesInto [
	self
		assertCollection: ((self p5FullReferee querySureIncomingInvocations atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}
]

{ #category : #'tests - sure invocations' }
FamixPackageNavigationChefTest >> testSureReferencingPackages [
	self
		assertCollection: (self p5FullReferee querySureIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p7ReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testTargetClassesInReferencingClasses [
	self assertCollection: (self p5FullReferee queryAllIncomingInvocations targetsAtScope: FamixTClass) hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixPackageNavigationChefTest >> testTargetClassesInStaticReferencingClasses [
	self
		assertCollection: (self p2InteractedReferencerReferee queryIncomingReferences targetsAtScope: FamixTClass)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c3ReferencerInSideRefereeOutSide . self c4FullRefereeInSide}.
	self
		assertCollection: (self p2InteractedReferencerReferee queryIncomingReferences withoutSelfLoops targetsAtScope: FamixTClass)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]
