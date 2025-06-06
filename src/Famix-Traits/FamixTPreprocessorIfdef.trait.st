"
Represent a preprocessor #ifdef/#ifndef statement

Knows the name of the macro tested and whether it is ""negated"" (#ifndef) or not (#ifdef)


"
Trait {
	#name : #FamixTPreprocessorIfdef,
	#category : #'Famix-Traits-Preprocessor'
}

{ #category : #meta }
FamixTPreprocessorIfdef classSide >> annotation [

	<FMClass: #TPreprocessorIfdef super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTPreprocessorIfdef >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTPreprocessorIfdef: self
]
