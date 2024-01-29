"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixTest6SourceLanguage,
	#superclass : #FamixTest6Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6SourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]
