Extension { #name : #FamixTWithStatements }

{ #category : #'*Cpp-Parser' }
FamixTWithStatements >> blocks [
	| result |
	result := self propertyNamed: #blocks ifAbsentPut: [ self computesBlocks ].
	^ result isPetitFailure
		ifFalse: [ result ]
		ifTrue: [ {} ]
]

{ #category : #'*Cpp-Parser' }
FamixTWithStatements >> computesBlocks [
	| res |
	self hasSourceAnchor ifFalse: [ ^ {} ].
	
	res := OrderedCollection new.
	self sourceAnchor allSourceAnchors
		select: [ :e | (e fileReference extension includes: $c) and: [ e sourceText isNotEmpty ] ]
		thenDo: [ :sa | 
			res
				addAll:
					(CppConditionalsParser new
						method: self;
						sourceAnchor: sa;
						parse) ].
	^ res
]
