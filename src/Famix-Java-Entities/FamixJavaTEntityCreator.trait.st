"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixJavaTEntityCreator,
	#category : #'Famix-Java-Entities-Model'
}

{ #category : #meta }
FamixJavaTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAccess [

	<generated>
	^ self add: FamixJavaAccess new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAnnotationInstance [

	<generated>
	^ self add: FamixJavaAnnotationInstance new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAnnotationInstanceAttribute [

	<generated>
	^ self add: FamixJavaAnnotationInstanceAttribute new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAnnotationType [

	<generated>
	^ self add: FamixJavaAnnotationType new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAnnotationTypeAttribute [

	<generated>
	^ self add: FamixJavaAnnotationTypeAttribute new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAnnotationTypeAttributeNamed: aName [

	<generated>
	^ self add: (FamixJavaAnnotationTypeAttribute named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixJavaAttribute new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newAttributeNamed: aName [

	<generated>
	^ self add: (FamixJavaAttribute named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newClass [

	<generated>
	^ self add: FamixJavaClass new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixJavaClass named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newComment [

	<generated>
	^ self add: FamixJavaComment new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newConcretisation [

	<generated>
	^ self add: FamixJavaConcretisation new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newEnum [

	<generated>
	^ self add: FamixJavaEnum new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newEnumNamed: aName [

	<generated>
	^ self add: (FamixJavaEnum named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newEnumValue [

	<generated>
	^ self add: FamixJavaEnumValue new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newEnumValueNamed: aName [

	<generated>
	^ self add: (FamixJavaEnumValue named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newException [

	<generated>
	^ self add: FamixJavaException new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newExceptionNamed: aName [

	<generated>
	^ self add: (FamixJavaException named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newImplementation [

	<generated>
	^ self add: FamixJavaImplementation new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newImplicitVariable [

	<generated>
	^ self add: FamixJavaImplicitVariable new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newImplicitVariableNamed: aName [

	<generated>
	^ self add: (FamixJavaImplicitVariable named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newImport [

	<generated>
	^ self add: FamixJavaImport new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newIndexedFileAnchor [

	<generated>
	^ self add: FamixJavaIndexedFileAnchor new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newInheritance [

	<generated>
	^ self add: FamixJavaInheritance new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newInterface [

	<generated>
	^ self add: FamixJavaInterface new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newInvocation [

	<generated>
	^ self add: FamixJavaInvocation new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newLocalVariable [

	<generated>
	^ self add: FamixJavaLocalVariable new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newLocalVariableNamed: aName [

	<generated>
	^ self add: (FamixJavaLocalVariable named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newMethod [

	<generated>
	^ self add: FamixJavaMethod new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixJavaMethod named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newPackage [

	<generated>
	^ self add: FamixJavaPackage new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newPackageNamed: aName [

	<generated>
	^ self add: (FamixJavaPackage named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameter [

	<generated>
	^ self add: FamixJavaParameter new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterConcretisation [

	<generated>
	^ self add: FamixJavaParameterConcretisation new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterNamed: aName [

	<generated>
	^ self add: (FamixJavaParameter named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterType [

	<generated>
	^ self add: FamixJavaParameterType new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterTypeNamed: aName [

	<generated>
	^ self add: (FamixJavaParameterType named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParametricClass [

	<generated>
	^ self add: FamixJavaParametricClass new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParametricInterface [

	<generated>
	^ self add: FamixJavaParametricInterface new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParametricMethod [

	<generated>
	^ self add: FamixJavaParametricMethod new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newPrimitiveType [

	<generated>
	^ self add: FamixJavaPrimitiveType new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newPrimitiveTypeNamed: aName [

	<generated>
	^ self add: (FamixJavaPrimitiveType named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newReference [

	<generated>
	^ self add: FamixJavaReference new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixJavaSourceLanguage new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixJavaSourceTextAnchor new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newType [

	<generated>
	^ self add: FamixJavaType new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newTypeNamed: aName [

	<generated>
	^ self add: (FamixJavaType named: aName)
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixJavaUnknownSourceLanguage new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newUnknownVariable [

	<generated>
	^ self add: FamixJavaUnknownVariable new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newUnknownVariableNamed: aName [

	<generated>
	^ self add: (FamixJavaUnknownVariable named: aName)
]
