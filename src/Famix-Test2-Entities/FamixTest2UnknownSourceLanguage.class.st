"
## Relations
======================

### Other
- Relation: #sourcedEntities Type: #FamixTWithSourceLanguages Opposite: #declaredSourceLanguage Comment: References to the entities saying explicitly that are written in this language.


"
Class {
	#name : #FamixTest2UnknownSourceLanguage,
	#superclass : #FamixTest2SourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2UnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixTest2SourceLanguage>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^ self
]
