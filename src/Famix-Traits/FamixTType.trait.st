"
FamixTType is a generic class representing a type. It has several specializations for specific kinds of types, the typical one being FamixTClass.
A type is defined in a container (instance of FamixTContainer). 
The container is typically a namespace (instance of FamixTNamespace), but may also be a class (in the case of nested classes), or a method (in the case of anonymous classes).

A type can have multiple subtypes or supertypes. These are modelled by means of FamixTInheritance instances.
"
Trait {
	#name : #FamixTType,
	#instVars : [
		'#typeContainer => FMOne type: #FamixTWithTypes opposite: #types',
		'#typedEntities => FMMany type: #FamixTTypedEntity opposite: #declaredType'
	],
	#traits : 'FamixTNamedEntity + FamixTReferenceable + FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTReferenceable classTrait + FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Type'
}

{ #category : #meta }
FamixTType classSide >> annotation [

	<FMClass: #TType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTType classSide >> annotationFamixTypeGroup [
	<generated>
	<mooseGroup>
	^ FamixTypeGroup
]

{ #category : #adding }
FamixTType >> addTypedEntity: anObject [
	<generated>
	^ self typedEntities add: anObject
]

{ #category : #deprecated }
FamixTType >> belongsTo [
	^ self parentPackage ifNil: [ self parents ifNotEmpty: #anyOne ifEmpty: [ nil ] ]
]

{ #category : #testing }
FamixTType >> entityHasIncomingTypeDeclarations [
	^ self typedEntities isNotEmpty
]

{ #category : #testing }
FamixTType >> isType [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTType >> mooseNameOn: aStream [
	self typeContainer
		ifNotNil: [ :parent |
			parent mooseNameOn: aStream.
			aStream nextPutAll: '::' ].
	self name ifNotNil: [ :n | aStream nextPutAll: n ]
]

{ #category : #metrics }
FamixTType >> numberOfAccessesToForeignData [

	self deprecated:
		'This method will be removed in the nex version of Moose'.
	^ self
		  lookUpPropertyNamed: #numberOfAccessesToForeignData
		  computedAs: [ self notExistentMetricValue ]
]

{ #category : #metrics }
FamixTType >> numberOfAccessesToForeignData: aNumber [

	self deprecated:
		'This method will be removed in the nex version of Moose'.
	self cacheAt: #numberOfAccessesToForeignData put: aNumber
]

{ #category : #testing }
FamixTType >> realType [
	"All types except the alias ones are real"
	^ self 
]

{ #category : #accessing }
FamixTType >> typeContainer [
	"Relation named: #typeContainer type: #FamixTWithTypes opposite: #types"

	<generated>
	<FMComment: 'Container entity to which this type belongs to. Container is a namespace, not a package (Smalltalk).'>
	<container>
	^ typeContainer
]

{ #category : #accessing }
FamixTType >> typeContainer: anObject [

	typeContainer := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTType >> typeContainerGroup [
	<generated>
	<navigation: 'TypeContainer'>
	^ MooseSpecializedGroup with: self typeContainer
]

{ #category : #accessing }
FamixTType >> typedEntities [
	"Relation named: #typedEntities type: #FamixTTypedEntity opposite: #declaredType"

	<generated>
	<FMComment: 'Entities that have this type as declaredType'>
	<derived>
	^ typedEntities
]

{ #category : #accessing }
FamixTType >> typedEntities: anObject [

	<generated>
	typedEntities value: anObject
]
