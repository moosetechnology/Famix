"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixJavaTEntityCreator',
	#category : 'Famix-Java-Entities-Model',
	#package : 'Famix-Java-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixJavaTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaAccess new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaAnnotationInstance new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaAnnotationInstanceAttribute new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAnnotationType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaAnnotationType new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaAnnotationTypeAttribute new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAnnotationTypeAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaAnnotationTypeAttribute named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAnnotationTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaAnnotationType named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaAttribute new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaAttribute named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaClass new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaClass named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaComment new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newConcretization [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaConcretization new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaEntityTyping new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newEnum [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaEnum new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newEnumNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaEnum named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newEnumValue [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaEnumValue new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newEnumValueNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaEnumValue named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newException [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaException new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newExceptionNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaException named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newImplementation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaImplementation new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newImplicitVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaImplicitVariable new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newImplicitVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaImplicitVariable named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newImport [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaImport new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaIndexedFileAnchor new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newInheritance [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaInheritance new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newInitializer [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaInitializer new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newInitializerNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaInitializer named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newInterface [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaInterface new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newInterfaceNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaInterface named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newInvocation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaInvocation new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaLocalVariable new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newLocalVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaLocalVariable named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaMethod new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaMethod named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newPackage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaPackage new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newPackageNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaPackage named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParameter [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParameter new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParameterNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaParameter named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricClass new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaParametricClass named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricEntityTyping new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricImplementation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricImplementation new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricInheritance [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricInheritance new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricInterface [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricInterface new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricInterfaceNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaParametricInterface named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricInvocation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricInvocation new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricMethod new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaParametricMethod named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newParametricReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaParametricReference new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newPrimitiveType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaPrimitiveType new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newPrimitiveTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaPrimitiveType named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaReference new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaSourceLanguage new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaSourceTextAnchor new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaType new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaType named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newTypeParameter [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaTypeParameter new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newTypeParameterNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaTypeParameter named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newUnknownVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaUnknownVariable new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newUnknownVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaUnknownVariable named: aName)
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newWildcard [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixJavaWildcard new
]

{ #category : 'entity creation' }
FamixJavaTEntityCreator >> newWildcardNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixJavaWildcard named: aName)
]
