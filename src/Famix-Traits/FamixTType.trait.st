"
FamixTType is a generic class representing a type. It has several specializations for specific kinds of types, the typical one being FamixTClass.
A type is defined in a container (instance of FamixTContainer). 
The container is typically a namespace (instance of FamixTNamespace), but may also be a class (in the case of nested classes), or a method (in the case of anonymous classes).

A type can have multiple subtypes or supertypes. These are modelled by means of FamixTInheritance instances.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

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
Trait {
	#name : #FamixTType,
	#instVars : [
		'#incomingTypings => FMMany type: #FamixTEntityTyping opposite: #declaredType',
		'#typeContainer => FMOne type: #FamixTWithTypes opposite: #types'
	],
	#traits : 'FamixTCanBeStub + FamixTNamedEntity + FamixTReferenceable + TEntityMetaLevelDependency',
	#classTraits : 'FamixTCanBeStub classTrait + FamixTNamedEntity classTrait + FamixTReferenceable classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Type'
}

{ #category : #meta }
FamixTType classSide >> annotation [

	<FMClass: #TType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTType classSide >> annotationFamixTypeGroup [
	<generated>
	<mooseGroup>
	^ FamixTypeGroup
]

{ #category : #adding }
FamixTType >> addIncomingTyping: anObject [
	<generated>
	^ self incomingTypings add: anObject
]

{ #category : #deprecated }
FamixTType >> belongsTo [
	^ self parentPackage ifNil: [ self parents ifNotEmpty: #anyOne ifEmpty: [ nil ] ]
]

{ #category : #testing }
FamixTType >> entityHasIncomingTypeDeclarations [

	^ self incomingDeclarations isNotEmpty
]

{ #category : #accessing }
FamixTType >> incomingTypings [
	"Relation named: #incomingTypings type: #FamixTEntityTyping opposite: #declaredType"

	<generated>
	<FMComment: 'Relations to the entities that have this as type.'>
	<derived>
	^ incomingTypings
]

{ #category : #accessing }
FamixTType >> incomingTypings: anObject [

	<generated>
	incomingTypings value: anObject
]

{ #category : #testing }
FamixTType >> isType [

	<generated>
	^ true
]

{ #category : #printing }
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
	<FMComment: 'Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).'>
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
