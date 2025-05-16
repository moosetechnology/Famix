"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #MooseMSEImporterTestTEntityCreator,
	#category : #'Moose-Core-Tests-Entities-Model'
}

{ #category : #meta }
MooseMSEImporterTestTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newAttribute [

	<generated>
	^ self add: MooseMSEImporterTestAttribute new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newAttributeNamed: aName [

	<generated>
	^ self add: (MooseMSEImporterTestAttribute named: aName)
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newClass [

	<generated>
	^ self add: MooseMSEImporterTestClass new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (MooseMSEImporterTestClass named: aName)
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newComment [

	<generated>
	^ self add: MooseMSEImporterTestComment new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newEntityTyping [

	<generated>
	^ self add: MooseMSEImporterTestEntityTyping new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newInheritance [

	<generated>
	^ self add: MooseMSEImporterTestInheritance new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newMethod [

	<generated>
	^ self add: MooseMSEImporterTestMethod new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (MooseMSEImporterTestMethod named: aName)
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newNamespace [

	<generated>
	^ self add: MooseMSEImporterTestNamespace new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newNamespaceNamed: aName [

	<generated>
	^ self add: (MooseMSEImporterTestNamespace named: aName)
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPackage [

	<generated>
	^ self add: MooseMSEImporterTestPackage new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPackageNamed: aName [

	<generated>
	^ self add: (MooseMSEImporterTestPackage named: aName)
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPrimitiveType [

	<generated>
	^ self add: MooseMSEImporterTestPrimitiveType new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPrimitiveTypeNamed: aName [

	<generated>
	^ self add: (MooseMSEImporterTestPrimitiveType named: aName)
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: MooseMSEImporterTestSourceLanguage new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: MooseMSEImporterTestSourceTextAnchor new
]
