"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|



"
Class {
	#name : #FamixJavaVariable,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTInvocationsReceiver',
	#classTraits : 'FamixTInvocationsReceiver classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaVariable class >> annotation [

	<FMClass: #Variable super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixJavaVariable class >> isAbstract [

	<generated>
	^ self == FamixJavaVariable
]

{ #category : #visitor }
FamixJavaVariable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaVariable: self
]
