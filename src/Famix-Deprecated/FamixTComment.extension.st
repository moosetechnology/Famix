Extension { #name : #FamixTComment }

{ #category : #'*Famix-Deprecated' }
FamixTComment >> content [

	<FMProperty: #content type: #String>
	<FMComment: 'Content of the comment as a String'>
	self deprecated: 'You should use #sourceText instead of #content to go through the source anchor.'.
	^ self sourceText
]

{ #category : #'*Famix-Deprecated' }
FamixTComment classSide >> content: aString [

	self deprecated: 'You should create a comment and set the source using a source anchor.'.
	^ self new
		  content: aString;
		  yourself
]

{ #category : #'*Famix-Deprecated' }
FamixTComment >> content: anObject [

	self deprecated: 'You should set a source anchor instead of setting the comment directly.'.
	self sourceAnchor: (self mooseModel newSourceTextAnchor
			 source: anObject;
			 yourself)
]
