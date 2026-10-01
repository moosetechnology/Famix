"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `types` | `FamixTWithTypes` | `typeContainer` | `FamixTType` | Types contained (declared) in this entity, if any. #types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|



"
Class {
	#name : #FamixTest2PrimitiveType,
	#superclass : #FamixTest2Type,
	#traits : 'FamixTReferenceable + FamixTWithTypes',
	#classTraits : 'FamixTReferenceable classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2PrimitiveType class >> annotation [

	<ignoreForCoverage>
	<FMClass: #PrimitiveType super: #FamixTest2Type>
	<package: #'Famix-Test2-Entities'>
	<generated>
]
