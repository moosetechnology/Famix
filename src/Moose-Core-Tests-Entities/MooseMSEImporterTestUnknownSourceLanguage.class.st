"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #MooseMSEImporterTestUnknownSourceLanguage,
	#superclass : #MooseMSEImporterTestSourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestUnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #MooseMSEImporterTestSourceLanguage>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
