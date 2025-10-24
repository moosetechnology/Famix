Class {
	#name : 'FamixPackageNavigationChefTest',
	#superclass : 'AbstractFamixNavigationTest',
	#category : 'Moose-SmalltalkImporter-KGB-Tests-MooseChef',
	#package : 'Moose-SmalltalkImporter-KGB-Tests',
	#tag : 'MooseChef'
}

{ #category : 'tests - clients' }
FamixPackageNavigationChefTest >> testClientClasses [

	self assertCollection: (self p5FullReferee queryAllIncoming containersOfType: FamixTType) hasSameElements: {
			self c1FullReferencerOutSide.
			self c14ReferencerOutSideRefereeOutSide.
			self c6FullReferencerInSideOutSide.
			self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - clients' }
FamixPackageNavigationChefTest >> testClientClassesInto [

	self
		assertCollection: ((self p5FullReferee queryAllIncoming containersOfType: FamixTType) within: self p1FullReferencer)
		hasSameElements: { self c1FullReferencerOutSide }
]

{ #category : 'tests - clients' }
FamixPackageNavigationChefTest >> testClientPackages [

	self assertCollection: (self p5FullReferee queryAllIncoming containersOfType: FamixTPackage) hasSameElements: {
			self p1FullReferencer.
			self p2InteractedReferencerReferee.
			self p7ReferencerReferee.
			self p3InteractedReferencer.
			self p5FullReferee }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testEachOutgoingReferenceImpliesAnIncomingReference [

	| modelPackages |
	modelPackages := self model allPackages.
	self assert: (modelPackages allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTInvocation) containersOfType: FamixTType) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTInvocation) containersOfType: FamixTPackage) includes: referencer ] ]).
	self assert: (modelPackages allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTInvocation) containersOfType: FamixTPackage) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTInvocation) containersOfType: FamixTPackage) includes: referencer ] ])
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testEachStaticOutgoingReferenceImpliesAStaticIncomingReference [

	| modelPackages |
	modelPackages := self model allPackages.
	self assert: (modelPackages allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTReference) containersOfType: FamixTType) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTReference) containersOfType: FamixTPackage) includes: referencer ] ]).
	self assert: (modelPackages allSatisfy: [ :referencer |
				 ((referencer queryOutgoing: FamixTReference) containersOfType: FamixTPackage) allSatisfy: [ :referenced |
					 ((referenced queryIncoming: FamixTReference) containersOfType: FamixTPackage) includes: referencer ] ])
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedByClasses [

	self assertCollection: (self p6InteractedReferee queryIncoming: FamixTInheritance) opposites hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedByClassesInto [

	self
		assertCollection: ((self p6InteractedReferee queryIncoming: FamixTInheritance) opposites within: self p5FullReferee)
		hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedByPackages [

	self assertCollection: ((self p6InteractedReferee queryIncoming: FamixTInheritance) containersOfType: FamixTPackage) hasSameElements: { self p5FullReferee }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClasses [

	self assertCollection: (self p5FullReferee queryOutgoing: FamixTInheritance) opposites hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClassesAsSourceOfInheritance [

	self
		assertCollection: ((self c6FullReferencerInSideOutSide queryIncoming: FamixTInheritance) sourcesAtScope: FamixTClass)
		hasSameElements: { self c8FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClassesAsTargetOfInheritance [

	self
		assertCollection: ((self c8FullReferencerInSide queryOutgoing: FamixTInheritance) targetsAtScope: FamixTClass)
		hasSameElements: { self c6FullReferencerInSideOutSide }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedClassesInto [

	self
		assertCollection: ((self p5FullReferee queryOutgoing: FamixTInheritance) opposites within: self p6InteractedReferee)
		hasSameElements: { self c12FullReferencerInSide }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testInheritedPackages [

	self assertCollection: ((self p5FullReferee queryOutgoing: FamixTInheritance) containersOfType: FamixTPackage) hasSameElements: { self p6InteractedReferee }
]

{ #category : 'tests - providers' }
FamixPackageNavigationChefTest >> testProviderClasses [

	self assertCollection: (self p8FullReferencer queryAllOutgoing containersOfType: FamixTType) hasSameElements: {
			self c18FullRefereeInSideOutSide.
			self c19FullRefereeOutSide.
			self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - providers' }
FamixPackageNavigationChefTest >> testProviderClassesInto [

	self
		assertCollection: ((self p8FullReferencer queryAllOutgoing containersOfType: FamixTType) within: self p11FullReferee)
		hasSameElements: { self c19FullRefereeOutSide }.
	self assertEmpty: ((self p8FullReferencer queryAllOutgoing containersOfType: FamixTType) within: self pExtensions)
]

{ #category : 'tests - providers' }
FamixPackageNavigationChefTest >> testProviderPackages [

	self assertCollection: (self p8FullReferencer queryAllOutgoing containersOfType: FamixTPackage) hasSameElements: {
			self p10InteractedReferee.
			self p11FullReferee.
			self p7ReferencerReferee.
			self pExtensions }
]

{ #category : 'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testReferencedClasses [

	self assertCollection: ((self p8FullReferencer queryOutgoing: FamixTInvocation) containersOfType: FamixTType) hasSameElements: {
			self c18FullRefereeInSideOutSide.
			self c19FullRefereeOutSide }
]

{ #category : 'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testReferencedClassesInto [

	self
		assertCollection: (((self p8FullReferencer queryOutgoing: FamixTInvocation) containersOfType: FamixTType) within: self p11FullReferee)
		hasSameElements: { self c19FullRefereeOutSide }.
	self assertEmpty: (((self p8FullReferencer queryOutgoing: FamixTInvocation) containersOfType: FamixTType) within: self pExtensions)
]

{ #category : 'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testReferencedPackages [

	self assertCollection: ((self p8FullReferencer queryOutgoing: FamixTInvocation) containersOfType: FamixTPackage) hasSameElements: {
			self p10InteractedReferee.
			self p11FullReferee.
			self pExtensions }.
	self assertCollection: ((self pExtensions queryOutgoing: FamixTInvocation) containersOfType: FamixTPackage) hasSameElements: { self p11FullReferee }
]

{ #category : 'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testReferencingClasses [

	self assertCollection: ((self p5FullReferee queryIncoming: FamixTInvocation) containersOfType: FamixTType) hasSameElements: {
			self c1FullReferencerOutSide.
			self c14ReferencerOutSideRefereeOutSide.
			self c6FullReferencerInSideOutSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testReferencingClassesInto [

	self
		assertCollection: (((self p5FullReferee queryIncoming: FamixTInvocation) containersOfType: FamixTType) within: self p1FullReferencer)
		hasSameElements: { self c1FullReferencerOutSide }
]

{ #category : 'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testReferencingPackages [

	self assertCollection: ((self p5FullReferee queryIncoming: FamixTInvocation) containersOfType: FamixTPackage) hasSameElements: {
			self p1FullReferencer.
			self p3InteractedReferencer.
			self p7ReferencerReferee.
			self p5FullReferee }
]

{ #category : 'tests - inheritance' }
FamixPackageNavigationChefTest >> testSourceClassesInInheritedClasses [

	self assertCollection: ((self p3InteractedReferencer queryOutgoing: FamixTInheritance) sourcesAtScope: FamixTClass) hasSameElements: {
			self c5ReferencerInSideRefereeInSide.
			self c6FullReferencerInSideOutSide.
			self c7FullRefereeInSide.
			self c8FullReferencerInSide }.

	self assertCollection: ((self p3InteractedReferencer queryOutgoing: FamixTInheritance) withoutSelfLoops sourcesAtScope: FamixTClass) hasSameElements: {
			self c5ReferencerInSideRefereeInSide.
			self c6FullReferencerInSideOutSide.
			self c7FullRefereeInSide }
]

{ #category : 'tests - outgoing invocations' }
FamixPackageNavigationChefTest >> testSourceClassesInReferencedClasses [

	self assertCollection: ((self p3InteractedReferencer queryOutgoing: FamixTInvocation) sourcesAtScope: FamixTClass) hasSameElements: {
			self c5ReferencerInSideRefereeInSide.
			self c6FullReferencerInSideOutSide }
]

{ #category : 'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticClientClasses [

	self assertCollection: (self p5FullReferee queryAllIncoming containersOfType: FamixTType) hasSameElements: {
			self c1FullReferencerOutSide.
			self c14ReferencerOutSideRefereeOutSide.
			self c6FullReferencerInSideOutSide.
			self c3ReferencerInSideRefereeOutSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticClientClassesInto [

	self
		assertCollection: ((self p5FullReferee queryAllIncoming containersOfType: FamixTType) within: self p1FullReferencer)
		hasSameElements: { self c1FullReferencerOutSide }
]

{ #category : 'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticClientPackages [

	self assertCollection: (self p5FullReferee queryAllIncoming containersOfType: FamixTPackage) hasSameElements: {
			self p1FullReferencer.
			self p2InteractedReferencerReferee.
			self p7ReferencerReferee.
			self p3InteractedReferencer.
			self p5FullReferee }
]

{ #category : 'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticProviderClasses [

	self assertCollection: (self p8FullReferencer queryAllOutgoing containersOfType: FamixTType) hasSameElements: {
			self c18FullRefereeInSideOutSide.
			self c19FullRefereeOutSide.
			self c14ReferencerOutSideRefereeOutSide }
]

{ #category : 'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticProviderClassesInto [

	self
		assertCollection: ((self p8FullReferencer queryAllOutgoing containersOfType: FamixTType) within: self p11FullReferee)
		hasSameElements: { self c19FullRefereeOutSide }.
	self assertEmpty: ((self p8FullReferencer queryAllOutgoing containersOfType: FamixTType) within: self pExtensions)
]

{ #category : 'tests - static dependencies' }
FamixPackageNavigationChefTest >> testStaticProviderPackages [
	" distinction between static and other associations is no more done. This test is henceforth expected to fail."

	<expectedFailure>
	self assertCollection: (self p8FullReferencer queryAllOutgoing containersOfType: FamixTPackage) hasSameElements: {
			self p10InteractedReferee.
			self p11FullReferee.
			self p7ReferencerReferee }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencedClasses [

	self assertCollection: ((self p8FullReferencer queryOutgoing: FamixTReference) containersOfType: FamixTType) hasSameElements: {
			self c18FullRefereeInSideOutSide.
			self c19FullRefereeOutSide }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencedClassesInto [

	self
		assertCollection: (((self p8FullReferencer queryOutgoing: FamixTReference) containersOfType: FamixTType) within: self p11FullReferee)
		hasSameElements: { self c19FullRefereeOutSide }.
	self assertEmpty: (((self p8FullReferencer queryOutgoing: FamixTReference) containersOfType: FamixTType) within: self pExtensions)
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencedPackages [

	self assertCollection: ((self p8FullReferencer queryOutgoing: FamixTReference) containersOfType: FamixTPackage) hasSameElements: {
			self p10InteractedReferee.
			self p11FullReferee }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencingClasses [

	self assertCollection: ((self p5FullReferee queryIncoming: FamixTReference) containersOfType: FamixTType) hasSameElements: {
			self c1FullReferencerOutSide.
			self c14ReferencerOutSideRefereeOutSide.
			self c6FullReferencerInSideOutSide.
			self c11FullRefereeOutSide }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencingClassesInto [

	self
		assertCollection: (((self p5FullReferee queryIncoming: FamixTReference) containersOfType: FamixTType) within: self p1FullReferencer)
		hasSameElements: { self c1FullReferencerOutSide }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testStaticReferencingPackages [

	self assertCollection: ((self p5FullReferee queryIncoming: FamixTReference) containersOfType: FamixTPackage) hasSameElements: {
			self p1FullReferencer.
			self p7ReferencerReferee.
			self p3InteractedReferencer.
			self p5FullReferee }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testSureReferencedClassesIncludeAllStaticReferencedClasses [

	self assert: (self model allPackages allSatisfy: [ :referencer | 
			 referencer queryAllOutgoing includesAll:
				 referencer queryAllOutgoing ])
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testSureReferencingClassesIncludeAllStaticReferencingClasses [

	self assert: (self model allPackages allSatisfy: [ :referencer | 
			 referencer queryAllIncoming includesAll:
				 referencer queryAllIncoming ])
]

{ #category : 'tests - incoming invocations' }
FamixPackageNavigationChefTest >> testTargetClassesInReferencingClasses [

	self assertCollection: ((self p5FullReferee queryIncoming: FamixTInvocation) targetsAtScope: FamixTClass) hasSameElements: { self c11FullRefereeOutSide }
]

{ #category : 'tests - references' }
FamixPackageNavigationChefTest >> testTargetClassesInStaticReferencingClasses [

	self assertCollection: ((self p2InteractedReferencerReferee queryIncoming: FamixTReference) targetsAtScope: FamixTClass) hasSameElements: {
			self c2ReferencerOutSideRefereeInSide.
			self c3ReferencerInSideRefereeOutSide.
			self c4FullRefereeInSide }.
	self
		assertCollection: ((self p2InteractedReferencerReferee queryIncoming: FamixTReference) withoutSelfLoops targetsAtScope: FamixTClass)
		hasSameElements: { self c3ReferencerInSideRefereeOutSide }
]
