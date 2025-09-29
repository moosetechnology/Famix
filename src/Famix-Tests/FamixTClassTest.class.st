Class {
	#name : 'FamixTClassTest',
	#superclass : 'TestCase',
	#instVars : [
		'class'
	],
	#category : 'Famix-Tests',
	#package : 'Famix-Tests'
}

{ #category : 'running' }
FamixTClassTest >> setUp [

	super setUp.
	class := MooseEntity new
		         addTalent: FamixTClass;
		         yourself
]

{ #category : 'tests' }
FamixTClassTest >> testIsTestCase [

	self deny: class isTestCase.
	class isTestCase: true.
	self assert: class isTestCase.
	class isTestCase: false.
	self deny: class isTestCase
]
