"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : 'FamixStSourceLanguage',
	#superclass : 'FamixStEntity',
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : 'Famix-PharoSmalltalk-Entities-Entities',
	#package : 'Famix-PharoSmalltalk-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixStSourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : 'testing' }
FamixStSourceLanguage >> isPharo [
	^ true
]

{ #category : 'testing' }
FamixStSourceLanguage >> isSmalltalk [
	^ true
]

{ #category : 'accessing' }
FamixStSourceLanguage >> name [
	<FMProperty: #name type: #String>
	<derived>
	<FMComment: 'The name of the language'>
	^ 'Pharo'
]
