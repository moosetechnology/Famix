Class {
	#name : #MooseQueryDependenciesTest,
	#superclass : #MooseQueryTest,
	#category : #'Moose-Query-Test'
}

{ #category : #tests }
MooseQueryDependenciesTest >> testQueryOutgoingDependenciesOnAssociations [
	self assert: method1 queryAllOutgoing size equals: 3.
	self assert: (method1 queryAllOutgoing opposites includes: class2).
	self assert: (method1 queryAllOutgoing opposites includes: method2).
	self assert: (method1 queryAllOutgoing opposites includes: var2)
]
