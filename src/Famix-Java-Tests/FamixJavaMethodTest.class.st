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
FamixJavaMethodTest >> testAllOverridingMethods [

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
		hasSameElements: {
				overridingMethod.
				otherOverridingMethod }
]

{ #category : #tests }
FamixJavaMethodTest >> testAllOverridingMethodsInInterface [

	| signature overridingMethod otherOverridingMethod i subclass subSubclass |
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.
	otherOverridingMethod := FamixJavaMethod new signature: signature.

	i := FamixJavaInterface new.
	subclass := FamixJavaClass new.
	subSubclass := FamixJavaClass new.

	i addMethod: method.
	subclass addMethod: overridingMethod.
	subSubclass addMethod: otherOverridingMethod.

	FamixJavaImplementation new
		interface: i;
		implementingClass: subclass.
	FamixJavaInheritance new
		superclass: subclass;
		subclass: subSubclass.

	self assertCollection: method overridingMethods hasSameElements: {
			overridingMethod.
			otherOverridingMethod }
]

{ #category : #tests }
FamixJavaMethodTest >> testAllOverridingMethodsInInterfaceWithExtendingInterface [

	| signature overridingMethod otherOverridingMethod i subclass subSubclass i2 |
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.
	otherOverridingMethod := FamixJavaMethod new signature: signature.

	i := FamixJavaInterface new
		     name: 'i';
		     yourself.
	i2 := FamixJavaInterface new
		      name: 'i2';
		      yourself.

	subclass := FamixJavaClass new.
	subSubclass := FamixJavaClass new.

	i addMethod: method.
	subclass addMethod: overridingMethod.
	subSubclass addMethod: otherOverridingMethod.

	FamixJavaInheritance new
		superclass: i;
		subclass: i2.
	FamixJavaImplementation new
		interface: i2;
		implementingClass: subclass.

	FamixJavaInheritance new
		superclass: subclass;
		subclass: subSubclass.

	self assertCollection: method overridingMethods hasSameElements: {
			overridingMethod.
			otherOverridingMethod }
]

{ #category : #tests }
FamixJavaMethodTest >> testDefaultIsStub [
	self deny: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testFirstOverridingMethods [

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
		assertCollection: method firstOverridingMethods
		hasSameElements: { overridingMethod }
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
	method typing: (FamixJavaEntityTyping new declaredType:
			 (FamixJavaClass named: 'String')).
	self assert: method isGetter.

	method name: 'getLogin'.
	method typing: (FamixJavaEntityTyping new declaredType:
			 (FamixJavaPrimitiveType named: 'void')).
	self deny: method isGetter
]

{ #category : #tests }
FamixJavaMethodTest >> testIsGetterForBooleanAttribute [

	method name: 'isActif'.
	method typing: (FamixJavaEntityTyping new declaredType:
			 (FamixJavaPrimitiveType named: 'boolean')).
	self assert: method isGetter.

	method name: 'isActif'.
	method typing: (FamixJavaEntityTyping new declaredType:
			 (FamixJavaClass named: 'Boolean')).
	self assert: method isGetter.

	method name: 'isActif'.
	method typing: (FamixJavaEntityTyping new declaredType:
			 (FamixJavaClass named: 'String')).
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

	method typing: (FamixJavaEntityTyping new declaredType:
			 (FamixJavaPrimitiveType named: 'void')).
	self assert: method isSetter
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
		typing: (FamixJavaEntityTyping new declaredType: c1);
		yourself.
	method
		name: 'method';
		signature: 'method()';
		parentType: c2;
		typing: (FamixJavaEntityTyping new declaredType: c2).
	c2
		addSuperInheritance:
			(FamixJavaInheritance new
				subclass: c2;
				superclass: c1).
	self assert: method isOverriding.
	self assert: overriddenMethod isOverridden
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
FamixJavaMethodTest >> testOverridingMethodsInInterface [

	| signature overridingMethod i c |
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.

	i := FamixJavaInterface new.
	c := FamixJavaClass new.

	i addMethod: method.
	c addMethod: overridingMethod.

	FamixJavaImplementation new
		interface: i;
		implementingClass: c.

	self
		assertCollection: method overridingMethods
		hasSameElements: { overridingMethod }
]

{ #category : #tests }
FamixJavaMethodTest >> testOverridingMethodsInterfaceExtendsInterface [

	| signature overridingMethod i i2 overridingMethod2 i3 |
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.
	overridingMethod2 := FamixJavaMethod new signature: signature.

	i := FamixJavaInterface new.
	i2 := FamixJavaInterface new.
	i3 := FamixJavaInterface new.
	i addMethod: method.
	i2 addMethod: overridingMethod.
	i3 addMethod: overridingMethod2.

	FamixJavaInheritance new
		superclass: i;
		subclass: i2.
	
	FamixJavaInheritance new
		superclass: i2;
		subclass: i3.
	
	self assertCollection: method overridingMethods hasSameElements: {
			overridingMethod.
			overridingMethod2 }
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
