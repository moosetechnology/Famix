"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTTypeArgument` | `typeArgument` | `FamixTConcretization` | Concretizations where this type is the type argument.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lowerBound` | `FamixJavaTBounded` | `lowerBoundedWildcards` | `FamixJavaTBound` | Lower bound on wildcard, specified by super keyword.|
| `upperBound` | `FamixJavaTBounded` | `upperBoundedWildcards` | `FamixJavaTBound` | Upper bound on wildcard, specified by extends keyword.|



"
Class {
	#name : #FamixJavaWildcard,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTBounded + FamixTTypeArgument',
	#classTraits : 'FamixJavaTBounded classTrait + FamixTTypeArgument classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaWildcard class >> annotation [

	<FMClass: #Wildcard super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'*Famix-Java-Visitor' }
FamixJavaWildcard >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaWildcard: self
]
