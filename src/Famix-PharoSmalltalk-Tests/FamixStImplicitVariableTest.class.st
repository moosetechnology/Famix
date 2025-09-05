Class {
	#name : 'FamixStImplicitVariableTest',
	#superclass : 'TestCase',
	#category : 'Famix-PharoSmalltalk-Tests',
	#package : 'Famix-PharoSmalltalk-Tests'
}

{ #category : 'tests' }
FamixStImplicitVariableTest >> testIsSelf [

	| variable |
	variable := FamixStImplicitVariable named: 'self'.

	self assert: variable isSelf.

	variable := FamixStImplicitVariable named: 'super'.

	self deny: variable isSelf.

	variable := FamixStImplicitVariable named: 'this'.

	self deny: variable isSelf
]

{ #category : 'tests' }
FamixStImplicitVariableTest >> testIsSuper [

	| variable |
	variable := FamixStImplicitVariable named: 'super'.

	self assert: variable isSuper.

	variable := FamixStImplicitVariable named: 'self'.

	self deny: variable isSuper
]
