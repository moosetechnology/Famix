"
FamixTComment represents one instance of a comment (in the sense of programming language comments) for any Famix sourced entity. The commented sourced entity is called the container in the FamixT model.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTComment,
	#instVars : [
		'#commentedEntity => FMOne type: #FamixTWithComments opposite: #comments'
	],
	#traits : 'FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Comment'
}

{ #category : #meta }
FamixTComment classSide >> annotation [

	<FMClass: #TComment super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTComment >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTComment: self
]

{ #category : #accessing }
FamixTComment >> commentedEntity [
	"Relation named: #commentedEntity type: #FamixTWithComments opposite: #comments"

	<generated>
	<FMComment: 'Source code commented by the comment'>
	<container>
	^ commentedEntity
]

{ #category : #accessing }
FamixTComment >> commentedEntity: anObject [

	<generated>
	commentedEntity := anObject
]

{ #category : #navigation }
FamixTComment >> commentedEntityGroup [
	<generated>
	<navigation: 'CommentedEntity'>
	^ MooseSpecializedGroup with: self commentedEntity
]

{ #category : #accessing }
FamixTComment >> container [

	"Marked as deprecated in January, 2023"

	self
		deprecated: 'Use #commentedEntity instead'
		transformWith:
		'`@receiver container' -> '`@receiver commentedEntity'.

	^ self commentedEntity
]

{ #category : #accessing }
FamixTComment >> container: anObject [

	"Marked as deprecated in January, 2023"

	self
		deprecated: 'Use #commentedEntity: instead'
		transformWith:
		'`@receiver container: `@arg' -> '`@receiver commentedEntity: `@arg'.

	self commentedEntity: anObject
]

{ #category : #printing }
FamixTComment >> displayStringOn: aStream [

	aStream << 'comment on '.
	self commentedEntity displayStringOn: aStream
]

{ #category : #testing }
FamixTComment >> isComment [

	<generated>
	^ true
]

{ #category : #printing }
FamixTComment >> printOn: aStream [

	self sourceText ifNotNil: [ :sourceText | 
		aStream nextPutAll: (sourceText contractTo: 50) ].
	aStream nextPutAll: ' (comment on '.
	self commentedEntity printOn: aStream.
	aStream nextPut: $)
]
