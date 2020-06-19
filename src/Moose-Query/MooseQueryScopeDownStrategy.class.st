Class {
	#name : #MooseQueryScopeDownStrategy,
	#superclass : #MooseQueryScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MooseQueryScopeDownStrategy class >> selectorsFor: anEntity [
	^ anEntity childrenSelectors
]
