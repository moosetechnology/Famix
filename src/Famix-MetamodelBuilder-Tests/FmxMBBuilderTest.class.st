"
coverage:

blacklistClasses := { FamixMetamodelBuilderRealEnvironment. FamixMetamodelGenerator }.
methods := 'Famix-MetamodelBuilder-Core' asPackage methods copyWithoutAll: (blacklistClasses flatCollect: #localMethods).

testRunner := TestRunner new.
testRunner instVarNamed: #packagesSelected put: #('Famix-MetamodelBuilder-Tests').
testRunner selectSubclasses.
testRunner collectCoverageFor: (methods collect: #asRingDefinition)
"
Class {
	#name : 'FmxMBBuilderTest',
	#superclass : 'FmxMBTestCase',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FmxMBBuilderTest >> testClassNamed [

	| c1 |
	
	c1 := builder newClassNamed: 'C1'.

	self assert: (builder classNamed: #C1) equals: c1.
	self assert: (builder classNamed: #C2) isNil.
]

{ #category : 'tests' }
FmxMBBuilderTest >> testConfiguration [
	| config |
	config := builder configuration.

	self assert: config isNotNil.

	self deny: config shouldGenerateFileImportHelpers.
	config shouldGenerateFileImportHelpers: true.
	self assert: config shouldGenerateFileImportHelpers
]

{ #category : 'tests' }
FmxMBBuilderTest >> testEnsureClassNamed [

	| c1 |
	
	c1 := builder ensureClassNamed: #C1.
	self assert: c1 isMetamodelClass.
	self assert: (builder ensureClassNamed: #C1) identicalTo: c1.
	
	
]

{ #category : 'tests' }
FmxMBBuilderTest >> testEnsureLocalTraitNamed [

	| t0 t1 |

	t0 := builder unsafeNewTraitNamed: #T1.	
	t0 prefix: 'Another'.
	t1 := builder unsafeNewTraitNamed: #T1.
	
	self assert: (builder ensureLocalTraitNamed: #T1) equals: t1.
]

{ #category : 'tests' }
FmxMBBuilderTest >> testEnsureLocalTraitNamedExisting [

	| aTrait |

	aTrait := builder unsafeNewTraitNamed: #T1.	
	aTrait prefix: 'Another'.

	self deny: (builder ensureLocalTraitNamed: #T1) equals: aTrait.

]

{ #category : 'tests' }
FmxMBBuilderTest >> testMultipleClassesCreation [

	"it should not be possible to create two classes with the same name"

	builder newClassNamed: #C1.
	self should: [ builder newClassNamed: #C1 ] raise: FmxMBEntityAlreadyExists.	
	
]

{ #category : 'tests' }
FmxMBBuilderTest >> testMultipleTraitsCreation [

	"it should not be possible to create two traits with the same name"

	builder newTraitNamed: #T1.
	self should: [ builder newTraitNamed: #T1 ] raise: FmxMBEntityAlreadyExists.	
	
]

{ #category : 'tests' }
FmxMBBuilderTest >> testParentBuilder [

	| parentBuilder childBuilder |
	
	parentBuilder := FamixMetamodelBuilder new.
	childBuilder := FamixMetamodelBuilder new.
	
	parentBuilder configuration packageName: 'ParentBuilderPackage'.
	childBuilder configuration packageName: 'ChildBuilderPackage'.
	
	childBuilder parentBuilder: parentBuilder.
	self assert: childBuilder parentBuilderPackageName equals: 'ParentBuilderPackage'

]

{ #category : 'tests' }
FmxMBBuilderTest >> testSafeAnnotationPackageName [

	builder configuration packageName: 'Package'.
	self assert: builder safeAnnotationPackageName equals: '#Package'.

	builder configuration packageName: 'Package-Core'.
	self assert: builder safeAnnotationPackageName equals: '#''Package-Core'''.	
]

{ #category : 'tests' }
FmxMBBuilderTest >> testSortedClasses [

	"test class sorting by their hierarchy"

	| c1 c2 c3 |
	
	c1 := builder newClassNamed: 'C1'.
	c2 := builder newClassNamed: 'C2'.
	c3 := builder newClassNamed: 'C3'.
	
	c3 <|-- c1 <|-- c2.
	
	self assert: builder sortedClasses asArray equals: { c3. c1. c2 }
]

{ #category : 'tests' }
FmxMBBuilderTest >> testSortedTraits [

	| t1 t2 t3 |
	
	t2 := builder newTraitNamed: #T2.
	t1 := builder newTraitNamed: #T1.
	t3 := builder newTraitNamed: #T3.

	self assertCollection: builder sortedTraits asArray equals: { t1. t2. t3 }.
	
	
]

{ #category : 'tests' }
FmxMBBuilderTest >> testSortedTraitsWith1LevelUsage [
	"traits should be sorted by name and by their useage level"

	| t1 t2 t3 |
	t1 := builder newTraitNamed: 'T1'.
	t2 := builder newTraitNamed: 'T2'.
	t3 := builder newTraitNamed: 'T3'.

	t3 <|-- t2.

	self assert: builder sortedTraits asArray equals: {
			t1.
			t3.
			t2 }
]

{ #category : 'tests' }
FmxMBBuilderTest >> testSortedTraitsWith2LevelUsage [
	"traits should be sorted by name and by their useage level"

	| t1 t2 t3 |
	t1 := builder newTraitNamed: 'T1'.
	t2 := builder newTraitNamed: 'T2'.
	t3 := builder newTraitNamed: 'T3'.

	t2 <|-- t1.
	t3 <|-- t2.

	self assert: builder sortedTraits asArray equals: {
			t3.
			t2.
			t1 }
]

{ #category : 'tests' }
FmxMBBuilderTest >> testTraitNamed [
	self should: [ builder traitNamed: #T1 ] raise: FamixMetamodelGeneratorUnknownTrait.
	builder ensureClassNamed: #C1.
	self should: [ builder traitNamed: #C1 ] raise: FamixMetamodelGeneratorUnknownTrait
]
