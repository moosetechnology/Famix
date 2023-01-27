Class {
	#name : #FamixJavaMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'method'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaMethodTest >> setUp [
	super setUp.
	method := FamixJavaMethod new
]

{ #category : #tests }
FamixJavaMethodTest >> testDefaultIsStub [
	self deny: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testIsClassSide [
	
	method isClassSide: true.
	self assert: method isClassSide .
]

{ #category : #tests }
FamixJavaMethodTest >> testIsGetter [

	self deny: method isGetter.

	method name: 'getLogin'.
	method declaredType: (FamixJavaClass named: 'String').
	self assert: method isGetter.

	method name: 'getLogin'.
	method declaredType: (FamixJavaPrimitiveType named: 'void').
	self deny: method isGetter
]

{ #category : #tests }
FamixJavaMethodTest >> testIsGetterForBooleanAttribute [

	method name: 'isActif'.
	method declaredType: (FamixJavaPrimitiveType named: 'boolean').
	self assert: method isGetter.

	method name: 'isActif'.
	method declaredType: (FamixJavaClass named: 'Boolean').
	self assert: method isGetter.

	method name: 'isActif'.
	method declaredType: (FamixJavaClass named: 'String').
	self deny: method isGetter
]

{ #category : #tests }
FamixJavaMethodTest >> testIsNotStubWhenParentIsNotStub [
	| aClass |
	aClass := FamixJavaClass new.
	method parentType: aClass.
	aClass isStub: false.
	self deny: aClass isStub.
	self deny: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testIsSetter [

	self deny: method isSetter.

	method name: 'setLogin'.
	self deny: method isSetter.

	method parameters: { FamixJavaParameter new }.
	self deny: method isSetter.

	method declaredType: (FamixJavaPrimitiveType named: 'void').
	self assert: method isSetter
]

{ #category : #tests }
FamixJavaMethodTest >> testIsStubWhenParentIsStub [
	| aClass |
	aClass := FamixJavaClass new.
	method parentType: aClass.
	aClass isStub: true.
	self assert: aClass isStub.
	self assert: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testOverride [
	| overridenMethod c1 c2 package |
	package := FamixJavaPackage new.
	c1 := FamixJavaClass new
		parentPackage: package;
		yourself.
	c2 := FamixJavaClass new
		parentPackage: package;
		yourself.
	overridenMethod := FamixJavaMethod new
		name: 'method';
		signature: 'method()';
		parentType: c1;
		declaredType: c1;
		yourself.
	method
		name: 'method';
		signature: 'method()';
		parentType: c2;
		declaredType: c2.
	c2
		addSuperInheritance:
			(FamixJavaInheritance new
				subclass: c2;
				superclass: c1).
	self assert: method isOverriding.
	self assert: overridenMethod isOverriden
]

{ #category : #tests }
FamixJavaMethodTest >> testSettingIsStub [
	method isStub: true.
	self assert: method isStub
]
