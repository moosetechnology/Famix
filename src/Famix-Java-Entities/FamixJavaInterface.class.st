"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentPackage` | `FamixTPackage` | `childEntities` | Package containing the entity in the code structure (if applicable)|

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|
| `methods` | `FamixTMethod` | `parentType` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `outgoingImports` | `FamixTImport` | `importingEntity` | |
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `implementations` | `FamixTImplementation` | `interface` | Implementation relationships.|
| `incomingImports` | `FamixTImport` | `importedEntity` | List of imports of this entity|
| `subInheritances` | `FamixTInheritance` | `superclass` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Type | Opposite | Comment |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `receivingInvocations` | `FamixTInvocation` | `receiver` | List of invocations performed on this entity (considered as the receiver)|


## Properties
======================

| Name | Type | Comment |
| `isClassSide` | Boolean | Entity can be declared class side i.e. static|
| `isFinal` | Boolean | Entity can be declared final|
| `visibility` | String | Visibility of the entity|

"
Class {
	#name : #FamixJavaInterface,
	#superclass : #FamixJavaType,
	#traits : 'FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTImplementable + FamixTImportable + FamixTInvocationsReceiver + FamixTPackageable + FamixTWithAttributes + FamixTWithComments + FamixTWithImports + FamixTWithInheritances + FamixTWithMethods',
	#classTraits : 'FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTImplementable classTrait + FamixTImportable classTrait + FamixTInvocationsReceiver classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithImports classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInterface class >> annotation [

	<FMClass: #Interface super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #private }
FamixJavaInterface >> addMethodOverriding: aMethod in: aCollection [

	(self implementations collect: #implementingClass) do: [
		:implementingClass |
		implementingClass addMethodOverriding: aMethod in: aCollection ].

	self directSubclasses do: [ :subInterface |
		subInterface methods
			detect: [ :method | method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ]
			ifNone: [
			subInterface addMethodOverriding: aMethod in: aCollection ] ]
]

{ #category : #testing }
FamixJavaInterface >> isInterface [

	<generated>
	^ true
]
