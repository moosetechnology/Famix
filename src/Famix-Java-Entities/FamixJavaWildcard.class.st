"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lowerBound` | `FamixJavaTBounded` | `lowerBoundedWildcards` | `FamixJavaTBound` | Lower bound on wildcard, specified by super keyword.|
| `upperBound` | `FamixJavaTBounded` | `upperBoundedWildcards` | `FamixJavaTBound` | Upper bound on wildcard, specified by extends keyword.|



"
Class {
	#name : #FamixJavaWildcard,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTBounded',
	#classTraits : 'FamixJavaTBounded classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaWildcard class >> annotation [

	<FMClass: #Wildcard super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
