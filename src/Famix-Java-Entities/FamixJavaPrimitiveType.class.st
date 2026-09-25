"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTTypeArgument` | `typeArgument` | `FamixTConcretization` | Concretizations where this type is the type argument.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `incomingTypings` | `FamixTType` | `declaredType` | `FamixTEntityTyping` | Relations to the entities that have this as type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixJavaPrimitiveType',
	#superclass : 'FamixJavaType',
	#traits : 'FamixTPrimitiveType + FamixTTypeArgument',
	#classTraits : 'FamixTPrimitiveType classTrait + FamixTTypeArgument classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaPrimitiveType class >> annotation [

	<ignoreForCoverage>
	<FMClass: #PrimitiveType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'testing' }
FamixJavaPrimitiveType >> isPrimitiveType [

	<ignoreForCoverage>
	<generated>
	^ true
]
