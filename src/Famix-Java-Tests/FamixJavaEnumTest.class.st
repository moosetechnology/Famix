Class {
	#name : #FamixJavaEnumTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaEnumTest >> testOverridingMethods [

	| method signature overridingMethod c1 c2 |
	method := FamixJavaMethod new.
	signature := 'javaMethod()'.
	method signature: signature.
	overridingMethod := FamixJavaMethod new signature: signature.

	c1 := FamixJavaEnum new.
	c2 := FamixJavaEnum new.

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
FamixJavaEnumTest >> testValues [
	| enum value |
	enum := FamixJavaEnum new.
	value := FamixJavaEnumValue new.
	enum values: (OrderedCollection with: value).
	self assert: enum values size equals: 1.
	self assert: value parentEnum equals: enum
]
