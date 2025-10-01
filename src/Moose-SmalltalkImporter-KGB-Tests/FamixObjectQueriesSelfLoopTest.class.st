Class {
	#name : 'FamixObjectQueriesSelfLoopTest',
	#superclass : 'AbstractFamixNavigationTest',
	#category : 'Moose-SmalltalkImporter-KGB-Tests-MooseChef',
	#package : 'Moose-SmalltalkImporter-KGB-Tests',
	#tag : 'MooseChef'
}

{ #category : 'tests' }
FamixObjectQueriesSelfLoopTest >> testClassObjectTests [

	self
		assertCollection: (self c1FullReferencerOutSide queryAllIncomingInvocations containersOfType: FamixTType)
		hasSameElements: { self c1FullReferencerOutSide }.
	self deny: ((self c1FullReferencerOutSide queryAllIncomingInvocations containersOfType: FamixTType) withoutSelfLoops includes: self c1FullReferencerOutSide)
]

{ #category : 'tests' }
FamixObjectQueriesSelfLoopTest >> testPackageObjectTests [

	self assertCollection: (self p1FullReferencer queryAllIncomingInvocations containersOfType: FamixTPackage) hasSameElements: { self p1FullReferencer }.
	self deny: ((self p1FullReferencer queryAllIncomingInvocations containersOfType: FamixTType) withoutSelfLoops includes: self p1FullReferencer)
]
