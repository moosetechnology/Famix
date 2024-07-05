"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|



"
Trait {
	#name : #FamixTWithComments,
	#instVars : [
		'#comments => FMMany type: #FamixTComment opposite: #commentedEntity'
	],
	#category : #'Famix-Traits-Comment'
}

{ #category : #meta }
FamixTWithComments classSide >> annotation [

	<FMClass: #TWithComments super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #removing }
FamixTWithComments >> addComment: aComment [
	self flag: #todo.	"Cyril: Remove next check after some time. This is for a transition. 10 august 2019."
	aComment isString ifTrue: [ self error: 'It is not possible to add a string as a comment anymore. Please create a comment entity to add.' ].
	self comments add: aComment
]

{ #category : #accessing }
FamixTWithComments >> comments [
	"Relation named: #comments type: #FamixTComment opposite: #commentedEntity"

	<generated>
	<FMComment: 'List of comments for the entity'>
	<derived>
	^ comments
]

{ #category : #accessing }
FamixTWithComments >> comments: anObject [

	<generated>
	comments value: anObject
]

{ #category : #testing }
FamixTWithComments >> hasComments [
	<FMProperty: #hasComments type: #Boolean>
	<derived>
	<FMComment: 'Define if the entity has at least one comment.'>
	^ self comments isNotEmpty
]

{ #category : #accessing }
FamixTWithComments >> numberOfComments [

	<FMProperty: #numberOfComments type: #Number>
	<derived>
	<FMComment: 'The number of comments in the entity. Does not count comments of children entities (for example, for a class, I will count the comments associated to the class and not the methods or arguments.'>
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size ]
]

{ #category : #accessing }
FamixTWithComments >> numberOfComments: aNumber [
	self cacheAt: #numberOfComments put: aNumber
]

{ #category : #removing }
FamixTWithComments >> removeComment: aComment [
	self comments remove: aComment
]
