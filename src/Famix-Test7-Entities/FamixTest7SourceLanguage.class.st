"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixTest7SourceLanguage,
	#superclass : #FamixTest7Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7SourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixTest7Entity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]
