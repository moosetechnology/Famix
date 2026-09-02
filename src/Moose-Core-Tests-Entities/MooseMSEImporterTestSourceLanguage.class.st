"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : 'MooseMSEImporterTestSourceLanguage',
	#superclass : 'MooseMSEImporterTestEntity',
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : 'Moose-Core-Tests-Entities-Entities',
	#package : 'Moose-Core-Tests-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
MooseMSEImporterTestSourceLanguage class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceLanguage super: #MooseMSEImporterTestEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
]
