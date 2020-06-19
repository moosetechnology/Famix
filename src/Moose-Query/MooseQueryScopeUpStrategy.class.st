Class {
	#name : #MooseQueryScopeUpStrategy,
	#superclass : #MooseQueryScopeDirectionStrategy,
	#category : #'Moose-Query-Scoping'
}

{ #category : #query }
MooseQueryScopeUpStrategy class >> scopeFor: anEntity query: aQuery [
	| selectors |
	(aQuery isOfRightType: anEntity)
		ifTrue: [ aQuery add: anEntity.
			aQuery isRecursive ifFalse: [ ^ aQuery result ] ].

	"The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
	(aQuery shouldStopOn: anEntity)
		ifFalse: [ 1 to: (selectors := anEntity parentSelectors) size do: [ :ind | (anEntity perform: (selectors at: ind)) scopeForQuery: aQuery direction: self ] ].
	^ aQuery result
]
