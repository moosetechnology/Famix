"
## Relations
======================

### Parents
- Relation: #parentPackage Type: #FamixTPackage Opposite: #childEntities Comment: Package containing the entity in the code structure (if applicable)
### Children
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
- Relation: #methods Type: #FamixTMethod Opposite: #parentType Comment: Methods declared by this type.
### Outgoing dependencies
- Relation: #outgoingImports Type: #FamixTImport Opposite: #importingEntity
- Relation: #superInheritances Type: #FamixTInheritance Opposite: #subclass Comment: Superinheritance relationships, i.e. known superclasses of this type.
### Incoming dependencies
- Relation: #implementations Type: #FamixTImplementation Opposite: #interface Comment: Implementation relationships.
- Relation: #incomingImports Type: #FamixTImport Opposite: #importedEntity Comment: List of imports of this entity
- Relation: #subInheritances Type: #FamixTInheritance Opposite: #superclass Comment: Subinheritance relationships, i.e. known subclasses of this type.
### Other
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)

## Properties
======================

- Named: #isClassSide Type: Boolean Comment: Entity can be declared class side i.e. static
- Named: #isFinal Type: Boolean Comment: Entity can be declared final
- Named: #visibility Type: String Comment: Visibility of the entity

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
