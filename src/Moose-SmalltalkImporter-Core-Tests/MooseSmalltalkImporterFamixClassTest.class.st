Class {
	#name : #MooseSmalltalkImporterFamixClassTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #tests }
MooseSmalltalkImporterFamixClassTest >> testIsTestCase [

	| mooseModel |
	mooseModel := FamixStModel new.
	FamixStPharoImporterTask new
		model: mooseModel;
		addClasses: (OrderedCollection with: self class);
		run.
	self assert: (mooseModel allModelClasses select: #isInstanceSide) first isTestCase
]
