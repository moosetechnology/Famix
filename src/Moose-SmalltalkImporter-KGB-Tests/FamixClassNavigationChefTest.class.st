Class {
	#name : 'FamixClassNavigationChefTest',
	#superclass : 'AbstractFamixNavigationTest',
	#category : 'Moose-SmalltalkImporter-KGB-Tests-MooseChef',
	#package : 'Moose-SmalltalkImporter-KGB-Tests',
	#tag : 'MooseChef'
}

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testAllIncomingInvocationsIntoMyNamespace [

	self assertEmpty: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations withinContainerUsing: FamixTNamespace).
	self assertCollection: (self c13FullRefereeInSideOutSide queryAllIncomingInvocations withinContainerUsing: FamixTNamespace) opposites hasSameElements: {
			(self getMethod: 'm2p6c13Mtd3()').
			(self getMethod: 'm2p6c13InstCreation()').
			(self getMethod: 'm2p6c12Mtd1()') }.
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations withinContainerUsing: FamixTNamespace) containersOfType: FamixTType)
		hasSameElements: {
				self c13FullRefereeInSideOutSide.
				self c12FullReferencerInSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testAllIncomingInvocationsOutOfMyPackage [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations outOfContainerUsing: FamixTPackage) containersOfType: FamixTType)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations outOfContainerUsing: FamixTPackage) containersOfType: FamixTType)
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
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations withinContainerUsing: FamixTPackage) containersOfType: FamixTType)
		hasSameElements: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) withinContainerUsing: FamixTPackage).
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations withinContainerUsing: FamixTPackage) opposites
		hasSameElements: { (self getMethod: 'm1p3c5Mtd1()') }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsOutOfMyNamespace [

	self assert: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfContainerUsing: FamixTNamespace) size equals: 3.
	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfContainerUsing: FamixTNamespace) containersOfType: FamixTType)
		hasSameElements: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testAllOutgoingInvocationsWithoutSelfLoops [

	self assert: self c1FullReferencerOutSide queryAllOutgoingInvocations size equals: 13.
	self assert: ((self c1FullReferencerOutSide queryAllOutgoingInvocations containersOfType: FamixTType) includes: self c1FullReferencerOutSide).
	self assert: self c1FullReferencerOutSide queryAllOutgoingInvocations withoutSelfLoops size equals: 12.
	self deny: ((self c1FullReferencerOutSide queryAllOutgoingInvocations withoutSelfLoops containersOfType: FamixTType) includes: self c1FullReferencerOutSide)
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
				 (referencer queryAllOutgoingInvocations containersOfType: FamixTType) allSatisfy: [ :referenced |
					 (referenced queryAllIncomingInvocations containersOfType: FamixTType) includes: referencer ] ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
				 (referencer queryAllOutgoingInvocations containersOfType: FamixTPackage) allSatisfy: [ :referenced |
					 (referenced queryAllIncomingInvocations containersOfType: FamixTType) includes: referencer ] ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
				 (referencer queryAllOutgoingInvocations containersOfType: FamixTNamespace) allSatisfy: [ :referenced |
					 (referenced queryAllIncomingInvocations containersOfType: FamixTType) includes: referencer ] ])
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testEachStaticOutgoingReferenceImpliesAStaticIncomingReference [

	| modelClasses |
	modelClasses := self model allClasses.
	self assert: (modelClasses allSatisfy: [ :referencer |
				 (referencer queryOutgoingReferences containersOfType: FamixTType) allSatisfy: [ :referenced |
					 (referenced queryIncomingReferences containersOfType: FamixTType) includes: referencer ] ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
				 (referencer queryOutgoingReferences containersOfType: FamixTPackage) allSatisfy: [ :referenced |
					 (referenced queryIncomingReferences containersOfType: FamixTType) includes: referencer ] ])
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testIncomingReferencesAreEitherPotentialOrSureOrStatic [

	| modelClasses |
	modelClasses := self model allClasses.
	self flag: 'Should we test all combinations of static, access, inheritance...?'.
	self assert: (modelClasses allSatisfy: [ :referencer |
			 (referencer queryAllIncoming containersOfType: FamixTType) includesAll: (referencer queryAllIncomingInvocations containersOfType: FamixTType) ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
			 (referencer queryAllIncoming containersOfType: FamixTPackage) includesAll: (referencer queryAllIncomingInvocations containersOfType: FamixTPackage) ]).
	self assert: (modelClasses allSatisfy: [ :referencer |
			 (referencer queryAllIncoming containersOfType: FamixTNamespace) includesAll: (referencer queryAllIncomingInvocations containersOfType: FamixTNamespace) ])
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClasses [
	self assertCollection: self c11FullRefereeOutSide queryIncomingInheritances opposites hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesInto [
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites within: self n1InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}.
	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites within: self p2InteractedReferencerReferee)
		hasSameElements: {self c3ReferencerInSideRefereeOutSide}
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesIntoMyNamespace [

	self
		assertCollection: (self c12FullReferencerInSide queryIncomingInheritances opposites withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesIntoMyPackage [

	self assertEmpty: (self c11FullRefereeOutSide queryIncomingInheritances opposites withinContainerUsing: FamixTPackage)
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesOutOfMyNamespace [

	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByClassesOutOfMyPackage [

	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances opposites outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByNamespaces [

	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances containersOfType: FamixTNamespace)
		hasSameElements: { self n1InteractedReferencerReferee }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedByPackages [

	self
		assertCollection: (self c11FullRefereeOutSide queryIncomingInheritances containersOfType: FamixTPackage)
		hasSameElements: { self p2InteractedReferencerReferee }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClasses [
	self assertCollection: self c11FullRefereeOutSide queryOutgoingInheritances opposites hasSameElements: {self c12FullReferencerInSide}
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesInto [
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites within: self p6InteractedReferee)
		hasSameElements: {self c12FullReferencerInSide}.
	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites within: self n2FullReferee)
		hasSameElements: {self c12FullReferencerInSide}
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesIntoMyNamespace [

	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesIntoMyPackage [

	self assertEmpty: (self c11FullRefereeOutSide queryOutgoingInheritances opposites withinContainerUsing: FamixTPackage)
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesOutOfMyNamespace [

	self assertEmpty: (self c11FullRefereeOutSide queryOutgoingInheritances opposites outOfContainerUsing: FamixTNamespace)
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedClassesOutOfMyPackage [

	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedNamespaces [

	self assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances containersOfType: FamixTNamespace) hasSameElements: { self n2FullReferee }
]

{ #category : 'tests - inheritance' }
FamixClassNavigationChefTest >> testInheritedPackages [

	self
		assertCollection: (self c11FullRefereeOutSide queryOutgoingInheritances opposites containersOfType: FamixTPackage)
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
			 (referencer queryAllOutgoing containersOfType: FamixTType) includesAll: (referencer queryAllOutgoingInvocations containersOfType: FamixTType) ])
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

	self assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c5ReferencerInSideRefereeInSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesInto [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) within: self p3InteractedReferencer)
		hasSameElements: { self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesIntoMyNamespace [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: {
				self c3ReferencerInSideRefereeOutSide.
				self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesIntoMyPackage [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: { self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesOutOfMyNamespace [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedClassesOutOfMyPackage [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: {
				self c3ReferencerInSideRefereeOutSide.
				self c11FullRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedMethods [
	self
		assertCollection: self c6FullReferencerInSideOutSide queryAllOutgoingInvocations opposites
		hasSameElements:
			{(self getMethod: 'm2p5c11InstCreation1()') . (self getMethod: 'm1p2c3Mtd3()') . (self getMethod: 'm1p3c5Mtd1()')}
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedNamespaces [

	self assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTNamespace) hasSameElements: {
			self n1InteractedReferencerReferee.
			self n2FullReferee }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testReferencedPackages [

	self assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations containersOfType: FamixTPackage) hasSameElements: {
			self p2InteractedReferencerReferee.
			self p3InteractedReferencer.
			self p5FullReferee }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClasses [

	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) hasSameElements: {
			self c1FullReferencerOutSide.
			self c6FullReferencerInSideOutSide.
			self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesInto [

	self
		assertCollection:
		((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection:
		((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) within: self p1FullReferencer)
		hasSameElements: { self c1FullReferencerOutSide }.
	self
		assertCollection:
		((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: {
				self c1FullReferencerOutSide.
				self c6FullReferencerInSideOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesIntoMyNamespace [

	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) withinContainerUsing: FamixTNamespace).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: {
				self c12FullReferencerInSide.
				self c13FullRefereeInSideOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesIntoMyPackage [

	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) withinContainerUsing: FamixTPackage).
	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryAllIncomingInvocations containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: {
				self c12FullReferencerInSide.
				self c13FullRefereeInSideOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesOutOfMyNamespace [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingClassesOutOfMyPackage [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: {
				self c1FullReferencerOutSide.
				self c6FullReferencerInSideOutSide.
				self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingMethods [
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations opposites
		hasSameElements: {(self getMethod: 'm1p2c2Mtd1()') . (self getMethod: 'm1p2c2Mtd2()')}
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingNamespaces [

	self assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTNamespace) hasSameElements: {
			self n3ReferencerReferee.
			self n1InteractedReferencerReferee }
]

{ #category : 'tests - incoming invocations' }
FamixClassNavigationChefTest >> testReferencingPackages [

	self assertCollection: (self c3ReferencerInSideRefereeOutSide queryAllIncomingInvocations containersOfType: FamixTPackage) hasSameElements: {
			self p1FullReferencer.
			self p3InteractedReferencer.
			self p7ReferencerReferee }
]

{ #category : 'tests - outgoing invocations' }
FamixClassNavigationChefTest >> testSourcesInReferencedMethods [

	self assertCollection: (self c6FullReferencerInSideOutSide queryAllOutgoingInvocations outOfContainerUsing: FamixTNamespace) sources hasSameElements: {
			(self getMethod: 'm1p3c6Mtd1()').
			(self getMethod: 'm1p3c6Mtd2()') }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testSourcesInStaticReferencedClasses [

	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences withinContainerUsing: FamixTPackage) sources
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
	self
		assertCollection: self c6FullReferencerInSideOutSide queryOutgoingReferences opposites
		hasSameElements: {self c3ReferencerInSideRefereeOutSide . self c5ReferencerInSideRefereeInSide . self c11FullRefereeOutSide}
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesInto [
	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites within: self p3InteractedReferencer)
		hasSameElements: {self c5ReferencerInSideRefereeInSide}
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesIntoMyNamespace [

	self assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinContainerUsing: FamixTNamespace) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c5ReferencerInSideRefereeInSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesIntoMyPackage [

	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinContainerUsing: FamixTPackage)
		hasSameElements: { self c5ReferencerInSideRefereeInSide }.

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoingReferences withinContainerUsing: FamixTPackage) containersOfType: FamixTType)
		hasSameElements: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites withinContainerUsing: FamixTPackage)
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesOutOfMyNamespace [

	self
		assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c11FullRefereeOutSide }.

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryOutgoingReferences outOfContainerUsing: FamixTNamespace) containersOfType: FamixTType)
		hasSameElements: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfContainerUsing: FamixTNamespace)
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedClassesOutOfMyPackage [

	self assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences opposites outOfContainerUsing: FamixTPackage) hasSameElements: {
			self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedNamespaces [

	self assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences containersOfType: FamixTNamespace) hasSameElements: {
			self n2FullReferee.
			self n1InteractedReferencerReferee }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencedPackages [

	self assertCollection: (self c6FullReferencerInSideOutSide queryOutgoingReferences containersOfType: FamixTPackage) hasSameElements: {
			self p2InteractedReferencerReferee.
			self p5FullReferee.
			self p3InteractedReferencer }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClasses [

	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) hasSameElements: {
			self c6FullReferencerInSideOutSide.
			self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesInto [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) within: self p2InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.
	self assertEmpty: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) within: self p1FullReferencer).
	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) within: self n1InteractedReferencerReferee)
		hasSameElements: { self c6FullReferencerInSideOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesIntoMyNamespace [

	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) withinContainerUsing: FamixTNamespace).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryIncomingReferences containersOfType: FamixTType) withinContainerUsing: FamixTNamespace)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesIntoMyPackage [

	self assertEmpty: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) withinContainerUsing: FamixTPackage).

	self
		assertCollection: ((self c13FullRefereeInSideOutSide queryIncomingReferences containersOfType: FamixTType) withinContainerUsing: FamixTPackage)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesOutOfMyNamespace [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.

	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) outOfContainerUsing: FamixTNamespace)
		hasSameElements: { self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingClassesOutOfMyPackage [

	self
		assertCollection: ((self c14ReferencerOutSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: { self c2ReferencerOutSideRefereeInSide }.

	self
		assertCollection: ((self c3ReferencerInSideRefereeOutSide queryIncomingReferences containersOfType: FamixTType) outOfContainerUsing: FamixTPackage)
		hasSameElements: {
				self c6FullReferencerInSideOutSide.
				self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingMethods [
	self
		assertCollection: self c14ReferencerOutSideRefereeOutSide queryIncomingReferences opposites
		hasSameElements: {(self getMethod: 'm1p2c2Mtd1()') . (self getMethod: 'm1p2c2Mtd2()')}
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingNamespaces [

	self assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences containersOfType: FamixTNamespace) hasSameElements: {
			self n3ReferencerReferee.
			self n1InteractedReferencerReferee }
]

{ #category : 'tests - references' }
FamixClassNavigationChefTest >> testStaticReferencingPackages [

	self assertCollection: (self c3ReferencerInSideRefereeOutSide queryIncomingReferences containersOfType: FamixTPackage) hasSameElements: {
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
	self
		assertCollection: (self c14ReferencerOutSideRefereeOutSide queryAllIncomingInvocations targetsAtScope: FamixTMethod)
		hasSameElements: {(self getMethod: 'm3p7c14Mtd2()') . (self getMethod: 'm3p7c14Mtd4()') . (self getMethod: 'm3p7c14InstCreation()')}
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
	self assertCollection: (self c1FullReferencerOutSide queryAllOutgoingInvocations within: self c13FullRefereeInSideOutSide) opposites hasSameElements: {
			(self getMethod: 'm2p6c13Mtd2()').
			(self getMethod: 'm2p6c13Mtd1:(Object)').
			(self getMethod: 'm2p6c13InstCreation()') }
]
