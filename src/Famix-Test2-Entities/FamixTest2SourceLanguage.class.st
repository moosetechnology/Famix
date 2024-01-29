"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixTest2SourceLanguage,
	#superclass : #FamixTest2Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2SourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixTest2Entity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^ self
]
