"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixJavaUnknownSourceLanguage,
	#superclass : #FamixJavaSourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixJavaSourceLanguage>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaUnknownSourceLanguage >> name [
	
	<FMProperty: #name type: #String> 
	<derived>
	<FMComment: 'The name of the language'>
	
	^ 'Unknown'
]
