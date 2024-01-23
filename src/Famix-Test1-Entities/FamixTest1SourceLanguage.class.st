"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixTest1SourceLanguage,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
