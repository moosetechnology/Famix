"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `sourcedEntities` | `FamixTWithSourceLanguages` | `declaredSourceLanguage` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixStUnknownSourceLanguage,
	#superclass : #FamixStSourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStUnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixStSourceLanguage>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixStUnknownSourceLanguage >> isSmalltalk [
	^ false
]
