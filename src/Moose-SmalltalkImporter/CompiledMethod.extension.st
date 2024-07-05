Extension { #name : #CompiledMethod }

{ #category : #'*Moose-SmalltalkImporter' }
CompiledMethod >> mooseName [

	^ String streamContents: [ :str |
		  str
			  nextPutAll: self methodClass mooseName;
			  nextPut: $.;
			  nextPutAll: self selector.
		  self signatureFromSmalltalkSelectorOn: str ]
]

{ #category : #'*Moose-SmalltalkImporter' }
CompiledMethod >> signature [

	^ (String streamContents: [ :aStream |
		   aStream nextPutAll: self selector.
		   self signatureFromSmalltalkSelectorOn: aStream ]) asSymbol
]

{ #category : #'*Moose-SmalltalkImporter' }
CompiledMethod >> signatureFromSmalltalkSelectorOn: aStream [

	| sym numArgs |
	sym := self selector.
	numArgs := sym numArgs.
	aStream nextPut: $(.
	1 to: numArgs do: [ :inx | aStream nextPutAll: 'Object,' ].
	numArgs > 0 ifTrue: [ aStream skip: -1 "remove last space" ].
	aStream nextPut: $)
]
