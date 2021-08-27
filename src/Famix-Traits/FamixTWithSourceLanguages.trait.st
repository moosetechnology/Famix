Trait {
	#name : #FamixTWithSourceLanguages,
	#instVars : [
		'#declaredSourceLanguage => FMOne type: #FamixTSourceLanguage opposite: #sourcedEntities'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithSourceLanguages classSide >> annotation [

	<FMClass: #TWithSourceLanguages super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
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
