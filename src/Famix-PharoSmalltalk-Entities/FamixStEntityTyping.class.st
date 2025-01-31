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
Class {
	#name : #FamixStEntityTyping,
	#superclass : #FamixStEntity,
	#traits : 'FamixTEntityTyping',
	#classTraits : 'FamixTEntityTyping classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStEntityTyping class >> annotation [

	<FMClass: #EntityTyping super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]
