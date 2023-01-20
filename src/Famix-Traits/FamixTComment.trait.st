"
FamixTComment represents one instance of a comment (in the sense of programming language comments) for any Famix sourced entity. The commented sourced entity is called the container in the FamixT model.
"
Trait {
	#name : #FamixTComment,
	#instVars : [
		'#commentedEntity => FMOne type: #FamixTWithComments opposite: #comments',
		'#content => FMProperty'
	],
	#category : #'Famix-Traits-Comment'
}

{ #category : #meta }
FamixTComment classSide >> annotation [

	<FMClass: #TComment super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTComment classSide >> content: aString [
	^ self new
		content: aString;
		yourself
]

{ #category : #accessing }
FamixTComment >> commentedEntity [
	"Relation named: #commentedEntity type: #FamixTWithComments opposite: #comments"

	<generated>
	<FMComment: 'Source code commented by the comment'>
	^ commentedEntity
]

{ #category : #accessing }
FamixTComment >> commentedEntity: anObject [

	<generated>
	commentedEntity := anObject
]

{ #category : #accessing }
FamixTComment >> container [

	self
		deprecated: 'Use #commentedEntity instead'
		transformWith:
		'`@receiver container' -> '`@receiver commentedEntity'.

	^ self commentedEntity
]

{ #category : #accessing }
FamixTComment >> container: anObject [

	self
		deprecated: 'Use #commentedEntity: instead'
		transformWith:
		'`@receiver container: `@arg' -> '`@receiver commentedEntity: `@arg'.

	self commentedEntity: anObject
]

{ #category : #accessing }
FamixTComment >> content [

	<FMProperty: #content type: #String>
	<generated>
	<FMComment: 'Content of the comment as a String'>
	^ content
]

{ #category : #accessing }
FamixTComment >> content: anObject [
	<generated>
	content := anObject
]

{ #category : #printing }
FamixTComment >> displayStringOn: aStream [

	aStream << 'comment on '.
	self commentedEntity displayStringOn: aStream
]

{ #category : #printing }
FamixTComment >> printOn: aStream [

	self sourceText ifNotNil: [ :sourceText | 
		aStream nextPutAll: (sourceText contractTo: 50) ].
	aStream nextPutAll: ' (comment on '.
	self commentedEntity printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
FamixTComment >> sourceText [
	^ self content
		ifNil: [ self sourceAnchor
				ifNil: [ '' ]
				ifNotNil: #sourceText ]
]
