"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
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
FamixJavaTEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixJavaAttribute new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newClass [

	<generated>
	^ self add: FamixJavaClass new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newComment [

	<generated>
	^ self add: FamixJavaComment new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newEnum [

	<generated>
	^ self add: FamixJavaEnum new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newEnumValue [

	<generated>
	^ self add: FamixJavaEnumValue new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newException [

	<generated>
	^ self add: FamixJavaException new
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
FamixJavaTEntityCreator >> newMethod [

	<generated>
	^ self add: FamixJavaMethod new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newModel [

	<generated>
	^ self add: FamixJavaModel new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newPackage [

	<generated>
	^ self add: FamixJavaPackage new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameter [

	<generated>
	^ self add: FamixJavaParameter new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterType [

	<generated>
	^ self add: FamixJavaParameterType new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterizableClass [

	<generated>
	^ self add: FamixJavaParameterizableClass new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterizableException [

	<generated>
	^ self add: FamixJavaParameterizableException new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterizableInterface [

	<generated>
	^ self add: FamixJavaParameterizableInterface new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newParameterizedType [

	<generated>
	^ self add: FamixJavaParameterizedType new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newPrimitiveType [

	<generated>
	^ self add: FamixJavaPrimitiveType new
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
FamixJavaTEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixJavaUnknownSourceLanguage new
]

{ #category : #'entity creation' }
FamixJavaTEntityCreator >> newUnknownVariable [

	<generated>
	^ self add: FamixJavaUnknownVariable new
]
