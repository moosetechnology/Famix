"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `sourcedEntities` | `FamixTWithSourceLanguages` | `declaredSourceLanguage` | References to the entities saying explicitly that are written in this language.|



"
Trait {
	#name : #FamixTUnknownSourceLanguage,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Traits-SourceLanguage'
}

{ #category : #meta }
FamixTUnknownSourceLanguage classSide >> annotation [

	<FMClass: #TUnknownSourceLanguage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #testing }
FamixTUnknownSourceLanguage >> isUnknown [
	^ true
]
