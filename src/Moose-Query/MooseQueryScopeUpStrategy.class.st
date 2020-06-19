Class {
	#name : #MooseQueryScopeUpStrategy,
	#superclass : #MooseQueryScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #accessing }
MooseQueryScopeUpStrategy class >> selectorsFor: anEntity [
	^ anEntity parentSelectors
]
