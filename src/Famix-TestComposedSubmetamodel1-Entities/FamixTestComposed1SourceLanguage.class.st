"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : 'FamixTestComposed1SourceLanguage',
	#superclass : 'FamixTestComposed1Entity',
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : 'Famix-TestComposedSubmetamodel1-Entities-Entities',
	#package : 'Famix-TestComposedSubmetamodel1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposed1SourceLanguage class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceLanguage super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
]
