"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTConcreteType` | `concreteParameter` | `FamixTConcretization` | Concretizations where this type is the concrete parameter.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTTypeParameter` | `genericParameter` | `FamixTConcretization` | Known concretizations of this type parameter.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchingEntities` | `FamixTThrowable` | `caughtExceptions` | `FamixTWithExceptions` | |
| `declaringEntities` | `FamixTThrowable` | `declaredExceptions` | `FamixTWithExceptions` | |
| `genericEntity` | `FamixTTypeParameter` | `typeParameters` | `FamixTParametricEntity` | Generic entity that declare this type parameter.|
| `lowerBound` | `FamixJavaTBounded` | `lowerBoundedWildcards` | `FamixJavaTBound` | Lower bound on wildcard, specified by super keyword.|
| `throwingEntities` | `FamixTThrowable` | `thrownExceptions` | `FamixTWithExceptions` | |
| `upperBound` | `FamixJavaTBounded` | `upperBoundedWildcards` | `FamixJavaTBound` | Upper bound on wildcard, specified by extends keyword.|



"
Class {
	#name : #FamixJavaTypeParameter,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTBounded + FamixTConcreteType + FamixTThrowable + FamixTTypeParameter',
	#classTraits : 'FamixJavaTBounded classTrait + FamixTConcreteType classTrait + FamixTThrowable classTrait + FamixTTypeParameter classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaTypeParameter class >> annotation [

	<FMClass: #TypeParameter super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
