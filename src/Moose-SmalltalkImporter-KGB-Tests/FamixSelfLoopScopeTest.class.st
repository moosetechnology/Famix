Class {
	#name : 'FamixSelfLoopScopeTest',
	#superclass : 'AbstractFamixNavigationTest',
	#category : 'Moose-SmalltalkImporter-KGB-Tests-MooseChef',
	#package : 'Moose-SmalltalkImporter-KGB-Tests',
	#tag : 'MooseChef'
}

{ #category : 'tests - class' }
FamixSelfLoopScopeTest >> testFamixClassClassScope [

	self assert: ((self c12FullReferencerInSide containersOfType: FamixTClass) includes: self c12FullReferencerInSide).
	self deny: ((self c12FullReferencerInSide containersOfType: FamixTClass) includes: self c13FullRefereeInSideOutSide).
	self assert: (((self c1FullReferencerOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTClass) includes: self c1FullReferencerOutSide).
	self deny:
		(((self c1FullReferencerOutSide queryIncoming: FamixTInvocation) containersOfType: FamixTClass) withoutSelfLoops includes: self c1FullReferencerOutSide)
]

{ #category : 'tests - class' }
FamixSelfLoopScopeTest >> testFamixClassNamespaceScope [

	self assert: ((self c12FullReferencerInSide containersOfType: FamixTNamespace) includes: self n2FullReferee).
	self deny: ((self c12FullReferencerInSide containersOfType: FamixTNamespace) includes: self n1InteractedReferencerReferee)
]

{ #category : 'tests - class' }
FamixSelfLoopScopeTest >> testFamixClassPackageScope [

	self assert: ((self c12FullReferencerInSide containersOfType: FamixTPackage) includes: self p6InteractedReferee).
	self deny: ((self c12FullReferencerInSide containersOfType: FamixTPackage) includes: self p5FullReferee)
]

{ #category : 'tests - method' }
FamixSelfLoopScopeTest >> testFamixMethodClassScope [

	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)'.

	self assert: ((c1Mtd4 containersOfType: FamixTClass) includes: self c1FullReferencerOutSide).
	self deny: ((c1Mtd4 containersOfType: FamixTClass) includes: self c2ReferencerOutSideRefereeInSide)
]

{ #category : 'tests - method' }
FamixSelfLoopScopeTest >> testFamixMethodNamespaceScope [

	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)'.

	self assert: ((c1Mtd4 containersOfType: FamixTNamespace) includes: self n1InteractedReferencerReferee).
	self deny: ((c1Mtd4 containersOfType: FamixTNamespace) includes: self n2FullReferee)
]

{ #category : 'tests - method' }
FamixSelfLoopScopeTest >> testFamixMethodPackageScope [

	| c1Mtd4 |
	c1Mtd4 := self getMethod: 'm1p1c1Mtd4:(Object)'.

	self assert: ((c1Mtd4 containersOfType: FamixTPackage) includes: self p1FullReferencer).
	self deny: ((c1Mtd4 containersOfType: FamixTPackage) includes: self p2InteractedReferencerReferee)
]

{ #category : 'tests - namespace' }
FamixSelfLoopScopeTest >> testFamixNamespaceClassScope [

	self assert: ((self n1InteractedReferencerReferee containedEntitiesOfType: FamixTClass) includes: self c2ReferencerOutSideRefereeInSide).
	self deny: ((self n1InteractedReferencerReferee containersOfType: FamixTClass) includes: self c20FullReferencerOutSide)
]

{ #category : 'tests - namespace' }
FamixSelfLoopScopeTest >> testFamixNamespaceNamespaceScope [

	self assert: ((self n1InteractedReferencerReferee containersOfType: FamixTNamespace) includes: self n1InteractedReferencerReferee).
	self deny: ((self n1InteractedReferencerReferee containersOfType: FamixTNamespace) includes: self n2FullReferee)
]

{ #category : 'tests - package' }
FamixSelfLoopScopeTest >> testFamixPackageClassScope [

	self assert: ((self p5FullReferee containedEntitiesOfType: FamixTClass) includes: self c11FullRefereeOutSide).
	self deny: ((self p5FullReferee containersOfType: FamixTClass) includes: self c5ReferencerInSideRefereeInSide)
]

{ #category : 'tests - package' }
FamixSelfLoopScopeTest >> testFamixPackagePackageScope [

	self assert: ((self p5FullReferee containersOfType: FamixTPackage) includes: self p5FullReferee).
	self deny: ((self p5FullReferee containersOfType: FamixTPackage) includes: self p10InteractedReferee)
]
