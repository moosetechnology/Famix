"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typedEntity` | `FamixTTypeDeclaration` | `typeDeclaration` | `FamixTTypedEntity` | Entity deckaring the type.|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FamixTTypeDeclaration` | `incomingDeclarations` | `FamixTType` | Type of the entity.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTTypeDeclaration,
	#instVars : [
		'#declaredType => FMOne type: #FamixTType opposite: #incomingDeclarations',
		'#typedEntity => FMOne type: #FamixTTypedEntity opposite: #typeDeclaration'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTTypeDeclaration classSide >> annotation [

	<FMClass: #TTypeDeclaration super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTTypeDeclaration >> declaredType [
	"Relation named: #declaredType type: #FamixTType opposite: #incomingDeclarations"

	<generated>
	<FMComment: 'Type of the entity.'>
	<target>
	^ declaredType
]

{ #category : #accessing }
FamixTTypeDeclaration >> declaredType: anObject [

	<generated>
	declaredType := anObject
]

{ #category : #accessing }
FamixTTypeDeclaration >> typedEntity [
	"Relation named: #typedEntity type: #FamixTTypedEntity opposite: #typeDeclaration"

	<generated>
	<FMComment: 'Entity deckaring the type.'>
	<derived>
	<source>
	^ typedEntity
]

{ #category : #accessing }
FamixTTypeDeclaration >> typedEntity: anObject [

	<generated>
	typedEntity := anObject
]
