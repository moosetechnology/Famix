"
## Relations
======================

### Children
| Relation | Type | Opposite | Comment |
| `types` | `FamixTType` | `typeContainer` | Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingReferences` | `FamixTReference` | `referredType` | References to this entity by other entities.|



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
