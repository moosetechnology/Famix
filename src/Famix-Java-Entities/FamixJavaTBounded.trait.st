"
Represents a bounded wildcard, lower bounded with keyword super or upper bounded with keyword extends.
"
Trait {
	#name : #FamixJavaTBounded,
	#instVars : [
		'#lowerBound => FMOne type: #FamixJavaTBound opposite: #lowerBoundedWildcards',
		'#upperBound => FMOne type: #FamixJavaTBound opposite: #upperBoundedWildcards'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTBounded classSide >> annotation [

	<FMClass: #TBounded super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaTBounded >> lowerBound [
	"Relation named: #lowerBound type: #FamixJavaTBound opposite: #lowerBoundedWildcards"

	<generated>
	<FMComment: 'Lower bound on wildcard, specified by super keyword.'>
	^ lowerBound
]

{ #category : #accessing }
FamixJavaTBounded >> lowerBound: anObject [

	<generated>
	lowerBound := anObject
]

{ #category : #accessing }
FamixJavaTBounded >> upperBound [
	"Relation named: #upperBound type: #FamixJavaTBound opposite: #upperBoundedWildcards"

	<generated>
	<FMComment: 'Upper bound on wildcard, specified by extends keyword.'>
	^ upperBound
]

{ #category : #accessing }
FamixJavaTBounded >> upperBound: anObject [

	<generated>
	upperBound := anObject
]
