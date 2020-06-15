Class {
	#name : #MooseQueryDependenciesTest,
	#superclass : #MooseQueryTest,
	#category : #'Moose-Query-Test'
}

{ #category : #tests }
MooseQueryDependenciesTest >> testQueryOutgoingDependenciesOnAssociations [
	self assert: method1 queryOutgoingDependencies size equals: 3.
	self assert: (method1 queryOutgoingDependencies opposites includes:  class2 ).
	self assert: (method1 queryOutgoingDependencies opposites includes:  method2 ).
	self assert: (method1 queryOutgoingDependencies opposites includes:  var2 ).

]

{ #category : #tests }
MooseQueryDependenciesTest >> testQueryOutgoingDependenciesOnProperty [
	
	self assert: var1 queryOutgoingDependencies size equals: 1.
	self assert: var1 queryOutgoingDependencies opposites anyOne equals:  class1 .

]
