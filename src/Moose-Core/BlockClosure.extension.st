Extension { #name : #BlockClosure }

{ #category : #'*moose-core' }
BlockClosure >> asSortBlock [

	^ [:a :b | (self value: a) <= (self value: b)]
]
