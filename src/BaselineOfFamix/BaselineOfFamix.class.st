"
Description
--------------------

Baseline for the Famix project
"
Class {
	#name : #BaselineOfFamix,
	#superclass : #BaselineOf,
	#instVars : [
		'repository'
	],
	#category : #BaselineOfFamix
}

{ #category : #baseline }
BaselineOfFamix >> baseline: spec [

	<baseline>
	repository := self packageRepositoryURL.

	spec for: #common do: [ 
		self dependencies: spec.
		self packages: spec.
		self groups: spec ]
]

{ #category : #dependencies }
BaselineOfFamix >> collectionExtensions: spec [
	spec
		baseline: 'CollectionExtensions'
		with: [ spec
				loads: 'Core';
				repository: 'github://pharo-contributions/CollectionExtensions:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> deepTraverser: spec [
	spec
		baseline: 'DeepTraverser'
		with: [ spec
				loads: 'Core';
				repository: 'github://pharo-contributions/DeepTraverser:v1.x.x/src' ]
]

{ #category : #baseline }
BaselineOfFamix >> dependencies: spec [

	self
		deepTraverser: spec;
		kgbTestResources: spec;
		collectionExtensions: spec;
		packageBlueprintTestResources: spec;
		referenceTestResources: spec;
		roelTyper: spec;
		singularizePluralize: spec;
		talents: spec.
	self fame: spec
]

{ #category : #baseline }
BaselineOfFamix >> fame: spec [

	"We load Fame development version for new Moose images."
	"For retrocompatibility with Pharo 9 and older, the latest version is v1.1.6"

	| version |
	version := 'development'.
	spec for: #( #'pharo8.x' #'pharo9.x' ) do: [ version := 'v1.1.6' ].

	spec baseline: 'Fame' with: [ 
		spec repository:
			('github://moosetechnology/Fame:{1}/src' format: { version }) ]
]

{ #category : #baseline }
BaselineOfFamix >> groups: spec [

	^ spec
		  group: 'Core' with: #( 'Famix-Traits' 'Moose-Query-Extensions' );
		  group: 'Minimal' with: #( 'Moose-Core' );
		  group: 'Basic'
		  with: #( 'Famix-BasicInfrastructure' 'Famix-MetamodelGeneration' 'Moose-Core-Generator' );
		  group: 'TestsResources'
		  with: #( 'ReferenceTestResources' 'Moose-TestResources-LAN'
			     'Moose-TestResources-LCOM' 'KGBTestResources'
			     'PackageBlueprintTestResources' );
		  group: 'BasicTraits' with: #( 'Famix-Traits' );
		  group: 'EntitiesJava' with: #( 'Famix-Java-Entities' );
		  group: 'EntitiesJavaWithVisitor'
		  with: #( 'EntitiesJava' 'Famix-Java-Visitor' );
		  group: 'ModelJava'
		  with: #( 'Famix-Java-Generator' 'EntitiesJava' );
		  group: 'EntitiesSmalltalk'
		  with: #( 'Famix-PharoSmalltalk-Entities' );
		  group: 'ModelSmalltalk'
		  with: #( 'Famix-PharoSmalltalk-Generator'
			     'EntitiesSmalltalk' );
		  group: 'Importers'
		  with: #( 'Moose-GenericImporter' 'Moose-SmalltalkImporter' );
		  group: 'TestModels'
		  with: #( 'Famix-Test1-Entities' 'Famix-Test2-Entities'
			     'Famix-Test3-Entities' 'Famix-Test4-Entities' 'Famix-Test7-Entities' );
		
		  group: 'Tests'
		  with: #( 'Famix-Tests' 'Moose-Query-Test' 'Moose-Core-Tests'
			     'Famix-Smalltalk-Utils-Tests' 'Moose-SmalltalkImporter-LAN-Tests'
			     'Moose-SmalltalkImporter-Core-Tests'
			     'Moose-SmalltalkImporter-KGB-Tests'
			     'Famix-Java-Tests' 'Famix-VerveineJ-Tests'
			     'Famix-PharoSmalltalk-Tests' 'Famix-TestGenerators'
			     'Famix-MetamodelBuilder-Tests' 'Famix-Test1-Tests'
			     'Famix-Test2-Tests' 'Famix-Test3-Tests' 'Famix-Test4-Tests' 'Famix-Test7-Tests'
			     'Famix-TestComposedSubmetamodel1-Entities'
			     'Famix-TestComposedSubmetamodel2-Entities'
			     'Famix-TestComposedMetamodel-Entities'
			     'Famix-TestComposedMetamodel' 'Famix-TestComposedComposedMetamodel-Entities'
			     'Famix-TestComposed3Metamodel-Entities'
			     'Moose-GenericImporters-Tests' )
]

{ #category : #dependencies }
BaselineOfFamix >> kgbTestResources: spec [
	spec baseline: 'KGBTestResources' with: [ spec repository: 'github://moosetechnology/KGBTestResources:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> packageBlueprintTestResources: spec [
	spec baseline: 'PackageBlueprintTestResources' with: [ spec repository: 'github://moosetechnology/PackageBlueprintTestResources:v1.x.x/src' ]
]

{ #category : #accessing }
BaselineOfFamix >> packageRepositoryURL [

	^ super packageRepositoryURL ifEmpty: [ 
		  | packageName |
		  packageName := self class package name.
		  'tonel://' , (IceRepository registry
			   detect: [ :repo | 
			   repo workingCopy packageNames includes: packageName ]
			   ifFound: [ :repo | 
			   repo location pathString , '/' , repo subdirectory ]
			   ifNone: [ '' ]) ]
]

{ #category : #baseline }
BaselineOfFamix >> packages: spec [

	spec
		package: 'Moose-Query'
		with: [
			spec requires: #( 'Fame' 'DeepTraverser' 'CollectionExtensions' ) ];
		package: 'Moose-Core'
		with: [ spec requires: #( 'Fame' 'Moose-Query' ) ];
		package: 'Moose-Core-Generator'
		with: [ spec requires: #( 'Famix-MetamodelBuilder-Core' ) ];
		package: 'Moose-Query-Extensions'
		with: [ spec requires: #( 'Moose-Query' 'BasicTraits' ) ];
		package: 'Famix-Traits' with: [ spec requires: #( 'Moose-Core' ) ];
		package: 'Famix-MetamodelBuilder-Core'
		with: [ spec requires: #( 'Moose-Core' 'SingularizePluralize' ) ];
		package: 'Famix-MetamodelGeneration'
		with: [ spec requires: #( 'Famix-MetamodelBuilder-Core' ) ];
		package: 'Famix-BasicInfrastructure'
		with: [ spec requires: #( 'Famix-MetamodelGeneration' ) ];
		package: 'Famix-Smalltalk-Utils'
		with: [ spec requires: #( 'Moose-Core' ) ];
		package: 'Moose-GenericImporter'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Moose-SmalltalkImporter' with: [
			spec requires:
					#( 'Moose-GenericImporter' 'RoelTyper' 'Famix-PharoSmalltalk-Entities' ) ];
		package: 'Famix-VerveineJ-Tests'
		with: [
			spec requires: #( 'Moose-Core-Tests' 'Famix-Java-Entities' ) ];
		package: 'Famix-PharoSmalltalk-Generator'
		with: [ spec requires: #( 'Basic' ) ];
		package: 'Famix-PharoSmalltalk-Entities'
		with: [ spec requires: #( 'Famix-Smalltalk-Utils'
				   'BasicTraits' ) ];
		package: 'Famix-PharoSmalltalk-Tests' with: [
			spec requires:
					#( 'Famix-PharoSmalltalk-Entities'
					   'Moose-SmalltalkImporter-Core-Tests'
					   'PackageBlueprintTestResources'
					   'Moose-TestResources-LCOM' 'KGBTestResources' ) ];
		package: 'Famix-Java-Generator'
		with: [ spec requires: #( 'Basic' ) ];
		package: 'Famix-Java-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Java-Visitor'
		with: [ spec requires: #( 'Famix-Java-Entities' ) ];
		package: 'Famix-Java-Tests'
		with: [
			spec requires: #( 'Famix-Java-Entities' 'Famix-Java-Generator' ) ];
		package: 'Moose-TestResources-LAN';
		package: 'Moose-TestResources-LCOM';
		package: 'Moose-Query-Test'
		with: [ spec requires: #( 'Moose-Query' 'Famix-Java-Entities' ) ];
		package: 'FamixTestGenerator'
		with: [ spec requires: #( 'Famix-Tests' 'Fame' ) ];
		package: 'Famix-Tests'
		with: [ spec requires: #( 'BasicTraits' 'Talents' ) ];
		package: 'Moose-Core-Tests'
		with: [
			spec requires: #( 'TestModels' 'Moose-Core-Tests-Entities' ) ];
		package: 'Moose-Core-Tests-Entities'
		with: [ spec requires: #( 'Moose-Core' 'BasicTraits' ) ];
		package: 'Moose-GenericImporters-Tests'
		with: [
			spec requires: #( 'Moose-GenericImporter' 'Famix-Test1-Entities' ) ];
		package: 'Famix-Smalltalk-Utils-Tests' with: [
			spec requires:
					#( 'Famix-Smalltalk-Utils' 'ReferenceTestResources' ) ];
		package: 'Moose-SmalltalkImporter-Core-Tests' with: [
			spec requires: #( 'Moose-Core-Tests' 'Moose-SmalltalkImporter'
					   'ReferenceTestResources' ) ];
		package: 'Moose-SmalltalkImporter-LAN-Tests' with: [
			spec requires: #( 'Moose-SmalltalkImporter-Core-Tests'
					   'Moose-TestResources-LAN' ) ];
		package: 'Moose-SmalltalkImporter-KGB-Tests' with: [
			spec requires:
					#( 'KGBTestResources' 'Moose-SmalltalkImporter-Core-Tests' ) ];
		package: 'Famix-TestGenerators'
		with: [ spec requires: #( 'Basic' ) ];
		package: 'Famix-MetamodelBuilder-Tests' with: [
			spec requires:
					#( 'Famix-TestGenerators' 'Famix-MetamodelBuilder-TestsTraitsResources-A'
					   'Famix-MetamodelBuilder-TestsTraitsResources-B'
					   'Famix-Test1-Entities' ) ];
		package: 'Famix-MetamodelBuilder-TestsTraitsResources-A'
		with: [ spec requires: #( 'Basic' ) ];
		package: 'Famix-MetamodelBuilder-TestsTraitsResources-B' with: [
			spec requires:
					#( 'Basic' 'Famix-MetamodelBuilder-TestsTraitsResources-A' ) ];
		package: 'Famix-Test1-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Test1-Tests'
		with: [ spec requires: #( 'Famix-Test1-Entities' ) ];
		package: 'Famix-Test2-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Test2-Tests'
		with: [ spec requires: #( 'Famix-Test2-Entities' ) ];
		package: 'Famix-Test3-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Test3-Tests'
		with: [ spec requires: #( 'Famix-Test3-Entities' ) ];
		package: 'Famix-Test4-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Test4-Tests'
		with: [ spec requires: #( 'Famix-Test4-Entities' ) ];
		package: 'Famix-Test5-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Test5-Tests'
		with: [ spec requires: #( 'Famix-Test5-Entities' ) ];
		package: 'Famix-Test6-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Test6-Tests'
		with: [ spec requires: #( 'Famix-Test6-Entities' ) ];
		package: 'Famix-Test7-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-Test7-Tests'
		with: [ spec requires: #( 'Famix-Test7-Entities' ) ];
		package: 'Famix-TestComposedSubmetamodel1-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-TestComposedSubmetamodel2-Entities'
		with: [ spec requires: #( 'BasicTraits' ) ];
		package: 'Famix-TestComposedMetamodel-Entities' with: [
			spec requires:
					#( 'Famix-Test2-Entities' 'Famix-TestComposedSubmetamodel1-Entities'
					   'Famix-TestComposedSubmetamodel2-Entities' ) ];
		package: 'Famix-TestComposedComposedMetamodel-Entities'
		with: [ spec requires: #( 'Famix-TestComposedMetamodel-Entities' ) ];
		package: 'Famix-TestComposed3Metamodel-Entities'
		with: [ spec requires: #( 'Famix-TestComposedMetamodel-Entities' ) ];
		package: 'Famix-TestComposedMetamodel'
		with: [ spec requires: #( 'Famix-TestComposedMetamodel-Entities' ) ];
		package: 'Famix-Deprecated'
		with: [
			spec requires: #( 'Core' 'ModelJava' 'ModelSmalltalk'
				   'Tests' ) ];
		package: 'Famix-MetamodelDocumentor' with: [
			spec requires:
					#( 'Core' 'TestModels' 'Famix-TestModel1MetamodelDocumentor' ) ];
		package: 'Famix-TestModel1MetamodelDocumentor'
		with: [ spec requires: #( 'Core' ) ]
]

{ #category : #accessing }
BaselineOfFamix >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfFamix >> referenceTestResources: spec [
	spec baseline: 'ReferenceTestResources' with: [ spec repository: 'github://moosetechnology/ReferenceTestResources:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> roelTyper: spec [
	spec baseline: 'RoelTyper' with: [ spec repository: 'github://RMODINRIA/RoelTyper:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> singularizePluralize: spec [

	spec baseline: 'SingularizePluralize' with: [ 
		spec repository:
			'github://pharo-contributions/SingularizePluralize:v1.1/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> talents: spec [

	spec baseline: 'Talents' with: [
		spec
			loads: 'core';
			repository: 'github://pharo-contributions/pharo-talents/src' ]
]
