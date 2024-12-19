"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTTypeParameter` | `genericParameter` | `FamixTConcretization` | Known concretizations of this type parameter.|
| `outgoingConcretizations` | `FamixTConcreteType` | `concreteParameter` | `FamixTConcretization` | Concretizations where the concrete parameter is this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catchingEntities` | `FamixTThrowable` | `caughtExceptions` | `FamixTWithExceptions` | |
| `declaringEntities` | `FamixTThrowable` | `declaredExceptions` | `FamixTWithExceptions` | |
| `genericEntities` | `FamixTConcreteType` | `parameters` | `FamixTParametricEntity` | Generic entities for which a type parameter is this type.|
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
