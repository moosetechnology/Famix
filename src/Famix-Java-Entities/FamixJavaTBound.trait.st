"
Represents a bound for a lower bounded and upper bounded wildcard.
"
Trait {
	#name : #FamixJavaTBound,
	#instVars : [
		'#lowerBoundedWildcards => FMMany type: #FamixJavaTBounded opposite: #lowerBound',
		'#upperBoundedWildcards => FMMany type: #FamixJavaTBounded opposite: #upperBound'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTBound classSide >> annotation [

	<FMClass: #TBound super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixJavaTBound >> addLowerBoundedWildcard: anObject [
	<generated>
	^ self lowerBoundedWildcards add: anObject
]

{ #category : #adding }
FamixJavaTBound >> addUpperBoundedWildcard: anObject [
	<generated>
	^ self upperBoundedWildcards add: anObject
]

{ #category : #accessing }
FamixJavaTBound >> lowerBoundedWildcards [
	"Relation named: #lowerBoundedWildcards type: #FamixJavaTBounded opposite: #lowerBound"

	<generated>
	<FMComment: 'Wildcards lower bounded by this bound.'>
	<derived>
	^ lowerBoundedWildcards
]

{ #category : #accessing }
FamixJavaTBound >> lowerBoundedWildcards: anObject [

	<generated>
	lowerBoundedWildcards value: anObject
]

{ #category : #accessing }
FamixJavaTBound >> upperBoundedWildcards [
	"Relation named: #upperBoundedWildcards type: #FamixJavaTBounded opposite: #upperBound"

	<generated>
	<FMComment: 'Wildcards upper bounded by this bound.'>
	<derived>
	^ upperBoundedWildcards
]

{ #category : #accessing }
FamixJavaTBound >> upperBoundedWildcards: anObject [

	<generated>
	upperBoundedWildcards value: anObject
]
