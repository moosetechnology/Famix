Class {
	#name : 'FamixJavaImplicitVariableTest',
	#superclass : 'TestCase',
	#category : 'Famix-Java-Tests',
	#package : 'Famix-Java-Tests'
}

{ #category : 'tests' }
FamixJavaImplicitVariableTest >> testIsSelf [

	| variable |
	variable := FamixJavaImplicitVariable named: 'this'.

	self assert: variable isSelf.

	variable := FamixJavaImplicitVariable named: 'super'.

	self deny: variable isSelf.

	variable := FamixJavaImplicitVariable named: 'self'.

	self deny: variable isSelf
]

{ #category : 'tests' }
FamixJavaImplicitVariableTest >> testIsSuper [

	| variable |
	variable := FamixJavaImplicitVariable named: 'super'.

	self assert: variable isSuper.

	variable := FamixJavaImplicitVariable named: 'this'.

	self deny: variable isSuper
]
