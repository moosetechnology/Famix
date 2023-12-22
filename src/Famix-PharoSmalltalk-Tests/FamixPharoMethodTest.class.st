Class {
	#name : #FamixPharoMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'method',
		'signature'
	],
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #running }
FamixPharoMethodTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	method := FamixStMethod new.
	signature := 'pharoMethod'.
	method signature: signature.
]

{ #category : #tests }
FamixPharoMethodTest >> testIsClassSide [
	| method |
	method := FamixStMethod new.
	method isClassSide: true.
	self assert: method isClassSide .
]

{ #category : #tests }
FamixPharoMethodTest >> testOverriddenMethod [

	| overriddenMethod localClass superclass |
	
	overriddenMethod := FamixStMethod new signature: signature.

	localClass := FamixStClass named: #LocalClass.
	superclass := FamixStClass named: #Superclass.

	localClass addMethod: method.
	superclass addMethod: overriddenMethod.

	FamixStInheritance new
		superclass: superclass;
		subclass: localClass.

	self assert: method overriddenMethod equals: overriddenMethod
]

{ #category : #tests }
FamixPharoMethodTest >> testOverriddenMethodOnlyOneLevel [

	| overriddenMethod localClass superclass superSuperclass otherOverriddenMethod |

	overriddenMethod := FamixStMethod new signature: signature.
	otherOverriddenMethod := FamixStMethod new signature: signature.

	localClass := FamixStClass named: #LocalClass.
	superclass := FamixStClass named: #Superclass.
	superSuperclass := FamixStClass named: #SuperSuperclass.

	localClass addMethod: method.
	superclass addMethod: overriddenMethod.
	superSuperclass addMethod: otherOverriddenMethod.

	FamixStInheritance new
		superclass: superclass;
		subclass: localClass.
	FamixStInheritance new
		superclass: superSuperclass;
		subclass: superclass.

	self assert: method overriddenMethod equals: overriddenMethod
]

{ #category : #tests }
FamixPharoMethodTest >> testOverridingMethods [

	| signature overridingMethod c1 c2 |
	signature := 'pharoMethod'.
	method signature: signature.
	overridingMethod := FamixStMethod new signature: signature.

	c1 := FamixStClass new.
	c2 := FamixStClass new.

	c1 addMethod: method.
	c2 addMethod: overridingMethod.

	FamixStInheritance new
		superclass: c1;
		subclass: c2.

	self
		assertCollection: method overridingMethods
		hasSameElements: { overridingMethod }
]

{ #category : #tests }
FamixPharoMethodTest >> testOverridingMethodsOnlyOneLevel [

	| overridingMethod otherOverridingMethod localClass subclass subSubclass |

	overridingMethod := FamixStMethod new signature: signature.
	otherOverridingMethod := FamixStMethod new signature: signature.

	localClass := FamixStClass new.
	subclass := FamixStClass new.
	subSubclass := FamixStClass new.

	localClass addMethod: method.
	subclass addMethod: overridingMethod.
	subSubclass addMethod: otherOverridingMethod.

	FamixStInheritance new
		superclass: localClass;
		subclass: subclass.
	FamixStInheritance new
		superclass: subclass;
		subclass: subSubclass.

	self
		assertCollection: method overridingMethods
		hasSameElements: { overridingMethod }
]

{ #category : #tests }
FamixPharoMethodTest >> testSeveralOverridingMethods [

	| signature overridingMethod otherOverridingMethod localClass subclass otherSubclass |
	signature := 'pharoMethod'.
	method signature: signature.
	overridingMethod := FamixStMethod new signature: signature.
	otherOverridingMethod := FamixStMethod new signature: signature.

	localClass := FamixStClass new.
	subclass := FamixStClass new.
	otherSubclass := FamixStClass new.

	localClass addMethod: method.
	subclass addMethod: overridingMethod.
	otherSubclass addMethod: otherOverridingMethod.

	FamixStInheritance new
		superclass: localClass;
		subclass: subclass.
	FamixStInheritance new
		superclass: localClass;
		subclass: otherSubclass.

	self assertCollection: method overridingMethods hasSameElements: {
			overridingMethod.
			otherOverridingMethod }
]
