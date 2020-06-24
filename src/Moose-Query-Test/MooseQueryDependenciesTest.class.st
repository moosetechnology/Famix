Class {
	#name : #MooseQueryDependenciesTest,
	#superclass : #MooseQueryTest,
	#category : #'Moose-Query-Test'
}

{ #category : #tests }
MooseQueryDependenciesTest >> testQueryIncomingDependenciesOnProperty [
	self assert: class1 queryAllIncoming size equals: 2.
	self assert: (class1 queryAllIncoming opposites includes: var1).
	self assert: (class1 queryAllIncoming opposites includes: localVariable)
]

{ #category : #tests }
MooseQueryDependenciesTest >> testQueryOutgoingDependenciesOnAssociations [
	self assert: method1 queryAllOutgoing size equals: 3.
	self assert: (method1 queryAllOutgoing opposites includes: class2).
	self assert: (method1 queryAllOutgoing opposites includes: method2).
	self assert: (method1 queryAllOutgoing opposites includes: var2)
]

{ #category : #tests }
MooseQueryDependenciesTest >> testQueryOutgoingDependenciesOnProperty [
	self assert: var1 queryAllOutgoing size equals: 1.
	self assert: var1 queryAllOutgoing opposites anyOne equals: class1
]
