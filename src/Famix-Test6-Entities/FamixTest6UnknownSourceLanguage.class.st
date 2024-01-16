"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `sourcedEntities` | `FamixTWithSourceLanguages` | `declaredSourceLanguage` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixTest6UnknownSourceLanguage,
	#superclass : #FamixTest6SourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6UnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixTest6SourceLanguage>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]
