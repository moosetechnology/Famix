"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTTypeArgument` | `typeArgument` | `FamixTConcretization` | Concretizations where this type is the type argument.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTTypeParameter` | `typeParameter` | `FamixTConcretization` | Known concretizations of this type parameter.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchingEntities` | `FamixTThrowable` | `caughtExceptions` | `FamixTWithExceptions` | |
| `declaringEntities` | `FamixTThrowable` | `declaredExceptions` | `FamixTWithExceptions` | |
| `genericEntity` | `FamixTTypeParameter` | `typeParameters` | `FamixTParametricEntity` | Generic entity that declares this type parameter.|
| `lowerBound` | `FamixJavaTBounded` | `lowerBoundedWildcards` | `FamixJavaTBound` | Lower bound on wildcard, specified by super keyword.|
| `throwingEntities` | `FamixTThrowable` | `thrownExceptions` | `FamixTWithExceptions` | |
| `upperBound` | `FamixJavaTBounded` | `upperBoundedWildcards` | `FamixJavaTBound` | Upper bound on wildcard, specified by extends keyword.|



"
Class {
	#name : #FamixJavaTypeParameter,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTBounded + FamixTThrowable + FamixTTypeArgument + FamixTTypeParameter',
	#classTraits : 'FamixJavaTBounded classTrait + FamixTThrowable classTrait + FamixTTypeArgument classTrait + FamixTTypeParameter classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaTypeParameter class >> annotation [

	<FMClass: #TypeParameter super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixJavaTypeParameter >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaTypeParameter: self
]
