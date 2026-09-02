"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'MooseMSEImporterTestTEntityCreator',
	#category : 'Moose-Core-Tests-Entities-Model',
	#package : 'Moose-Core-Tests-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
MooseMSEImporterTestTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestAttribute new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (MooseMSEImporterTestAttribute named: aName)
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestClass new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (MooseMSEImporterTestClass named: aName)
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestComment new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestEntityTyping new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newInheritance [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestInheritance new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestMethod new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (MooseMSEImporterTestMethod named: aName)
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newNamespace [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestNamespace new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newNamespaceNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (MooseMSEImporterTestNamespace named: aName)
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPackage [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestPackage new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPackageNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (MooseMSEImporterTestPackage named: aName)
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPrimitiveType [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestPrimitiveType new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPrimitiveTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (MooseMSEImporterTestPrimitiveType named: aName)
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestSourceLanguage new
]

{ #category : 'entity creation' }
MooseMSEImporterTestTEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: MooseMSEImporterTestSourceTextAnchor new
]
