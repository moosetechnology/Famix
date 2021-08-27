Class {
	#name : #MooseObjectQueryResultTest,
	#superclass : #MooseQueryResultTest,
	#category : #'Moose-Query-Test'
}

{ #category : #asserting }
MooseObjectQueryResultTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
MooseObjectQueryResultTest >> actualClass [
	^ MooseObjectQueryResult
]

{ #category : #tests }
MooseObjectQueryResultTest >> testWithoutSelfLoops [
| model package1 package2 class1 class2 |
	model := FamixJavaModel new.
	package1 := (FamixJavaPackage named: 'package1')
		mooseModel: model;
		yourself.
	package2 := (FamixJavaPackage named: 'package2')
		mooseModel: model;
		parentPackage: package1;
		yourself.
	class1 := (FamixJavaClass named: 'class1')
		mooseModel: model;
		typeContainer: package2;
		yourself.
	class2 := (FamixJavaClass named: 'class2')
		mooseModel: model;
		typeContainer: package2;
		yourself.
	FamixJavaInheritance new
		mooseModel: model;
		superclass: class1;
		subclass: class2.
	self assert: ((package1 queryOutgoing: FamixJavaInheritance) atScope: FamixTClass) size equals: 1.
	self assertEmpty: ((package1 queryOutgoing: FamixJavaInheritance) atScope: FamixTClass) withoutSelfLoops
]
