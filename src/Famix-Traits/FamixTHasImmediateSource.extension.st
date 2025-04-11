Extension { #name : #FamixTHasImmediateSource }

{ #category : #'*FamixReplication' }
FamixTHasImmediateSource >> knowsEnd [
	^ self source isNotEmpty
]

{ #category : #'*FamixReplication' }
FamixTHasImmediateSource >> knowsStart [
	^ self source isNotEmpty
]
