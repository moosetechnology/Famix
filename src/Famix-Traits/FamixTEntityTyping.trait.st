"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typedEntity` | `FamixTEntityTyping` | `typing` | `FamixTTypedEntity` | Entity deckaring the type.|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FamixTEntityTyping` | `incomingTypings` | `FamixTType` | Type of the entity.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTEntityTyping,
	#instVars : [
		'#declaredType => FMOne type: #FamixTType opposite: #incomingTypings',
		'#typedEntity => FMOne type: #FamixTTypedEntity opposite: #typing'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTEntityTyping classSide >> annotation [

	<FMClass: #TEntityTyping super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTEntityTyping >> declaredType [
	"Relation named: #declaredType type: #FamixTType opposite: #incomingTypings"

	<generated>
	<FMComment: 'Type of the entity.'>
	<target>
	^ declaredType
]

{ #category : #accessing }
FamixTEntityTyping >> declaredType: anObject [

	<generated>
	declaredType := anObject
]

{ #category : #accessing }
FamixTEntityTyping >> typedEntity [
	"Relation named: #typedEntity type: #FamixTTypedEntity opposite: #typing"

	<generated>
	<FMComment: 'Entity deckaring the type.'>
	<derived>
	<source>
	^ typedEntity
]

{ #category : #accessing }
FamixTEntityTyping >> typedEntity: anObject [

	<generated>
	typedEntity := anObject
]
