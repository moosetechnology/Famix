Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> detect: aBlock ifOne: anotherBlock [

	self deprecated: 'Use #detect:ifFound: instead.' transformWith: '`@rcv detect: `@arg1 ifOne: `@arg2' -> '`@rcv detect: `@arg1 ifFound: `@arg2'.
	^ self
		  detect: aBlock
		  ifFound: anotherBlock
]
