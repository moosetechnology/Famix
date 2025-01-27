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
	#name : #FamixTest3PrimitiveType,
	#superclass : #FamixTest3Type,
	#traits : 'FamixTReferenceable + FamixTWithTypes',
	#classTraits : 'FamixTReferenceable classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3PrimitiveType class >> annotation [

	<FMClass: #PrimitiveType super: #FamixTest3Type>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
