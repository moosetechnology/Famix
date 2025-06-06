"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredSourceLanguage` | `FamixTWithSourceLanguages` | `sourcedEntities` | `FamixTSourceLanguage` | The declared SourceLanguage for the source code of this entity|



"
Trait {
	#name : #FamixTWithSourceLanguages,
	#instVars : [
		'#declaredSourceLanguage => FMOne type: #FamixTSourceLanguage opposite: #sourcedEntities'
	],
	#category : #'Famix-Traits-SourceLanguage'
}

{ #category : #meta }
FamixTWithSourceLanguages classSide >> annotation [

	<FMClass: #TWithSourceLanguages super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithSourceLanguages >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithSourceLanguages: self
]

{ #category : #accessing }
FamixTWithSourceLanguages >> declaredSourceLanguage [
	"Relation named: #declaredSourceLanguage type: #FamixTSourceLanguage opposite: #sourcedEntities"

	<generated>
	<FMComment: 'The declared SourceLanguage for the source code of this entity'>
	^ declaredSourceLanguage
]

{ #category : #accessing }
FamixTWithSourceLanguages >> declaredSourceLanguage: anObject [

	<generated>
	declaredSourceLanguage := anObject
]

{ #category : #testing }
FamixTWithSourceLanguages >> isUnknown [
	^ true
]

{ #category : #accessing }
FamixTWithSourceLanguages >> sourceLanguage [
	^ self sourceLanguageOr: self unknowSourceLanguageClass
]

{ #category : #'as yet unclassified' }
FamixTWithSourceLanguages >> sourceLanguageOr: unknownSourceLanguageClass [
	^ self declaredSourceLanguage ifNil: [
		self mooseModel 
			ifNil: [ unknownSourceLanguageClass new ] 
			ifNotNil: #sourceLanguage ]
]

{ #category : #'as yet unclassified' }
FamixTWithSourceLanguages >> unknowSourceLanguageClass [
	^ (self mooseDescription package
		classNamed: 'UnknownSourceLanguage'
		ifAbsent: [ self error: 'This entity has no source language, no model and no class implementing #FamixTUnknownSourceLanguage in it metamodel.' ])
		implementingClass
]
