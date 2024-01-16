"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixTest7UnknownSourceLanguage,
	#superclass : #FamixTest7SourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7UnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixTest7SourceLanguage>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]
