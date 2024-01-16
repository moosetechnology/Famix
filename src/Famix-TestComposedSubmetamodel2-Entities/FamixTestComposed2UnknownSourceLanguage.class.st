"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixTestComposed2UnknownSourceLanguage,
	#superclass : #FamixTestComposed2SourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2UnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixTestComposed2SourceLanguage>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^ self
]
