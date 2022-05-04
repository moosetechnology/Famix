Class {
	#name : #FamixClassNavigationChefTest,
	#superclass : #AbstractFamixNavigationTest,
	#category : #'Moose-SmalltalkImporter-KGB-Tests-MooseChef'
}

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testAllIncomingInvocationsIntoMyNamespace [
	self assertEmpty: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations withinParentUsing: FamixTNamespace).
	self
		assertCollection: (self c13FullRefereeInSideOutSide queryAllIncomingInvocations withinParentUsing: FamixTNamespace) opposites
		hasSameElements:
			{(self getMethod: 'm2p6c13Mtd3()') . (self getMethod: 'm2p6c13InstCreation()') . (self getMethod: 'm2p6c12Mtd1()')}.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations withinParentUsing: FamixTNamespace) atScope: FamixTType)
		hasSameElements: {self c13FullRefereeInSideOutSide . self c12FullReferencerInSide}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testAllIncomingInvocationsOutOfMyPackage [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations outOfParentUsing: FamixTPackage) atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations outOfParentUsing: FamixTPackage) atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingDependenciesWithoutSelfLoops [
	self assert: self c1FullReferencerOutSide queryAllOutgoing size equals: 25.
	self assert: ((self c1FullReferencerOutSide queryAllOutgoing atScope: FamixTType) includes: self c1FullReferencerOutSide).
	self assert: self c1FullReferencerOutSide queryAllOutgoing withoutSelfLoops size equals: 16.
	self deny: ((self c1FullReferencerOutSide queryAllOutgoing withoutSelfLoops atScope: FamixTType) includes: self c1FullReferencerOutSide)
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsIntoMyPackage [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations withinParentUsing: FamixTPackage) atScope: FamixTType)
		hasSameElements: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage).
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations withinParentUsing: FamixTPackage) opposites
		hasSameElements: {(self getMethod: 'm1p3c5Mtd1()')}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsOutOfMyNamespace [
	self assert: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfParentUsing: FamixTNamespace) size equals: 3.
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfParentUsing: FamixTNamespace) atScope: FamixTType)
		hasSameElements: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsWithoutSelfLoops [
	self assert: self c1FullReferencerOutSide queryAllOutgoingInvocations size equals: 13.
	self assert: ((self c1FullReferencerOutSide queryAllOutgoingInvocations atScope: FamixTType) includes: self c1FullReferencerOutSide).
	self assert: self c1FullReferencerOutSide queryAllOutgoingInvocations withoutSelfLoops size equals: 12.
	self deny: ((self c1FullReferencerOutSide queryAllOutgoingInvocations withoutSelfLoops atScope: FamixTType) includes: self c1FullReferencerOutSide)
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c15FullReferencerOutSide}.
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide allClients
		hasSameElements: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType).
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTNamespace).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncoming atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTPackage).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide allClientsAtScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncoming atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesOutOfMyNamespace [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c15FullReferencerOutSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesOutOfMyPackage [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c15FullReferencerOutSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientNamespaces [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n4FullReferencer}
]

{ #category : #'tests - clients' }
FamixClassNavigationChefTest >> testClientPackages [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTPackage)
		hasSameElements: {self p2InteractedReferencerReferee . self p8FullReferencer}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [
	| modelClasses |
	modelClasses := self model allClasses.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryAllOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced queryAllIncomingInvocations atScope: FamixTType) includes: referencer ] ])
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testEachStaticOutgoingReferenceImpliesAStaticIncomingReference [
	| modelClasses |
	modelClasses := self model allClasses.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer queryOutgoingReferences atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced queryIncomingReferences atScope: FamixTType) includes: referencer ] ])
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testEachSureOutgoingReferenceImpliesASureIncomingReference [
	| modelClasses |
	modelClasses := self model allClasses.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTType)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTPackage)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTType) includes: referencer ] ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | 
					(referencer querySureOutgoingInvocations atScope: FamixTNamespace)
						allSatisfy: [ :referenced | (referenced querySureIncomingInvocations atScope: FamixTType) includes: referencer ] ])
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testIncomingReferencesAreEitherPotentialOrSureOrStatic [
	| modelClasses |
	modelClasses := self model allClasses.
	self flag: 'Should we test all combinations of static, access, inheritance...?'.
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTType) includesAll: (referencer queryAllIncomingInvocations atScope: FamixTType) ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTPackage) includesAll: (referencer queryAllIncomingInvocations atScope: FamixTPackage) ]).
	self
		assert:
			(modelClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTNamespace) includesAll: (referencer queryAllIncomingInvocations atScope: FamixTNamespace) ])
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClasses [
	self assertCollection: self c11FullRefereeOutSide queryIncomingInheritances opposites hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesInto [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites within: self n1InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}.
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites within: self p2InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesIntoMyNamespace [
	self
		assertCollection: (self c12FullReferencerInSide queryIncomingInheritances opposites withinParentUsing: FamixTNamespace)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesIntoMyPackage [
	self assertEmpty: (self c11FullRefereeOutSide queryIncomingInheritances opposites withinParentUsing: FamixTPackage)
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesOutOfMyNamespace [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesOutOfMyPackage [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites outOfParentUsing: FamixTPackage)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByNamespaces [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances atScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances atScope: FamixTPackage)
		hasSameElements: {self p2InteractedReferencerReferee}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClasses [
	self assertCollection: self c11FullRefereeOutSide queryOutgoingInheritances opposites hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesInto [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites within: self p6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites within: self n2FullReferee)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesIntoMyNamespace [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesIntoMyPackage [
	self assertEmpty: (self c11FullRefereeOutSide queryOutgoingInheritances opposites withinParentUsing: FamixTPackage)
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesOutOfMyNamespace [
	self assertEmpty: (self c11FullRefereeOutSide queryOutgoingInheritances opposites outOfParentUsing: FamixTNamespace)
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesOutOfMyPackage [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites outOfParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedNamespaces [
	self assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances atScope: FamixTNamespace) hasSameElements: {self n2FullReferee}
]

{ #category : #'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites atScope: FamixTPackage)
		hasSameElements: {self p6InteractedReferee}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testOppositesOfCompositeQueryResult [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryAllOutgoing opposites
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide . (self getMethod: 'm2p5c11InstCreation1()').
			(self getMethod: 'm1p3c5Mtd1()') . (self getMethod: 'm1p2c3Mtd3()') . self cObject}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testOutgoingReferencesAreEitherPotentialOrSureOrStatic [
	self flag: 'See testIncomingReferencesAreEitherPotentialOrSureOrStatic'.
	self
		assert:
			(self model allClasses
				allSatisfy: [ :referencer | (referencer queryAllOutgoing atScope: FamixTType) includesAll: (referencer queryAllOutgoingInvocations atScope: FamixTType) ])
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderClasses [
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTType)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}.
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTType)
		hasSameElements: self c15FullReferencerOutSide allProviders
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesInto [
	self
		assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self
		assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) within: self n6InteractedReferee)
		hasSameElements: {self c19FullRefereeOutSide}
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesIntoMyNamespace [
	self assertEmpty: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) withinParentUsing: FamixTNamespace)
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesIntoMyPackage [
	self assertEmpty: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) withinParentUsing: FamixTPackage)
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesOutOfMyNamespace [
	self
		assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesOutOfMyPackage [
	self
		assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderNamespace [
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTNamespace)
		hasSameElements: {self n3ReferencerReferee . self n5InteractedReferencer . self n6InteractedReferee}
]

{ #category : #'tests - providers' }
FamixClassNavigationChefTest >> testProviderPackages [
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self pExtensions . self p7ReferencerReferee}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClasses [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesInto [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) within: self p3InteractedReferencer)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesIntoMyNamespace [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesIntoMyPackage [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesOutOfMyNamespace [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesOutOfMyPackage [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedMethods [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryAllOutgoingInvocations opposites
		hasSameElements:
			{(self getMethod: 'm2p5c11InstCreation1()') . (self getMethod: 'm1p2c3Mtd3()') . (self getMethod: 'm1p3c5Mtd1()')}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedNamespaces [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n2FullReferee}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedPackages [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self p2InteractedReferencerReferee . self p3InteractedReferencer . self p5FullReferee}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self p1FullReferencer)
		hasSameElements: {self c1FullReferencerOutSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesOutOfMyNamespace [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesOutOfMyPackage [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingMethods [
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations opposites
		hasSameElements: {(self getMethod: 'm1p2c2Mtd1()') . (self getMethod: 'm1p2c2Mtd2()')}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingNamespaces [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n3ReferencerReferee . self n1InteractedReferencerReferee}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingPackages [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations atScope: FamixTPackage)
		hasSameElements: {self p1FullReferencer . self p3InteractedReferencer . self p7ReferencerReferee}
]

{ #category : #'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testSourcesInReferencedMethods [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfParentUsing: FamixTNamespace) sources
		hasSameElements: {(self getMethod: 'm1p3c6Mtd1()') . (self getMethod: 'm1p3c6Mtd2()')}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testSourcesInStaticReferencedClasses [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences withinParentUsing: FamixTPackage) sources
		hasSameElements: {(self getMethod: 'm1p3c6Mtd2()')}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClasses [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType)
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesInto [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c6FullReferencerInSideOutSide . self c1FullReferencerOutSide}.
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) within: self p3InteractedReferencer)
		hasSameElements: {self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesIntoMyNamespace [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesIntoMyPackage [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesOutOfMyNamespace [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesOutOfMyPackage [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c14ReferencerOutSideRefereeOutSide . self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientNamespaces [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n3ReferencerReferee . self n2FullReferee}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticIncomingAssociations atScope: FamixTPackage)
		hasSameElements:
			{self p1FullReferencer . self p2InteractedReferencerReferee . self p3InteractedReferencer . self p7ReferencerReferee.
			self p5FullReferee}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClasses [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType)
		hasSameElements: {self c12FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesInto [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) within: self p6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) within: self n2FullReferee)
		hasSameElements: {self c12FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesIntoMyNamespace [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesIntoMyPackage [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesOutOfMyNamespace [
	self assertEmpty: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesOutOfMyPackage [
	self
		assertCollection: ((self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderNamespaces [
	self assertCollection: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTNamespace) hasSameElements: {self n2FullReferee}
]

{ #category : #'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderPackages [
	self
		assertCollection: (self c11FullRefereeOutSide queryStaticOutgoingAssociations atScope: FamixTPackage)
		hasSameElements: {self p6InteractedReferee . self p5FullReferee}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClasses [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryOutgoingReferences opposites
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesInto [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites within: self p3InteractedReferencer)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesIntoMyNamespace [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinParentUsing: FamixTNamespace)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesIntoMyPackage [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinParentUsing: FamixTPackage)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}.

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoingReferences withinParentUsing: FamixTPackage) atScope: FamixTType)
		hasSameElements: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinParentUsing: FamixTPackage)
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesOutOfMyNamespace [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c11FullRefereeOutSide}.

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoingReferences outOfParentUsing: FamixTNamespace) atScope: FamixTType)
		hasSameElements: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfParentUsing: FamixTNamespace)
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesOutOfMyPackage [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfParentUsing: FamixTPackage)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedNamespaces [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences atScope: FamixTNamespace)
		hasSameElements: {self n2FullReferee . self n1InteractedReferencerReferee}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedPackages [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences atScope: FamixTPackage)
		hasSameElements: {self p2InteractedReferencerReferee . self p5FullReferee . self p3InteractedReferencer}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType)
		hasSameElements: {self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self assertEmpty: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self p1FullReferencer).
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c6FullReferencerInSideOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTNamespace).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTPackage).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryIncomingReferences atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesOutOfMyNamespace [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesOutOfMyPackage [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingMethods [
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide queryIncomingReferences opposites
		hasSameElements: {(self getMethod: 'm1p2c2Mtd1()') . (self getMethod: 'm1p2c2Mtd2()')}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingNamespaces [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTNamespace)
		hasSameElements: {self n3ReferencerReferee . self n1InteractedReferencerReferee}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingPackages [
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences atScope: FamixTPackage)
		hasSameElements: {self p3InteractedReferencer . self p7ReferencerReferee}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureOutgoingInvocations atScope: FamixTType)
		hasSameElements: {self c13FullRefereeInSideOutSide . self c11FullRefereeOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testSureReferencedClassesIncludeAllStaticReferencedClasses [
	self
		assert:
			(self model allClasses
				allSatisfy: [ :referencer | (referencer queryAllOutgoing atScope: FamixTType) includesAll: (referencer queryStaticOutgoingAssociations atScope: FamixTType) ])
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureOutgoingInvocations atScope: FamixTType) within: self p5FullReferee)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedClassesIntoMyNamespace [
	self
		assertCollection: ((self c16FullReferencerOutSideInSide querySureOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c18FullRefereeInSideOutSide . self c18FullRefereeInSideOutSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedClassesIntoMyPackage [
	self
		assertCollection: ((self c10FullReferencerInSide querySureOutgoingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c9FullRefereeInSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedClassesOutOfMyNamespace [
	self
		assertCollection: ((self c6FullReferencerInSideOutSide querySureOutgoingInvocations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c11FullRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedMethods [
	self assertCollection: self c6FullReferencerInSideOutSide querySureOutgoingInvocations opposites hasSameElements: {(self getMethod: 'm2p5c11InstCreation1()')}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedNamespaces [
	self assertCollection: (self c6FullReferencerInSideOutSide querySureOutgoingInvocations atScope: FamixTNamespace) hasSameElements: {self n2FullReferee}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testSureReferencedNamespacesTest [
	| modelClasses |
	modelClasses := self model allClasses.
	modelClasses
		do:
			[ :each | self assert: (each querySureOutgoingInvocations atScope: FamixTNamespace) size equals: (each querySureOutgoingInvocations atScope: FamixTNamespace) asSet size ].
	modelClasses
		do:
			[ :each | self assert: (each querySureIncomingInvocations atScope: FamixTType) size equals: (each querySureIncomingInvocations atScope: FamixTType) asSet size ].
	modelClasses
		do:
			[ :each | self assert: (each querySureIncomingInvocations atScope: FamixTNamespace) size equals: (each querySureIncomingInvocations atScope: FamixTNamespace) asSet size ]
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencedPackages [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureOutgoingInvocations atScope: FamixTPackage)
		hasSameElements: {self p6InteractedReferee . self p5FullReferee}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: (self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c12FullReferencerInSide . self c14ReferencerOutSideRefereeOutSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - references' }
FamixClassNavigationChefTest >> testSureReferencingClassesIncludeAllStaticReferencingClasses [
	self
		assert:
			(self model allClasses
				allSatisfy: [ :referencer | (referencer queryAllIncoming atScope: FamixTType) includesAll: (referencer queryStaticIncomingAssociations atScope: FamixTType) ])
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingClassesInto [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.
	self assertEmpty: ((self c3ReferencerInSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self p1FullReferencer).
	self
		assertCollection: ((self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTType) within: self n4FullReferencer)
		hasSameElements: {self c15FullReferencerOutSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingClassesIntoMyNamespace [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTNamespace)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingClassesIntoMyPackage [
	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType) withinParentUsing: FamixTPackage)
		hasSameElements: {self c12FullReferencerInSide . self c13FullRefereeInSideOutSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingClassesOutOfMyNamespace [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: ((self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTNamespace)
		hasSameElements: {self c15FullReferencerOutSide . self c16FullReferencerOutSideInSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingClassesOutOfMyPackage [
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide}.

	self
		assertCollection: ((self c13FullRefereeInSideOutSide querySureIncomingInvocations atScope: FamixTType) outOfParentUsing: FamixTPackage)
		hasSameElements: {self c1FullReferencerOutSide . self c14ReferencerOutSideRefereeOutSide}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingMethods [
	self assertCollection: self c14ReferencerOutSideRefereeOutSide querySureIncomingInvocations opposites hasSameElements: {(self getMethod: 'm1p2c2Mtd1()')}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingNamespaces [
	self
		assertCollection: (self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTNamespace)
		hasSameElements: {self n4FullReferencer . self n5InteractedReferencer . self n6InteractedReferee}
]

{ #category : #'tests - sure invocations' }
FamixClassNavigationChefTest >> testSureReferencingPackages [
	self
		assertCollection: (self c19FullRefereeOutSide querySureIncomingInvocations atScope: FamixTPackage)
		hasSameElements:
			{self pExtensions . self p8FullReferencer . self p9FullReferencer . self p11FullReferee . self p12FullReferencer}
]

{ #category : #'tests - incoming invocations' }
FamixClassNavigationChefTest >> testTargetMethodsInReferencingMethods [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations targetsAtScope: FamixTMethod)
		hasSameElements: {(self getMethod: 'm3p7c14Mtd2()') . (self getMethod: 'm3p7c14Mtd4()') . (self getMethod: 'm3p7c14InstCreation()')}
]

{ #category : #tests }
FamixClassNavigationChefTest >> testUnion [
	| queryResult anotherResult |
	queryResult := MooseQueryResult on: #FakeReceiver withAll: #(1 2 3).
	self assertCollection: (queryResult union: #(4 5)) hasSameElements: #(1 2 3 4 5).
	self assert: (queryResult union: #(4 5)) receiver equals: #FakeReceiver.
	anotherResult := MooseQueryResult on: #FakeReceiver withAll: #(4 5).
	self assertCollection: (queryResult union: anotherResult) hasSameElements: #(1 2 3 4 5).
	self assert: (queryResult union: anotherResult) receiver equals: #FakeReceiver
]

{ #category : #tests }
FamixClassNavigationChefTest >> testWithin [
	self
		assertCollection: ((self c1FullReferencerOutSide queryAllOutgoing within: self p2InteractedReferencerReferee) atScope: FamixTType)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}.
	self
		assertCollection: (self c1FullReferencerOutSide queryAllOutgoingInvocations within: self c13FullRefereeInSideOutSide) opposites
		hasSameElements:
			{(self getMethod: 'm2p6c13Mtd2()') . (self getMethod: 'm2p6c13Mtd1:(Object)') . (self getMethod: 'm2p6c13InstCreation()')}
]
