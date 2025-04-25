"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `enumValues` | `FamixTWithEnumValues` | `parentEnum` | `FamixTEnumValue` | |
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `imports` | `FamixTWithImports` | `importingEntity` | `FamixTImport` | |
| `outgoingConcretizations` | `FamixTTypeArgument` | `typeArgument` | `FamixTConcretization` | Concretizations where this type is the type argument.|
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingImports` | `FamixTImportable` | `importedEntity` | `FamixTImport` | List of imports of this entity|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `incomingTypings` | `FamixTType` | `declaredType` | `FamixTEntityTyping` | Relations to the entities that have this as type.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `visibility` | `String` | nil | Visibility of the entity|

"
Class {
	#name : #FamixJavaEnum,
	#superclass : #FamixJavaType,
	#traits : 'FamixTEnum + FamixTHasVisibility + FamixTImportable + FamixTInvocationsReceiver + FamixTTypeArgument + FamixTWithAttributes + FamixTWithComments + FamixTWithImports + FamixTWithInheritances + FamixTWithMethods',
	#classTraits : 'FamixTEnum classTrait + FamixTHasVisibility classTrait + FamixTImportable classTrait + FamixTInvocationsReceiver classTrait + FamixTTypeArgument classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithImports classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnum class >> annotation [

	<FMClass: #Enum super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #private }
FamixJavaEnum >> addMethodOverriding: aMethod in: aCollection [

	self directSubclasses do: [ :subClass |
		subClass methods
			detect: [ :method | method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ].
		subClass addMethodOverriding: aMethod in: aCollection ]
]

{ #category : #accessing }
FamixJavaEnum >> values [
	^ self enumValues
]

{ #category : #accessing }
FamixJavaEnum >> values: anObject [
	self enumValues: anObject
]
