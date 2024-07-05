"
FamixTPackage represents a package in the source language, meaning that it provides a means to group entities without any baring on lexical scoping. 

Java extractors map Java packages to FamixTNamespaces. They can also mirror the same information in terms of FamixTPackage instances.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `childEntities` | `FamixTPackage` | `parentPackage` | `FamixTPackageable` | |

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
	#name : #FamixTPackage,
	#instVars : [
		'#childEntities => FMMany type: #FamixTPackageable opposite: #parentPackage'
	],
	#traits : 'FamixTNamedEntity + FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Package'
}

{ #category : #meta }
FamixTPackage classSide >> annotation [

	<FMClass: #TPackage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTPackage classSide >> annotationFamixPackageGroup [
	<generated>
	<mooseGroup>
	^ FamixPackageGroup
]

{ #category : #accessing }
FamixTPackage >> addChildEntity: anObject [
	childEntities add: anObject

]

{ #category : #accessing }
FamixTPackage >> childEntities [
	"Relation named: #childEntities type: #FamixTPackageable opposite: #parentPackage"

	<generated>
	<derived>
	^ childEntities
]

{ #category : #accessing }
FamixTPackage >> childEntities: anObject [

	<generated>
	childEntities value: anObject
]

{ #category : #testing }
FamixTPackage >> isPackage [

	<generated>
	^ true
]

{ #category : #metrics }
FamixTPackage >> weightedMethodCount [

	<FMProperty: #weightedMethodCount type: #Number>
	<FMComment: 'The sum of the complexity in a package'>
	<derived>
	^ self
		  lookUpPropertyNamed: #WMC
		  computedAs: [ 
		  (self toScope: FamixTWithMethods) sum: #weightedMethodCount ]
]
