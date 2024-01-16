"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixJavaSourceLanguage,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixJavaSourceLanguage >> isC [ 
	^ false
]

{ #category : #testing }
FamixJavaSourceLanguage >> isJava [
	^ true
]

{ #category : #accessing }
FamixJavaSourceLanguage >> name [
	
	<FMProperty: #name type: #String> 
	<derived>
	<FMComment: 'The name of the language'>
	
	^ 'Java'
]
