"
Description
--------------------

I am a strategy used by the scoping queries to define on which kind of entity the query should stop. 

I am moslty here for performance reasons.
"
Class {
	#name : #MooseQueryScopeAbstractTypeStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #testing }
MooseQueryScopeAbstractTypeStrategy >> isOfRightType: anEntity [
	^ self subclassResponsibility
]
