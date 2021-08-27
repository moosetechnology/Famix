Extension { #name : #Dictionary }

{ #category : #'*Moose-Core' }
Dictionary >> atOrOrederedCollection: key [
	"I exist only for performance reasons. I avoid to create a #ifAbsent: block. In moose we call this so much that the creation cost of the block and its garbage collection is too high :("

	^ ((array at: (self findElementOrNil: key))
		ifNil: [ self at: key put: OrderedCollection new ]
		ifNotNil: [ :assoc | assoc ]) value
]
