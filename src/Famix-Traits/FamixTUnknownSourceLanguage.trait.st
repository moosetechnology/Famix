Trait {
	#name : #FamixTUnknownSourceLanguage,
	#traits : 'FamixTSourceLanguage',
	#category : #'Famix-Traits-SourceLanguage'
}

{ #category : #meta }
FamixTUnknownSourceLanguage classSide >> annotation [

	<FMClass: #TUnknownSourceLanguage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTUnknownSourceLanguage >> isUnknown [
	^ true
]
