Extension { #name : #FamixTComment }

{ #category : #'*Famix-CommentAnalyzer' }
FamixTComment classSide >> fromLines: aCollectionOfLines [
	^ self new content: (String cr join: aCollectionOfLines)
]

{ #category : #'*Famix-CommentAnalyzer' }
FamixTComment >> isCode [
	<FMProperty: #isCode type: #Boolean>
	<FMComment: 'Flag true for comments that are considered as commented code.'>
	^ self attributeAt: #isCode ifAbsentPut: [ false ]
]

{ #category : #'*Famix-CommentAnalyzer' }
FamixTComment >> isCode: aBoolean [
	self attributeAt: #isCode put: aBoolean
]

{ #category : #'*Famix-CommentAnalyzer' }
FamixTComment >> lines [
	^ self sourceText lines
]
