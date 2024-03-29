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

	self assert: ((MoosePharoImporterTask new addFromPackageNamed: #'Moose-TestResources-LAN') allClasses includes: LANNode)
]

{ #category : #'testing collecting classes' }
MoosePharoImporterTaskOnLANTest >> testFromPackagesMatching [

	self assert: ((MoosePharoImporterTask new addFromPackagesMatching: [ :each | each name = #'Moose-TestResources-LAN' ]) allClasses includes: LANNode)
]

{ #category : #'testing collecting classes' }
MoosePharoImporterTaskOnLANTest >> testFromPackagesMatching2 [

	self
		assert: (MoosePharoImporterTask new addFromPackagesMatching: [ :each | 'Moose-TestResources-LA*' match: each name asString ]) allClasses size
		equals: (self numberOfClassesIn: #( 'Moose-TestResources-LA*' ))
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddCategory [

	| model |
	MoosePharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: MooseImportingContext new importClass;
		addFromPackage: (self packageOrganizer packageNamed: #'Moose-TestResources-LAN');
		run.
	self assert: model allClasses size equals: (self numberOfClassesIn: #( 'Moose-TestResources-LAN' )) * 2
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddClass [

	| model |
	MoosePharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: MooseImportingContext new importClass;
		addClass: LANNode;
		run.
	self assert: model allClasses size equals: LANNode subclasses size + 1 * 2
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddPackage [

	| model |
	MoosePharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: MooseImportingContext new importClass;
		addFromPackage: (self packageOrganizer packageNamed: #'Moose-TestResources-LAN');
		run.
	self assert: model allClasses size equals: 2 * (self packageOrganizer packageNamed: #'Moose-TestResources-LAN') definedClasses size
]

{ #category : #'test importing' }
MoosePharoImporterTaskOnLANTest >> testImportClassUsingAddPackageNamed [

	| model |
	MoosePharoImporterTask new
		model: (model := FamixStModel new);
		importingContext: MooseImportingContext new importClass;
		addFromPackageNamed: 'Moose-TestResources-LAN';
		run.
	self assert: model allClasses size equals: 2 * (self packageOrganizer packageNamed: #'Moose-TestResources-LAN') definedClasses size
]
