"
## Relations
======================

### Other
- Relation: #sourcedEntities Type: #FamixTWithSourceLanguages Opposite: #declaredSourceLanguage Comment: References to the entities saying explicitly that are written in this language.


"
Class {
	#name : #FamixTest3SourceLanguage,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3SourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
