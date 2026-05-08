"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `containerFiles` | `FamixTWithFiles` | `entities` | `FamixTFile` | List of files containing the entity|
| `declaredSourceLanguage` | `FamixTWithSourceLanguages` | `sourcedEntities` | `FamixTSourceLanguage` | The declared SourceLanguage for the source code of this entity|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixTest1SourcedEntity',
	#superclass : 'FamixTest1Entity',
	#traits : 'FamixTSourceEntity + FamixTWithFiles + FamixTWithSourceLanguages',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithFiles classTrait + FamixTWithSourceLanguages classTrait',
	#category : 'Famix-Test1-Entities-Entities',
	#package : 'Famix-Test1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest1SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest1SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest1SourcedEntity
]
