Class {
	#name : #MooseQueryScopeDirectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #query }
MooseQueryScopeDirectionStrategy class >> scopeFor: anEntity query: aQuery [
	^ aQuery scopeFor: anEntity direction: self
]

{ #category : #accessing }
MooseQueryScopeDirectionStrategy class >> selectorsFor: anEntity [
	^ self subclassResponsibility
]
