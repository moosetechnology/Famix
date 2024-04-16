Class {
	#name : #MoosePharoImporterTaskOnLANTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #'testing collecting classes' }
MoosePharoImporterTaskOnLANTest >> numberOfClassesIn: packageNames [

	^ ((self packageOrganizer packages select: [ :package | packageNames anySatisfy: [ :packageName | packageName match: package name ] ]) flatCollect: [ :package |
		   package definedClasses ]) size
]

{ #category : #'testing collecting classes' }
MoosePharoImporterTaskOnLANTest >> testFromPackageNamed [

	self assert: ((FamixStPharoImporterTask new addFromPackageNamed: #'Moose-TestResources-LAN') classes includes: LANNode)
]

{ #category : #'testing collecting classes' }
MoosePharoImporterTaskOnLANTest >> testFromPackagesMatching [

	self assert: ((FamixStPharoImporterTask new addFromPackagesMatching: [ :each | each name = #'Moose-TestResources-LAN' ]) classes includes: LANNode)
]

{ #category : #'testing collecting classes' }
MoosePharoImporterTaskOnLANTest >> testFromPackagesMatching2 [

	self
		assert: (FamixStPharoImporterTask new addFromPackagesMatching: [ :each | 'Moose-TestResources-LA*' match: each name asString ]) classes size
		equals: (self numberOfClassesIn: #( 'Moose-TestResources-LA*' ))
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddCategory [

	| model |
	FamixStPharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: FamixStImporterContext new importClass;
		addFromPackage: (self packageOrganizer packageNamed: #'Moose-TestResources-LAN');
		run.
	self assert: model allClasses size equals: (self numberOfClassesIn: #( 'Moose-TestResources-LAN' )) * 2
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddClass [

	| model |
	FamixStPharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: FamixStImporterContext new importClass;
		addClass: LANNode;
		run.
	self assert: model allClasses size equals: LANNode subclasses size + 1 * 2
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddPackage [

	| model |
	FamixStPharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: FamixStImporterContext new importClass;
		addFromPackage: (self packageOrganizer packageNamed: #'Moose-TestResources-LAN');
		run.
	self assert: model allClasses size equals: 2 * (self packageOrganizer packageNamed: #'Moose-TestResources-LAN') definedClasses size
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddPackageNamed [

	| model |
	FamixStPharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: FamixStImporterContext new importClass;
		addFromPackageNamed: 'Moose-TestResources-LAN';
		run.
	self assert: model allClasses size equals: 2 * (self packageOrganizer packageNamed: #'Moose-TestResources-LAN') definedClasses size
]
