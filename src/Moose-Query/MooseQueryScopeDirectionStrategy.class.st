Class {
	#name : #MooseQueryScopeDirectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #query }
MooseQueryScopeDirectionStrategy class >> scopeFor: anEntity query: aQuery [
	^ self subclassResponsibility
]
