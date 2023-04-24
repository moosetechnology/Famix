"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
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
MooseMSEImporterTestTEntityCreator >> newClass [

	<generated>
	^ self add: MooseMSEImporterTestClass new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newComment [

	<generated>
	^ self add: MooseMSEImporterTestComment new
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
MooseMSEImporterTestTEntityCreator >> newModel [

	<generated>
	^ self add: MooseMSEImporterTestModel new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newNamespace [

	<generated>
	^ self add: MooseMSEImporterTestNamespace new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPackage [

	<generated>
	^ self add: MooseMSEImporterTestPackage new
]

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newPrimitiveType [

	<generated>
	^ self add: MooseMSEImporterTestPrimitiveType new
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

{ #category : #'entity creation' }
MooseMSEImporterTestTEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: MooseMSEImporterTestUnknownSourceLanguage new
]
