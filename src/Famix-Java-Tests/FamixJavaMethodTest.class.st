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
	| overriddenMethod c1 c2 package |
	package := FamixJavaPackage new.
	c1 := FamixJavaClass new
		parentPackage: package;
		yourself.
	c2 := FamixJavaClass new
		parentPackage: package;
		yourself.
	overriddenMethod := FamixJavaMethod new
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
	self assert: overriddenMethod isOverridden
]

{ #category : #tests }
FamixJavaMethodTest >> testOverriddenMethod [

	| signature overriddenMethod localClass superclass |
	signature := 'javaMethod()'.
	method signature: signature.
	overriddenMethod := FamixJavaMethod new signature: signature.

	localClass := FamixJavaClass named: #LocalClass.
	superclass := FamixJavaClass named: #Superclass.

	localClass addMethod: method.
	superclass addMethod: overriddenMethod.

	FamixJavaInheritance new
		superclass: superclass;
		subclass: localClass.

	self assert: method overriddenMethod equals: overriddenMethod
]

{ #category : #tests }
FamixJavaMethodTest >> testOverriddenMethodFromInterface [

	| signature interfaceOverriddenMethod localClass interface |
	signature := 'javaMethod()'.
	method signature: signature.
	interfaceOverriddenMethod := FamixJavaMethod new signature: signature.

	localClass := FamixJavaClass named: #LocalClass.
	interface := FamixJavaInterface named: #Interface.

	localClass addMethod: method.
	interface addMethod: interfaceOverriddenMethod.

	FamixJavaImplementation new
		interface: interface;
		implementingClass: localClass.

	self assert: method overriddenMethod equals: interfaceOverriddenMethod
]

{ #category : #tests }
FamixJavaMethodTest >> testOverriddenMethodOnlyOneLevel [

	| signature overriddenMethod localClass superclass superSuperclass otherOverriddenMethod |
	signature := 'javaMethod()'.
	method signature: signature.
	overriddenMethod := FamixJavaMethod new signature: signature.
	otherOverriddenMethod := FamixJavaMethod new signature: signature.

	localClass := FamixJavaClass named: #LocalClass.
	superclass := FamixJavaClass named: #Superclass.
	superSuperclass := FamixJavaClass named: #SuperSuperclass.

	localClass addMethod: method.
	superclass addMethod: overriddenMethod.
	superSuperclass addMethod: otherOverriddenMethod.

	FamixJavaInheritance new
		superclass: superclass;
		subclass: localClass.
	FamixJavaInheritance new
		superclass: superSuperclass;
		subclass: superclass.

	self assert: method overriddenMethod equals: overriddenMethod
]

{ #category : #tests }
FamixJavaMethodTest >> testOverridingMethods [

	| signature overridingMethod c1 c2 |
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.

	c1 := FamixJavaClass new.
	c2 := FamixJavaClass new.

	c1 addMethod: method.
	c2 addMethod: overridingMethod.

	FamixJavaInheritance new
		superclass: c1;
		subclass: c2.

	self
		assertCollection: method overridingMethods
		hasSameElements: { overridingMethod }
]

{ #category : #tests }
FamixJavaMethodTest >> testOverridingMethodsOnlyOneLevel [

	| signature overridingMethod otherOverridingMethod localClass subclass subSubclass |
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.
	otherOverridingMethod := FamixJavaMethod new signature: signature.

	localClass := FamixJavaClass new.
	subclass := FamixJavaClass new.
	subSubclass := FamixJavaClass new.

	localClass addMethod: method.
	subclass addMethod: overridingMethod.
	subSubclass addMethod: otherOverridingMethod.

	FamixJavaInheritance new
		superclass: localClass;
		subclass: subclass.
	FamixJavaInheritance new
		superclass: subclass;
		subclass: subSubclass.

	self
		assertCollection: method overridingMethods
		hasSameElements: { overridingMethod }
]

{ #category : #tests }
FamixJavaMethodTest >> testSettingIsStub [
	method isStub: true.
	self assert: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testSeveralOverridingMethods [

	| signature overridingMethod otherOverridingMethod localClass subclass otherSubclass |
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.
	otherOverridingMethod := FamixJavaMethod new signature: signature.

	localClass := FamixJavaClass new.
	subclass := FamixJavaClass new.
	otherSubclass := FamixJavaClass new.

	localClass addMethod: method.
	subclass addMethod: overridingMethod.
	otherSubclass addMethod: otherOverridingMethod.

	FamixJavaInheritance new
		superclass: localClass;
		subclass: subclass.
	FamixJavaInheritance new
		superclass: localClass;
		subclass: otherSubclass.

	self assertCollection: method overridingMethods hasSameElements: {
			overridingMethod.
			otherOverridingMethod }
]
