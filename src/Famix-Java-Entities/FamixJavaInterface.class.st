"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentPackage` | `FamixTPackageable` | `childEntities` | `FamixTPackage` | Package containing the entity in the code structure (if applicable)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
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
| `implementations` | `FamixTImplementable` | `interface` | `FamixTImplementation` | Implementation relationships.|
| `incomingImports` | `FamixTImportable` | `importedEntity` | `FamixTImport` | List of imports of this entity|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|
| `isFinal` | `Boolean` | false | Entity can be declared final|
| `visibility` | `String` | nil | Visibility of the entity|

"
Class {
	#name : #FamixJavaInterface,
	#superclass : #FamixJavaType,
	#traits : 'FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTImplementable + FamixTImportable + FamixTInvocationsReceiver + FamixTPackageable + FamixTTypeArgument + FamixTWithAttributes + FamixTWithComments + FamixTWithImports + FamixTWithInheritances + FamixTWithMethods',
	#classTraits : 'FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTImplementable classTrait + FamixTImportable classTrait + FamixTInvocationsReceiver classTrait + FamixTPackageable classTrait + FamixTTypeArgument classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithImports classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInterface class >> annotation [

	<FMClass: #Interface super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixJavaInterface >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaInterface: self
]

{ #category : #private }
FamixJavaInterface >> addMethodOverriding: aMethod in: aCollection [

	self implementations do: [ :implementation |
		| implClass |
		implClass := implementation implementingClass.
		implClass methods
			detect: [ :method | method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ].
		implClass addMethodOverriding: aMethod in: aCollection ].

	self directSubclasses do: [ :subInterface |
		subInterface methods
			detect: [ :method | method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ].

		subInterface addMethodOverriding: aMethod in: aCollection ]
]

{ #category : #testing }
FamixJavaInterface >> isInterface [

	<generated>
	^ true
]
