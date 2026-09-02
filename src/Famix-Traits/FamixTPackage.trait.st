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
	#name : 'FamixTPackage',
	#instVars : [
		'#childEntities => FMMany type: #FamixTPackageable opposite: #parentPackage'
	],
	#traits : 'FamixTNamedEntity + FamixTCanBeStub + FamixTWithClasses + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTCanBeStub classTrait + FamixTWithClasses classTrait + TEntityMetaLevelDependency classTrait',
	#category : 'Famix-Traits-Package',
	#package : 'Famix-Traits',
	#tag : 'Package'
}

{ #category : 'meta' }
FamixTPackage classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TPackage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'groups' }
FamixTPackage classSide >> annotationFamixPackageGroup [

	<ignoreForCoverage>
	<generated>
	<mooseGroup>
	^ FamixPackageGroup
]

{ #category : 'accessing' }
FamixTPackage >> addChildEntity: anObject [
	childEntities add: anObject

]

{ #category : 'accessing' }
FamixTPackage >> childEntities [
	"Relation named: #childEntities type: #FamixTPackageable opposite: #parentPackage"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ childEntities
]

{ #category : 'accessing' }
FamixTPackage >> childEntities: anObject [

	<ignoreForCoverage>
	<generated>
	childEntities value: anObject
]

{ #category : 'testing' }
FamixTPackage >> isPackage [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'metrics' }
FamixTPackage >> numberOfClientPackages [

	<FMProperty: #numberOfClientPackages type: #Number>
	<FMComment: 'The number of packages which depend on this package'>
	<derived>
	^ self cacheAt: #numberOfClientPackages ifAbsentPut: [ self allClientsAtMyScope size ]
]

{ #category : 'metrics' }
FamixTPackage >> relativeImportanceForSystem [

	<FMProperty: #relativeImportanceForSystem type: #Number>
	<FMComment: 'The number of client packages normalized by the total number of packages'>
	<derived>
	^ self cacheAt: #relativeImportanceForSystem ifAbsentPut: [
			  self mooseModel allModelPackages size > 1
				  ifTrue: [ self numberOfClientPackages / (self mooseModel allModelPackages size - 1) ]
				  ifFalse: [ 0 ] ]
]

{ #category : 'metrics' }
FamixTPackage >> weightedMethodCount [

	<FMProperty: #weightedMethodCount type: #Number>
	<FMComment: 'The sum of the complexity in a package'>
	<derived>
	^ self cacheAt: #WMC ifAbsentPut: [ (self containedEntitiesOfType: FamixTWithMethods) sum: #weightedMethodCount ]
]
