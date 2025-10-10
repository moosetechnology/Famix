Class {
	#name : 'FamixClassNavigationChefTest',
	#superclass : 'AbstractFamixNavigationTest',
	#category : 'Moose-SmalltalkImporter-KGB-Tests-MooseChef',
	#package : 'Moose-SmalltalkImporter-KGB-Tests',
	#tag : 'MooseChef'
}

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testAllIncomingInvocationsIntoMyNamespace [

	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) withinContainerUsing: FamixTNamespace).
	self assertCollection: ((self c13FullRefereeInSideOutSide queryIncoming: FamixTInvocation) withinContainerUsing: FamixTNamespace) opposites hasSameElements: {
			(self getMethod: 'm2p6c13Mtd3()').
			(self getMethod: 'm2p6c13InstCreation()').
			(self getMethod: 'm2p6c12Mtd1()') }.
	self
		assertCollection: (((self c13FullRefereeInSideOutSide queryIncoming: FamixTInvocation) withinContainerUsing: FamixTNamespace) containersOfType: FamixTType)
		hasSameElements: {
				self c13FullRefereeInSideOutSide.
				self c12FullReferencerInSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testAllIncomingInvocationsOutOfMyPackage [

	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) outOfContainerUsing: FamixTPackage) containersOfType: FamixTType)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: (((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) outOfContainerUsing: FamixTPackage) containersOfType: FamixTType)
		hasSameElements: {
				self c1FullReferencerOutSide.
				self c6FullReferencerInSideOutSide.
				self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingDependenciesWithoutSelfLoops [

	self assert: self c1FullReferencerOutSide queryAllOutgoing size equals: 25.
	self assert: ((self c1FullReferencerOutSide queryAllOutgoing containersOfType: FamixTType) includes: self c1FullReferencerOutSide).
	self assert: self c1FullReferencerOutSide queryAllOutgoing withoutSelfLoops size equals: 16.
	self deny: ((self c1FullReferencerOutSide queryAllOutgoing withoutSelfLoops containersOfType: FamixTType) includes: self c1FullReferencerOutSide)
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsIntoMyPackage [

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) withinContainerUsing: FamixTPackage) containersOfType: FamixTType)
		hasSameElements: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) withinContainerUsing: FamixTPackage).
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) withinContainerUsing: FamixTPackage) opposites
		hasSameElements: { (self getMethod: 'm1p3c5Mtd1()') }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsOutOfMyNamespace [

	self assert: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) outOfContainerUsing: FamixTNamespace) size equals: 3.
	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) outOfContainerUsing: FamixTNamespace) containersOfType: FamixTType)
		hasSameElements: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsWithoutSelfLoops [

	self assert: (self c1FullReferencerOutSide queryOutgoing: FamixTInvocation) size equals: 13.
	self assert: (((self c1FullReferencerOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) includes: self c1FullReferencerOutSide).
	self assert: (self c1FullReferencerOutSide queryOutgoing: FamixTInvocation) withoutSelfLoops size equals: 12.
	self deny:
		(((self c1FullReferencerOutSide queryOutgoing: FamixTInvocation) withoutSelfLoops containersOfType: FamixTType) includes: self c1FullReferencerOutSide)
]

{ #category : 'tests - clients' }
FamixClassNavigationChefTest >> testClientClasses [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType)
		hasSameElements: {self c2ReferencerOutSideRefereeInSide . self c15FullReferencerOutSide}.
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide allClientsAtMyScope
		hasSameElements: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType).
	self
		assertCollection: (self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType)
		hasSameElements: {self c1FullReferencerOutSide . self c6FullReferencerInSideOutSide . self c14ReferencerOutSideRefereeOutSide}.
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClients)
		hasSameElements: {self m1p2c2Mtd2 . self m1p2c2Mtd1 . self c15FullReferencerOutSide }.
]

{ #category : 'tests - clients' }
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

{ #category : 'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesIntoMyNamespace [

	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) withinContainerUsing: FamixTNamespace).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide allClientsAtScope: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c12FullReferencerInSide }.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncoming containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: {
				self c12FullReferencerInSide.
				self c13FullRefereeInSideOutSide }
]

{ #category : 'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesIntoMyPackage [

	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) withinContainerUsing: FamixTPackage).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide allClientsAtScope: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: { self c12FullReferencerInSide }.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncoming containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: {
				self c12FullReferencerInSide.
				self c13FullRefereeInSideOutSide }
]

{ #category : 'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesOutOfMyNamespace [

	self assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) outOfContainerUsing: FamixTNamespace) hasSameElements: {
			self c2ReferencerOutSideRefereeInSide.
			self c15FullReferencerOutSide }.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - clients' }
FamixClassNavigationChefTest >> testClientClassesOutOfMyPackage [

	self assertCollection: ((self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTType) outOfContainerUsing: FamixTPackage) hasSameElements: {
			self c2ReferencerOutSideRefereeInSide.
			self c15FullReferencerOutSide }.
	self assertCollection: ((self c3ReferencerInSideRefereeOutSide allClientsAtScope: FamixTType) outOfContainerUsing: FamixTPackage) hasSameElements: {
			self c1FullReferencerOutSide.
			self c6FullReferencerInSideOutSide.
			self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - clients' }
FamixClassNavigationChefTest >> testClientNamespaces [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTNamespace)
		hasSameElements: {self n1InteractedReferencerReferee . self n4FullReferencer}
]

{ #category : 'tests - clients' }
FamixClassNavigationChefTest >> testClientPackages [
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide allClientsAtScope: FamixTPackage)
		hasSameElements: {self p2InteractedReferencerReferee . self p8FullReferencer}
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [

	| modelClasses |
	modelClasses := self model allClasses.
	self assert: (modelClasses allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTInvocation) containersOfType: FamixTType) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTInvocation) containersOfType: FamixTType) includes: referencer ] ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTInvocation) containersOfType: FamixTPackage) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTInvocation) containersOfType: FamixTType) includes: referencer ] ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTInvocation) containersOfType: FamixTNamespace) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTInvocation) containersOfType: FamixTType) includes: referencer ] ])
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testEachStaticOutgoingReferenceImpliesAStaticIncomingReference [

	| modelClasses |
	modelClasses := self model allClasses.
	self assert: (modelClasses allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTReference) containersOfType: FamixTType) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTReference) containersOfType: FamixTType) includes: referencer ] ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTReference) containersOfType: FamixTPackage) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTReference) containersOfType: FamixTType) includes: referencer ] ])
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testIncomingReferencesAreEitherPotentialOrSureOrStatic [

	| modelClasses |
	modelClasses := self model allClasses.
	self flag: 'Should we test all combinations of static, access, inheritance...?'.
	self assert: (modelClasses allSatisfy: [ :referencer |
			 (referencer queryAllIncoming containersOfType: FamixTType) includesAll: ((referencer queryIncoming: FamixTInvocation) containersOfType: FamixTType) ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
			 (referencer queryAllIncoming containersOfType: FamixTPackage) includesAll: ((referencer queryIncoming: FamixTInvocation) containersOfType: FamixTPackage) ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
			 (referencer queryAllIncoming containersOfType: FamixTNamespace) includesAll:
				 ((referencer queryIncoming: FamixTInvocation) containersOfType: FamixTNamespace) ])
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClasses [

	self assertCollection: (self c11FullRefereeOutSide queryIncoming: FamixTInheritance) opposites hasSameElements: { self c3ReferencerInSideRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesInto [

	self
		assertCollection: ((self c11FullRefereeOutSide queryIncoming: FamixTInheritance) opposites within: self n1InteractedReferencerReferee)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }.
	self
		assertCollection: ((self c11FullRefereeOutSide queryIncoming: FamixTInheritance) opposites within: self p2InteractedReferencerReferee)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesIntoMyNamespace [

	self
		assertCollection: ((self c12FullReferencerInSide queryIncoming: FamixTInheritance) opposites withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesIntoMyPackage [

	self assertEmpty: ((self c11FullRefereeOutSide queryIncoming: FamixTInheritance) opposites withinContainerUsing: FamixTPackage)
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesOutOfMyNamespace [

	self
		assertCollection: ((self c11FullRefereeOutSide queryIncoming: FamixTInheritance) opposites outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesOutOfMyPackage [

	self
		assertCollection: ((self c11FullRefereeOutSide queryIncoming: FamixTInheritance) opposites outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByNamespaces [

	self
		assertCollection: ((self c11FullRefereeOutSide queryIncoming: FamixTInheritance) containersOfType: FamixTNamespace)
		hasSameElements: { self n1InteractedReferencerReferee }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByPackages [

	self
		assertCollection: ((self c11FullRefereeOutSide queryIncoming: FamixTInheritance) containersOfType: FamixTPackage)
		hasSameElements: { self p2InteractedReferencerReferee }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClasses [

	self assertCollection: (self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesInto [

	self
		assertCollection: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites within: self p6InteractedReferee)
		hasSameElements: { self c12FullReferencerInSide }.
	self
		assertCollection: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites within: self n2FullReferee)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesIntoMyNamespace [

	self
		assertCollection: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesIntoMyPackage [

	self assertEmpty: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites withinContainerUsing: FamixTPackage)
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesOutOfMyNamespace [

	self assertEmpty: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites outOfContainerUsing: FamixTNamespace)
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesOutOfMyPackage [

	self
		assertCollection: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedNamespaces [

	self
		assertCollection: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) containersOfType: FamixTNamespace)
		hasSameElements: { self n2FullReferee }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedPackages [

	self
		assertCollection: ((self c11FullRefereeOutSide queryOutgoing: FamixTInheritance) opposites containersOfType: FamixTPackage)
		hasSameElements: { self p6InteractedReferee }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testOppositesOfCompositeQueryResult [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryAllOutgoing opposites
		hasSameElements:
			{self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide . (self getMethod: 'm2p5c11InstCreation1()').
			(self getMethod: 'm1p3c5Mtd1()') . (self getMethod: 'm1p2c3Mtd3()') . self cObject}
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testOutgoingReferencesAreEitherPotentialOrSureOrStatic [

	self flag: 'See testIncomingReferencesAreEitherPotentialOrSureOrStatic'.
	self assert: (self model allClasses allSatisfy: [ :referencer |
			 (referencer queryAllOutgoing containersOfType: FamixTType) includesAll: ((referencer queryOutgoing: FamixTInvocation) containersOfType: FamixTType) ])
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderClasses [
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTType)
		hasSameElements: {self c14ReferencerOutSideRefereeOutSide . self c18FullRefereeInSideOutSide . self c19FullRefereeOutSide}.
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTType)
		hasSameElements: self c15FullReferencerOutSide allProvidersAtMyScope
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesInto [
	self
		assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) within: self p11FullReferee)
		hasSameElements: {self c19FullRefereeOutSide}.
	self
		assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) within: self n6InteractedReferee)
		hasSameElements: {self c19FullRefereeOutSide}
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesIntoMyNamespace [

	self assertEmpty: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) withinContainerUsing: FamixTNamespace)
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesIntoMyPackage [

	self assertEmpty: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) withinContainerUsing: FamixTPackage)
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesOutOfMyNamespace [

	self assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) outOfContainerUsing: FamixTNamespace) hasSameElements: {
			self c14ReferencerOutSideRefereeOutSide.
			self c18FullRefereeInSideOutSide.
			self c19FullRefereeOutSide }
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderClassesOutOfMyPackage [

	self assertCollection: ((self c15FullReferencerOutSide allProvidersAtScope: FamixTType) outOfContainerUsing: FamixTPackage) hasSameElements: {
			self c14ReferencerOutSideRefereeOutSide.
			self c18FullRefereeInSideOutSide.
			self c19FullRefereeOutSide }
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderNamespace [
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTNamespace)
		hasSameElements: {self n3ReferencerReferee . self n5InteractedReferencer . self n6InteractedReferee}
]

{ #category : 'tests - providers' }
FamixClassNavigationChefTest >> testProviderPackages [
	self
		assertCollection: (self c15FullReferencerOutSide allProvidersAtScope: FamixTPackage)
		hasSameElements: {self p10InteractedReferee . self p11FullReferee . self pExtensions . self p7ReferencerReferee}
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClasses [

	self assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c5ReferencerInSideRefereeInSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesInto [

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) within: self p3InteractedReferencer)
		hasSameElements: { self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesIntoMyNamespace [

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: {
				self c3ReferencerInSideRefereeOutSide.
				self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesIntoMyPackage [

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: { self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesOutOfMyNamespace [

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesOutOfMyPackage [

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: {
				self c3ReferencerInSideRefereeOutSide.
				self c11FullRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedMethods [

	self assertCollection: (self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) opposites hasSameElements: {
			(self getMethod: 'm2p5c11InstCreation1()').
			(self getMethod: 'm1p2c3Mtd3()').
			(self getMethod: 'm1p3c5Mtd1()') }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedNamespaces [

	self assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTNamespace) hasSameElements: {
			self n1InteractedReferencerReferee.
			self n2FullReferee }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedPackages [

	self assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) containersOfType: FamixTPackage) hasSameElements: {
			self p2InteractedReferencerReferee.
			self p3InteractedReferencer.
			self p5FullReferee }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClasses [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) hasSameElements: {
			self c1FullReferencerOutSide.
			self c6FullReferencerInSideOutSide.
			self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesInto [

	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: (((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) within: self p1FullReferencer)
		hasSameElements: { self c1FullReferencerOutSide }.
	self
		assertCollection:
		(((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {
				self c1FullReferencerOutSide.
				self c6FullReferencerInSideOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesIntoMyNamespace [

	self assertEmpty:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) withinContainerUsing: FamixTNamespace).
	self
		assertCollection: (((self c13FullRefereeInSideOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: {
				self c12FullReferencerInSide.
				self c13FullRefereeInSideOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesIntoMyPackage [

	self assertEmpty:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) withinContainerUsing: FamixTPackage).
	self
		assertCollection: (((self c13FullRefereeInSideOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: {
				self c12FullReferencerInSide.
				self c13FullRefereeInSideOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesOutOfMyNamespace [

	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection:
		(((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesOutOfMyPackage [

	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: (((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: {
				self c1FullReferencerOutSide.
				self c6FullReferencerInSideOutSide.
				self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingMethods [

	self assertCollection: (self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) opposites hasSameElements: {
			(self getMethod: 'm1p2c2Mtd1()').
			(self getMethod: 'm1p2c2Mtd2()') }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingNamespaces [

	self assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTNamespace) hasSameElements: {
			self n3ReferencerReferee.
			self n1InteractedReferencerReferee }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingPackages [

	self assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTPackage) hasSameElements: {
			self p1FullReferencer.
			self p3InteractedReferencer.
			self p7ReferencerReferee }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testSourcesInReferencedMethods [

	self assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTInvocation) outOfContainerUsing: FamixTNamespace) sources hasSameElements: {
			(self getMethod: 'm1p3c6Mtd1()').
			(self getMethod: 'm1p3c6Mtd2()') }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testSourcesInStaticReferencedClasses [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) withinContainerUsing: FamixTPackage) sources
		hasSameElements: { (self getMethod: 'm1p3c6Mtd2()') }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClasses [

	self assertCollection: (self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTType) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c14ReferencerOutSideRefereeOutSide.
			self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesInto [

	self
		assertCollection: ((self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {
				self c3ReferencerInSideRefereeOutSide.
				self c6FullReferencerInSideOutSide.
				self c1FullReferencerOutSide }.
	self
		assertCollection: ((self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTType) within: self p3InteractedReferencer)
		hasSameElements: { self c6FullReferencerInSideOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesIntoMyNamespace [

	self
		assertCollection: ((self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesIntoMyPackage [

	self
		assertCollection: ((self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesOutOfMyNamespace [

	self assertCollection: ((self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c14ReferencerOutSideRefereeOutSide.
			self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientClassesOutOfMyPackage [

	self assertCollection: ((self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTType) outOfContainerUsing: FamixTPackage) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c14ReferencerOutSideRefereeOutSide.
			self c6FullReferencerInSideOutSide.
			self c1FullReferencerOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientNamespaces [

	self assertCollection: (self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTNamespace) hasSameElements: {
			self n1InteractedReferencerReferee.
			self n3ReferencerReferee.
			self n2FullReferee }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticClientPackages [

	self assertCollection: (self c11FullRefereeOutSide queryAllIncoming containersOfType: FamixTPackage) hasSameElements: {
			self p1FullReferencer.
			self p2InteractedReferencerReferee.
			self p3InteractedReferencer.
			self p7ReferencerReferee.
			self p5FullReferee }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClasses [

	self assertCollection: (self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTType) hasSameElements: {
			self c12FullReferencerInSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesInto [

	self
		assertCollection: ((self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTType) within: self p6InteractedReferee)
		hasSameElements: { self c12FullReferencerInSide }.
	self assertCollection: ((self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTType) within: self n2FullReferee) hasSameElements: {
			self c12FullReferencerInSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesIntoMyNamespace [

	self assertCollection: ((self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTType) withinContainerUsing: FamixTNamespace) hasSameElements: {
			self c12FullReferencerInSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesIntoMyPackage [

	self
		assertCollection: ((self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesOutOfMyNamespace [

	self assertEmpty: ((self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderClassesOutOfMyPackage [

	self
		assertCollection: ((self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderNamespaces [

	self assertCollection: (self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTNamespace) hasSameElements: { self n2FullReferee }
]

{ #category : 'tests - static dependencies' }
FamixClassNavigationChefTest >> testStaticProviderPackages [

	self assertCollection: (self c11FullRefereeOutSide queryAllOutgoing containersOfType: FamixTPackage) hasSameElements: {
			self p6InteractedReferee.
			self p5FullReferee }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClasses [

	self assertCollection: (self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c5ReferencerInSideRefereeInSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesInto [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites within: self p3InteractedReferencer)
		hasSameElements: { self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesIntoMyNamespace [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites withinContainerUsing: FamixTNamespace)
		hasSameElements: {
				self c3ReferencerInSideRefereeOutSide.
				self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesIntoMyPackage [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites withinContainerUsing: FamixTPackage)
		hasSameElements: { self c5ReferencerInSideRefereeInSide }.

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) withinContainerUsing: FamixTPackage) containersOfType: FamixTType)
		hasSameElements: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites withinContainerUsing: FamixTPackage)
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesOutOfMyNamespace [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c11FullRefereeOutSide }.

	self
		assertCollection: (((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) outOfContainerUsing: FamixTNamespace) containersOfType: FamixTType)
		hasSameElements: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites outOfContainerUsing: FamixTNamespace)
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesOutOfMyPackage [

	self assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) opposites outOfContainerUsing: FamixTPackage) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedNamespaces [

	self assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) containersOfType: FamixTNamespace) hasSameElements: {
			self n2FullReferee.
			self n1InteractedReferencerReferee }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedPackages [

	self assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoing: FamixTReference) containersOfType: FamixTPackage) hasSameElements: {
			self p2InteractedReferencerReferee.
			self p5FullReferee.
			self p3InteractedReferencer }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClasses [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) hasSameElements: {
			self c6FullReferencerInSideOutSide.
			self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesInto [

	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self assertEmpty: (((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) within: self p1FullReferencer).
	self
		assertCollection:
		(((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: { self c6FullReferencerInSideOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesIntoMyNamespace [

	self assertEmpty:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) withinContainerUsing: FamixTNamespace).

	self
		assertCollection: (((self c13FullRefereeInSideOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesIntoMyPackage [

	self assertEmpty: (((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) withinContainerUsing: FamixTPackage).

	self
		assertCollection: (((self c13FullRefereeInSideOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesOutOfMyNamespace [

	self
		assertCollection:
		(((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.

	self
		assertCollection: (((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesOutOfMyPackage [

	self
		assertCollection: (((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.

	self
		assertCollection: (((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: {
				self c6FullReferencerInSideOutSide.
				self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingMethods [

	self assertCollection: (self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTReference) opposites hasSameElements: {
			(self getMethod: 'm1p2c2Mtd1()').
			(self getMethod: 'm1p2c2Mtd2()') }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingNamespaces [

	self assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTNamespace) hasSameElements: {
			self n3ReferencerReferee.
			self n1InteractedReferencerReferee }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingPackages [

	self assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncoming: FamixTReference) containersOfType: FamixTPackage) hasSameElements: {
			self p3InteractedReferencer.
			self p7ReferencerReferee }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testSureReferencedClassesIncludeAllStaticReferencedClasses [

	self assert: (self model allClasses allSatisfy: [ :referencer |
			 (referencer queryAllOutgoing containersOfType: FamixTType) includesAll: (referencer queryAllOutgoing containersOfType: FamixTType) ])
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testSureReferencingClassesIncludeAllStaticReferencingClasses [

	self assert: (self model allClasses allSatisfy: [ :referencer |
			 (referencer queryAllIncoming containersOfType: FamixTType) includesAll: (referencer queryAllIncoming containersOfType: FamixTType) ])
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testTargetMethodsInReferencingMethods [

	self assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncoming: FamixTInvocation) targetsAtScope: FamixTMethod) hasSameElements: {
			(self getMethod: 'm3p7c14Mtd2()').
			(self getMethod: 'm3p7c14Mtd4()').
			(self getMethod: 'm3p7c14InstCreation()') }
]

{ #category : 'tests' }
FamixClassNavigationChefTest >> testUnion [
	| queryResult anotherResult |
	queryResult := MooseQueryResult on: #FakeReceiver withAll: #(1 2 3).
	self assertCollection: (queryResult union: #(4 5)) hasSameElements: #(1 2 3 4 5).
	self assert: (queryResult union: #(4 5)) receiver equals: #FakeReceiver.
	anotherResult := MooseQueryResult on: #FakeReceiver withAll: #(4 5).
	self assertCollection: (queryResult union: anotherResult) hasSameElements: #(1 2 3 4 5).
	self assert: (queryResult union: anotherResult) receiver equals: #FakeReceiver
]

{ #category : 'tests' }
FamixClassNavigationChefTest >> testWithin [

	self
		assertCollection: ((self c1FullReferencerOutSide queryAllOutgoing within: self p2InteractedReferencerReferee) containersOfType: FamixTType)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }.
	self assertCollection: ((self c1FullReferencerOutSide queryOutgoing: FamixTInvocation) within: self c13FullRefereeInSideOutSide) opposites hasSameElements: {
			(self getMethod: 'm2p6c13Mtd2()').
			(self getMethod: 'm2p6c13Mtd1:(Object)').
			(self getMethod: 'm2p6c13InstCreation()') }
]
