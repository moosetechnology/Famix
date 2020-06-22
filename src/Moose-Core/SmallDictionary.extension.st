Extension { #name : #SmallDictionary }

{ #category : #'*Moose-Core' }
SmallDictionary >> directAt: key [
	"I exist only for performance reasons. I avoid to create a #ifAbsent: block. In moose query we call this so much that the creation cost of the block and its garbage collection is too high :("

	| index |
	index := self findIndexForKey: key.
	index = 0 ifTrue: [ ^ self error ].

	^ values at: index
]
