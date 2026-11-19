Class {
	#name : 'FamixFameMetamodelBuilderTest',
	#superclass : 'TestCase',
	#instVars : [
		'builder'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
FamixFameMetamodelBuilderTest >> setUp [

	super setUp.
	builder := FamixMetamodelBuilder new.
	builder configuration
		prefix: 'FameFirstTest';
		packageName: #'Fame-First-Test'.
	builder withoutModel
]

{ #category : 'private' }
FamixFameMetamodelBuilderTest >> signatureOf: aMetamodel [
	"Handwritten getters need not repeat the defaults declared in the DSL."

	^ {
		  (aMetamodel classes
			   collect: [ :type |
					   {
						   type fullName.
						   type superclass fullName.
						   type isAbstract.
						   (type traits collect: #fullName as: Array) sorted } ]
			   as: Set).
		  (aMetamodel traits
			   collect: [ :type |
					   {
						   type fullName.
						   (type traits collect: #fullName as: Array) sorted } ]
			   as: Set).
		  (aMetamodel properties
			   collect: [ :property |
					   {
						   property fullName.
						   property type fullName.
						   (property opposite ifNotNil: [ :opposite | opposite fullName ]).
						   property isMultivalued.
						   property isContainer.
						   property isDerived.
						   property isSource.
						   property isTarget.
						   property implementingSelector } ]
			   as: Set).
		  (aMetamodel packages collect: #name as: Set) }
]

{ #category : 'running' }
FamixFameMetamodelBuilderTest >> tearDown [

	[ (#'Fame-First-Test' asPackageIfAbsent: [ nil ]) ifNotNil: [ :package | package removeFromSystem ] ] ensure: [ super tearDown ]
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testBuildsDescriptionWithoutInstallingClasses [

	| entity metamodel description |
	entity := builder newClassNamed: #Node.
	entity property: #label type: #String defaultValue: 'unnamed'.
	metamodel := FamixFameMetamodelBuilder new buildFrom: builder.
	description := metamodel classes detect: [ :each | each name = #Node ].
	self deny: (self class environment includesKey: #FameFirstTestNode).
	self assert: description implementingClass isNil.
	self assert: description properties size equals: 1.
	self assert: description properties anyOne defaultValue equals: 'unnamed'.
	self assert: description properties anyOne implementingSelector equals: #label
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testCommentNormalizationDoesNotCauseRepeatedChanges [

	| node metamodel |
	node := builder newClassNamed: #Node.
	node comment: '  Description'.
	metamodel := builder buildMetamodel.
	FamixFameMaterializer new materialize: metamodel.
	self assertEmpty: (FamixFameMaterializer new changesFor: metamodel)
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testComposedAndJavaMetamodelsMatchAnnotations [

	{
		FamixTestComposedGenerator.
		FamixTestComposed3Generator.
		FamixJavaGenerator } do: [ :generator |
			| metamodel reconstructed modelClass |
			metamodel := generator buildMetamodel.
			modelClass := self class environment at: generator mooseModelName.
			reconstructed := FMMetaModelBuilder metamodelFromPackages: modelClass packagesToProcessToCreateMetamodel.
			self assert: (self signatureOf: metamodel) equals: (self signatureOf: reconstructed).
			self assertEmpty: (FamixFameMaterializer new changesFor: metamodel) ]
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testDeclaredRelationTypeDoesNotDependOnTraversalOrder [

	| owner firstChild secondChild metamodel description |
	secondChild := builder newClassNamed: #SecondChild.
	firstChild := builder newClassNamed: #FirstChild.
	owner := builder newClassNamed: #Owner.
	(owner property: #child) - (firstChild property: #parent).
	(owner property: #child) - (secondChild property: #parent).
	metamodel := builder buildMetamodel.
	description := metamodel classes detect: [ :type | type name = #Owner ].
	self assert: description properties anyOne type name equals: #FirstChild
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testGeneratedMetamodelMatchesAnnotations [

	| metamodel reconstructed |
	metamodel := FamixTest1Generator buildMetamodel.
	FamixFameMaterializer new materialize: metamodel.
	reconstructed := FMMetaModelBuilder metamodelFromPackages: FamixTest1Model packagesToProcessToCreateMetamodel.
	self assert: (self signatureOf: metamodel) equals: (self signatureOf: reconstructed)
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testIncludesDeclaredPackagesInTheModel [

	| metamodel package description |
	builder newClassNamed: #Node.
	metamodel := builder buildMetamodel.
	package := metamodel packageNamed: #'Fame-First-Test'.
	description := metamodel classes detect: [ :type | type name = #Node ].
	self assert: (metamodel packages includes: package).
	self assert: description package identicalTo: package.
	metamodel updateCache.
	self assert: (metamodel packageNamed: #'Fame-First-Test') identicalTo: package
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testInstallsTheSameDescriptionInExistingModels [

	| model metamodel |
	model := FamixTest1Model new.
	model metamodel.
	metamodel := FamixTest1Generator buildMetamodel.
	FamixFameMaterializer new materialize: metamodel.
	FamixTest1Model metamodel: metamodel.
	self assert: FamixTest1Model metamodel identicalTo: metamodel.
	self assert: model metamodel identicalTo: metamodel
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testMaterializesDerivedRelationAnnotations [

	| parent child metamodel description |
	parent := builder newClassNamed: #Parent.
	child := builder newClassNamed: #Child.
	(parent property: #children) derived <>-* (child property: #parent).
	metamodel := builder buildMetamodel.
	FamixFameMaterializer new materialize: metamodel.
	description := metamodel classes detect: [ :type | type name = #Parent ].
	self assert: (description implementingClass >> #children hasPragmaNamed: #derived)
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testMaterializesPropertiesFromTheFameDescription [

	| metamodel description property implementation |
	(builder newClassNamed: #Node) property: #label type: #String defaultValue: 'before'.
	metamodel := builder buildMetamodel.
	description := metamodel classes detect: [ :each | each name = #Node ].
	property := description properties anyOne.
	property defaultValue: 'after'.
	FamixFameMaterializer new materialize: metamodel.
	implementation := description implementingClass.
	self assert: (implementation new perform: #label) equals: 'after'.
	self assert: (implementation >> #label pragmaAt: #FMProperty:type:defaultValue:) arguments last equals: 'after'
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testMaterializesTheBuiltDescription [

	| metamodel description implementation |
	builder newClassNamed: #Node.
	metamodel := builder buildMetamodel.
	description := metamodel classes detect: [ :each | each name = #Node ].
	FamixFameMaterializer new materialize: metamodel.
	implementation := self class environment at: #FameFirstTestNode.
	self assert: description implementingClass identicalTo: implementation.
	self assert: (metamodel fmTypeOf: implementation) identicalTo: description.
	self assert: (FamixFameMaterializer new changesFor: metamodel) isEmpty
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testPreservesFamixSupportMethodsAndGroups [

	| node metamodel implementation first second |
	node := builder newClassNamed: #Node.
	node
		withTesting;
		withEqualityCheckOn: #( label );
		withGroup.
	node property: #label type: #String defaultValue: 'same'.
	metamodel := builder buildMetamodel.
	FamixFameMaterializer new materialize: metamodel.
	implementation := self class environment at: #FameFirstTestNode.
	first := implementation new.
	second := implementation new.
	self assert: (first perform: #isNode).
	self assert: first equals: second.
	self assert: first hash equals: second hash.
	self assert: (self class environment at: #FameFirstTestNodeGroup) superclass identicalTo: MooseSpecializedGroup.
	self assertEmpty: (FamixFameMaterializer new changesFor: metamodel)
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testPreservesForeignGeneratedExtensions [

	| metamodel implementation |
	builder newClassNamed: #Node.
	metamodel := builder buildMetamodel.
	FamixFameMaterializer new materialize: metamodel.
	implementation := self class environment at: #FameFirstTestNode.
	[
		implementation compile: 'foreignGenerated <generated> ^ 42' classified: #'*Foreign-Fame-Test'.
		self assert: (implementation >> #foreignGenerated) package name equals: #'Foreign-Fame-Test'.
		FamixFameMaterializer new materialize: metamodel.
		self assert: (implementation includesSelector: #foreignGenerated).
		self assert: (implementation new perform: #foreignGenerated) equals: 42 ] ensure: [
		(#'Foreign-Fame-Test' asPackageIfAbsent: [ nil ]) ifNotNil: [ :package | package removeFromSystem ] ]
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testPreservesHandwrittenCoreDescriptions [

	| metamodel reconstructed |
	metamodel := MooseModelGenerator buildMetamodel.
	reconstructed := FMMetaModelBuilder metamodelFromPackages: MooseModel packagesToProcessToCreateMetamodel.
	self assert: (self signatureOf: metamodel) equals: (self signatureOf: reconstructed).
	self assertEmpty: (FamixFameMaterializer new changesFor: metamodel)
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testPreservesPolymorphicRelationAccessors [

	| owner firstChild secondChild metamodel implementation first second parent packages reconstructed |
	owner := builder newClassNamed: #Owner.
	firstChild := builder newClassNamed: #FirstChild.
	secondChild := builder newClassNamed: #SecondChild.
	(owner property: #child) - (firstChild property: #parent).
	(owner property: #child) - (secondChild property: #parent).
	metamodel := builder buildMetamodel.
	FamixFameMaterializer new materialize: metamodel.
	implementation := self class environment at: #FameFirstTestOwner.
	parent := implementation new.
	first := (self class environment at: #FameFirstTestFirstChild) new.
	second := (self class environment at: #FameFirstTestSecondChild) new.
	first perform: #parent: with: parent.
	self assert: (parent perform: #child) identicalTo: first.
	second perform: #parent: with: parent.
	self assert: (parent perform: #child) identicalTo: second.
	self assert: (first perform: #parent) isNil.
	packages := Set with: #'Fame-First-Test' asPackage with: MooseModel package.
	packages addAll: (MooseModel defaultPackagesToProcessWith: packages).
	reconstructed := FMMetaModelBuilder metamodelFromPackages: packages.
	self assert: (self signatureOf: metamodel) equals: (self signatureOf: reconstructed)
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testPreservesRelationsAndTraits [

	| parent child trait metamodel parentDescription childDescription children |
	parent := builder newClassNamed: #Parent.
	child := builder newClassNamed: #Child.
	trait := builder newTraitNamed: #TNamed.
	trait property: #name type: #String.
	parent --|> trait.
	(parent property: #children) <>-* (child property: #parent).
	metamodel := FamixFameMetamodelBuilder new buildFrom: builder.
	parentDescription := metamodel classes detect: [ :each | each name = #Parent ].
	childDescription := metamodel classes detect: [ :each | each name = #Child ].
	children := parentDescription properties detect: [ :each | each name = #children ].
	self assert: children isMultivalued.
	self assert: children opposite isContainer.
	self assert: children type identicalTo: childDescription.
	self assert: children opposite type identicalTo: parentDescription.
	self assert: parentDescription traits anyOne name equals: #TNamed.
	self assert: (parentDescription allProperties anySatisfy: [ :each | each name = #name ])
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testRejectsInvalidDescriptionBeforeInstallingCode [

	| parent child metamodel children |
	parent := builder newClassNamed: #Parent.
	child := builder newClassNamed: #Child.
	(parent property: #children) <>-* (child property: #parent).
	metamodel := builder buildMetamodel.
	children := (metamodel classes detect: [ :type | type name = #Parent ]) properties anyOne.
	children isContainer: true.
	self should: [ FamixFameMaterializer new materialize: metamodel ] raise: AssertionFailure.
	self deny: (self class environment includesKey: #FameFirstTestParent).
	self assert: (#'Fame-First-Test' asPackageIfAbsent: [ nil ]) isNil
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testRemovesObsoleteGeneratedPropertiesAndPreservesHandwrittenCode [

	| metamodel description property implementation |
	(builder newClassNamed: #Node) property: #label type: #String.
	metamodel := builder buildMetamodel.
	description := metamodel classes detect: [ :each | each name = #Node ].
	FamixFameMaterializer new materialize: metamodel.
	implementation := description implementingClass.
	implementation compile: 'custom ^ 42' classified: #testing.
	property := description properties anyOne.
	description properties remove: property.
	metamodel remove: property.
	FamixFameMaterializer new materialize: metamodel.
	self deny: (implementation includesSelector: #label).
	self deny: (implementation includesSelector: #label:).
	self deny: (implementation slots anySatisfy: [ :slot | slot name = #label ]).
	self assert: (implementation new perform: #custom) equals: 42
]

{ #category : 'tests' }
FamixFameMetamodelBuilderTest >> testRetainsHandwrittenMetricsWithoutGeneratingSlots [

	| metamodel description property |
	metamodel := FamixTest1Generator buildMetamodel.
	description := metamodel traits detect: [ :type | type famixImplementationName = #FamixTWithComments ].
	property := description properties detect: [ :each | each name = #numberOfComments ].
	self deny: property famixIsGenerated.
	self assert: property isDerived.
	self deny: ((FamixFameMaterializer new changesFor: metamodel) anySatisfy: [ :change |
			 (change isKindOf: FmxMethodAddition) and: [
				 change className = #FamixTWithComments and: [ change selector = #numberOfComments ] ] ])
]
