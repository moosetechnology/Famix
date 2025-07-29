"
I am testing how a generator behave when we redefine the root entity.

We have 3 generators:
- A with an EntityA inheriting from FmxRootEntityAEntity
- B with an EntityB inheriting from FmxRootEntityBEntity
- C with EntityC inheriting from FmxRootEntityAEntity and EntityD inheriting from FmxRootEntityBEntity

The generator C will not have a FmxRootEntityCEntity and testing methods should go on FmxRootEntityAEntity and FmxRootEntityBEntity as extensions.
"
Class {
	#name : 'FamixGeneratorRootEntityTest',
	#superclass : 'TestCase',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'accessing' }
FamixGeneratorRootEntityTest >> classNamed: aSymbol [

	^ self class environment at: aSymbol ifAbsent: [ self fail: 'The class ' , aSymbol , ' does not exist in the system.' ]
]

{ #category : 'helpers' }
FamixGeneratorRootEntityTest >> generators [

	^ {
		  FamixRemoteRootEntityGeneratorA.
		  FamixRemoteRootEntityGeneratorB.
		  FamixRemoteRootEntityGeneratorC }
]

{ #category : 'running' }
FamixGeneratorRootEntityTest >> setUp [
	super setUp.
	self generators do: #generate
]

{ #category : 'running' }
FamixGeneratorRootEntityTest >> tearDown [

	self generators do: [ :generator | self packageOrganizer removePackage: generator packageName ].
	super tearDown
]

{ #category : 'tests' }
FamixGeneratorRootEntityTest >> testEntityClasses [

	self assert: (self classNamed: #FmxRootEntityAEntity) isNotNil.
	self assert: (self classNamed: #FmxRootEntityBEntity) isNotNil.
	self class environment
		at: #FmxRootEntityCEntity
		ifPresent: [ self fail: 'We should not have an entity class for the Generator C because all concrete classes inherit from remote entities.' ]
]

{ #category : 'tests' }
FamixGeneratorRootEntityTest >> testTestingMethodsOfGeneratorAAndB [

	self assert: ((self classNamed: #FmxRootEntityAEntity) includesSelector: #isEntityA).
	self deny: (self classNamed: #FmxRootEntityAEntity) new isEntityA.
	self assert: ((self classNamed: #FmxRootEntityAEntityA) includesSelector: #isEntityA).
	self assert: (self classNamed: #FmxRootEntityAEntityA) new isEntityA.

	self assert: ((self classNamed: #FmxRootEntityBEntity) includesSelector: #isEntityB).
	self deny: (self classNamed: #FmxRootEntityBEntity) new isEntityB.
	self assert: ((self classNamed: #FmxRootEntityBEntityB) includesSelector: #isEntityB).
	self assert: (self classNamed: #FmxRootEntityBEntityB) new isEntityB
]

{ #category : 'tests' }
FamixGeneratorRootEntityTest >> testTestingMethodsOfGeneratorC [

	self assert: ((self classNamed: #FmxRootEntityAEntity) includesSelector: #isEntityC).
	self deny: ((self classNamed: #FmxRootEntityAEntity) includesSelector: #isEntityD).
	self deny: ((self classNamed: #FmxRootEntityBEntity) includesSelector: #isEntityC).
	"In this case, EntityD is not a direct subclass of EntityBEntity but it should still work"
	self assert: ((self classNamed: #FmxRootEntityBEntity) includesSelector: #isEntityD).

	self assert: ((self classNamed: #FmxRootEntityAEntity) >> #isEntityC) isExtension.
	self assert: ((self classNamed: #FmxRootEntityAEntity) >> #isEntityC) package name equals: 'Famix-MetamodelBuilder-Tests-RootEntityC'.
	self assert: ((self classNamed: #FmxRootEntityBEntity) >> #isEntityD) isExtension.
	self assert: ((self classNamed: #FmxRootEntityBEntity) >> #isEntityD) package name equals: 'Famix-MetamodelBuilder-Tests-RootEntityC'
]
