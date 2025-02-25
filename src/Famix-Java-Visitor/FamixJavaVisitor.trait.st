Trait {
	#name : #FamixJavaVisitor,
	#traits : 'FamixTTraitVisitor',
	#classTraits : 'FamixTTraitVisitor classTrait',
	#category : #'Famix-Java-Visitor-Trait'
}

{ #category : #meta }
FamixJavaVisitor classSide >> annotation [

	<FMClass: #Visitor super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visiting }
FamixJavaVisitor >> visitCollection: aCollection [

	<generated>
	^ aCollection collect: [ :each | each accept: self ]
]

{ #category : #visiting }
FamixJavaVisitor >> visitEntity: aFamixEntity [

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaAccess: aFamixJavaAccess [

	<generated>
	self visitFamixTAccess: aFamixJavaAccess
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaAnnotationInstance: aFamixJavaAnnotationInstance [

	<generated>
	self visitFamixTAnnotationInstance: aFamixJavaAnnotationInstance.
	self visitFamixTTypedAnnotationInstance: aFamixJavaAnnotationInstance.
	self visitFamixTWithAnnotationInstanceAttributes: aFamixJavaAnnotationInstance.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstance
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute [

	<generated>
	self visitFamixTAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute.
	self visitFamixTTypedAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstanceAttribute
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaAnnotationType: aFamixJavaAnnotationType [

	<generated>
	self visitFamixTAnnotationType: aFamixJavaAnnotationType.
	self visitFamixTHasVisibility: aFamixJavaAnnotationType.
	self visitFamixTImplementable: aFamixJavaAnnotationType.
	self visitFamixTPackageable: aFamixJavaAnnotationType.
	self visitFamixTWithAttributes: aFamixJavaAnnotationType.
	self visitFamixTWithComments: aFamixJavaAnnotationType.
	self visitFamixTWithInheritances: aFamixJavaAnnotationType.
	self visitFamixJavaType: aFamixJavaAnnotationType
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute [

	<generated>
	self visitFamixTAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute.
	self visitFamixTTypedAnnotationInstanceAttribute: aFamixJavaAnnotationTypeAttribute.
	self visitFamixTWithComments: aFamixJavaAnnotationTypeAttribute.
	self visitFamixJavaVariable: aFamixJavaAnnotationTypeAttribute
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaAttribute: aFamixJavaAttribute [

	<generated>
	self visitFamixTAttribute: aFamixJavaAttribute.
	self visitFamixTCanBeClassSide: aFamixJavaAttribute.
	self visitFamixTCanBeFinal: aFamixJavaAttribute.
	self visitFamixJavaTCanBeTransient: aFamixJavaAttribute.
	self visitFamixJavaTCanBeVolatile: aFamixJavaAttribute.
	self visitFamixTHasVisibility: aFamixJavaAttribute.
	self visitFamixTWithComments: aFamixJavaAttribute.
	self visitFamixJavaVariable: aFamixJavaAttribute
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaClass: aFamixJavaClass [

	<generated>
	self visitFamixTCanBeAbstract: aFamixJavaClass.
	self visitFamixTCanBeClassSide: aFamixJavaClass.
	self visitFamixTCanBeFinal: aFamixJavaClass.
	self visitFamixTCanImplement: aFamixJavaClass.
	self visitFamixTClass: aFamixJavaClass.
	self visitFamixTClassMetrics: aFamixJavaClass.
	self visitFamixJavaTClassMetrics: aFamixJavaClass.
	self visitFamixTHasVisibility: aFamixJavaClass.
	self visitFamixTImportable: aFamixJavaClass.
	self visitFamixTLCOMMetrics: aFamixJavaClass.
	self visitFamixTPackageable: aFamixJavaClass.
	self visitFamixTWithImports: aFamixJavaClass.
	self visitFamixJavaType: aFamixJavaClass
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaComment: aFamixJavaComment [

	<generated>
	self visitFamixTComment: aFamixJavaComment.
	self visitFamixJavaSourcedEntity: aFamixJavaComment
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaConcretization: aFamixJavaConcretization [

	<generated>
	self visitFamixTConcretization: aFamixJavaConcretization
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaContainerEntity: aFamixJavaContainerEntity [

	<generated>
	self visitFamixTWithAnnotationTypes: aFamixJavaContainerEntity.
	self visitFamixTWithClasses: aFamixJavaContainerEntity.
	self visitFamixJavaTWithInterfaces: aFamixJavaContainerEntity.
	self visitFamixJavaNamedEntity: aFamixJavaContainerEntity
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaEntity: aFamixJavaEntity [

	<generated>

]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaEnum: aFamixJavaEnum [

	<generated>
	self visitFamixTEnum: aFamixJavaEnum.
	self visitFamixTHasVisibility: aFamixJavaEnum.
	self visitFamixTImportable: aFamixJavaEnum.
	self visitFamixTWithAttributes: aFamixJavaEnum.
	self visitFamixTWithComments: aFamixJavaEnum.
	self visitFamixTWithImports: aFamixJavaEnum.
	self visitFamixTWithInheritances: aFamixJavaEnum.
	self visitFamixTWithMethods: aFamixJavaEnum.
	self visitFamixJavaType: aFamixJavaEnum
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaEnumValue: aFamixJavaEnumValue [

	<generated>
	self visitFamixTEnumValue: aFamixJavaEnumValue.
	self visitFamixTWithComments: aFamixJavaEnumValue.
	self visitFamixJavaVariable: aFamixJavaEnumValue
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaException: aFamixJavaException [

	<generated>
	self visitFamixTCanImplement: aFamixJavaException.
	self visitFamixTException: aFamixJavaException.
	self visitFamixTHasVisibility: aFamixJavaException.
	self visitFamixTWithAnnotationInstances: aFamixJavaException.
	self visitFamixTWithTypes: aFamixJavaException.
	self visitFamixJavaClass: aFamixJavaException
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaImplementation: aFamixJavaImplementation [

	<generated>
	self visitFamixTImplementation: aFamixJavaImplementation
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaImplicitVariable: aFamixJavaImplicitVariable [

	<generated>
	self visitFamixTImplicitVariable: aFamixJavaImplicitVariable.
	self visitFamixJavaVariable: aFamixJavaImplicitVariable
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaImport: aFamixJavaImport [

	<generated>
	self visitFamixTImport: aFamixJavaImport
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaIndexedFileAnchor: aFamixJavaIndexedFileAnchor [

	<generated>
	self visitFamixTIndexedFileNavigation: aFamixJavaIndexedFileAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaIndexedFileAnchor
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaInheritance: aFamixJavaInheritance [

	<generated>
	self visitFamixTInheritance: aFamixJavaInheritance
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaInterface: aFamixJavaInterface [

	<generated>
	self visitFamixTCanBeClassSide: aFamixJavaInterface.
	self visitFamixTCanBeFinal: aFamixJavaInterface.
	self visitFamixTHasVisibility: aFamixJavaInterface.
	self visitFamixTImplementable: aFamixJavaInterface.
	self visitFamixTImportable: aFamixJavaInterface.
	self visitFamixTInvocationsReceiver: aFamixJavaInterface.
	self visitFamixTPackageable: aFamixJavaInterface.
	self visitFamixTWithAttributes: aFamixJavaInterface.
	self visitFamixTWithComments: aFamixJavaInterface.
	self visitFamixTWithImports: aFamixJavaInterface.
	self visitFamixTWithInheritances: aFamixJavaInterface.
	self visitFamixTWithMethods: aFamixJavaInterface.
	self visitFamixJavaType: aFamixJavaInterface
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaInvocation: aFamixJavaInvocation [

	<generated>
	self visitFamixTInvocation: aFamixJavaInvocation
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaLocalVariable: aFamixJavaLocalVariable [

	<generated>
	self visitFamixTCanBeFinal: aFamixJavaLocalVariable.
	self visitFamixTLocalVariable: aFamixJavaLocalVariable.
	self visitFamixTWithComments: aFamixJavaLocalVariable.
	self visitFamixJavaVariable: aFamixJavaLocalVariable
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaMethod: aFamixJavaMethod [

	<generated>
	self visitFamixTCanBeAbstract: aFamixJavaMethod.
	self visitFamixTCanBeClassSide: aFamixJavaMethod.
	self visitFamixTCanBeFinal: aFamixJavaMethod.
	self visitFamixJavaTCanBeSynchronized: aFamixJavaMethod.
	self visitFamixTHasKind: aFamixJavaMethod.
	self visitFamixTHasVisibility: aFamixJavaMethod.
	self visitFamixTImportable: aFamixJavaMethod.
	self visitFamixTMethod: aFamixJavaMethod.
	self visitFamixTWithComments: aFamixJavaMethod.
	self visitFamixTWithExceptions: aFamixJavaMethod.
	self visitFamixJavaContainerEntity: aFamixJavaMethod
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaNamedEntity: aFamixJavaNamedEntity [

	<generated>
	self visitTEntityMetaLevelDependency: aFamixJavaNamedEntity.
	self visitFamixTNamedEntity: aFamixJavaNamedEntity.
	self visitFamixTWithAnnotationInstances: aFamixJavaNamedEntity.
	self visitFamixJavaSourcedEntity: aFamixJavaNamedEntity
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaPackage: aFamixJavaPackage [

	<generated>
	self visitFamixTImportable: aFamixJavaPackage.
	self visitFamixTPackage: aFamixJavaPackage.
	self visitFamixTPackageable: aFamixJavaPackage.
	self visitFamixTWithComments: aFamixJavaPackage.
	self visitFamixJavaContainerEntity: aFamixJavaPackage
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaParameter: aFamixJavaParameter [

	<generated>
	self visitFamixTCanBeFinal: aFamixJavaParameter.
	self visitFamixTParameter: aFamixJavaParameter.
	self visitFamixTWithComments: aFamixJavaParameter.
	self visitFamixJavaVariable: aFamixJavaParameter
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaParameterConcretization: aFamixJavaParameterConcretization [

	<generated>
	self visitFamixTParameterConcretization: aFamixJavaParameterConcretization
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaParameterType: aFamixJavaParameterType [

	<generated>
	self visitFamixTGenericParameterType: aFamixJavaParameterType.
	self visitFamixTThrowable: aFamixJavaParameterType.
	self visitFamixTTypedEntity: aFamixJavaParameterType.
	self visitFamixTWithInheritances: aFamixJavaParameterType.
	self visitFamixJavaType: aFamixJavaParameterType
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaParametricClass: aFamixJavaParametricClass [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricClass.
	self visitFamixJavaClass: aFamixJavaParametricClass
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaParametricInterface: aFamixJavaParametricInterface [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricInterface.
	self visitFamixJavaInterface: aFamixJavaParametricInterface
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaParametricMethod: aFamixJavaParametricMethod [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricMethod.
	self visitFamixJavaMethod: aFamixJavaParametricMethod
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaPrimitiveType: aFamixJavaPrimitiveType [

	<generated>
	self visitFamixTPrimitiveType: aFamixJavaPrimitiveType.
	self visitFamixJavaType: aFamixJavaPrimitiveType
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaReference: aFamixJavaReference [

	<generated>
	self visitFamixTReference: aFamixJavaReference
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaSourceAnchor: aFamixJavaSourceAnchor [

	<generated>
	self visitFamixTSourceAnchor: aFamixJavaSourceAnchor
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaSourceLanguage: aFamixJavaSourceLanguage [

	<generated>
	self visitFamixTSourceLanguage: aFamixJavaSourceLanguage
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaSourceTextAnchor: aFamixJavaSourceTextAnchor [

	<generated>
	self visitFamixTHasImmediateSource: aFamixJavaSourceTextAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaSourceTextAnchor
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaSourcedEntity: aFamixJavaSourcedEntity [

	<generated>
	self visitFamixTSourceEntity: aFamixJavaSourcedEntity
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaTBound: aFamixJavaTBound [

	<generated>
	self visitTrait: aFamixJavaTBound	self visitCollection: aFamixJavaTBound lowerBoundedWildcards.
	self visitCollection: aFamixJavaTBound upperBoundedWildcards
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaTBounded: aFamixJavaTBounded [

	<generated>
	self visitTrait: aFamixJavaTBounded	self visitEntity: aFamixJavaTBounded lowerBound.
	self visitEntity: aFamixJavaTBounded upperBound
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaTCanBeSynchronized: aFamixJavaTCanBeSynchronized [

	<generated>
	self visitTrait: aFamixJavaTCanBeSynchronized
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaTCanBeTransient: aFamixJavaTCanBeTransient [

	<generated>
	self visitTrait: aFamixJavaTCanBeTransient
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaTCanBeVolatile: aFamixJavaTCanBeVolatile [

	<generated>
	self visitTrait: aFamixJavaTCanBeVolatile
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaTClassMetrics: aFamixJavaTClassMetrics [

	<generated>
	self visitTrait: aFamixJavaTClassMetrics
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaTWithInterfaces: aFamixJavaTWithInterfaces [

	<generated>
	self visitFamixTWithTypes: aFamixJavaTWithInterfaces.
	self visitTrait: aFamixJavaTWithInterfaces
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaType: aFamixJavaType [

	<generated>
	self visitFamixJavaTBound: aFamixJavaType.
	self visitFamixTConcreteParameterType: aFamixJavaType.
	self visitFamixTWithMethods: aFamixJavaType.
	self visitFamixJavaContainerEntity: aFamixJavaType
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaUnknownVariable: aFamixJavaUnknownVariable [

	<generated>
	self visitFamixTUnknownVariable: aFamixJavaUnknownVariable.
	self visitFamixJavaVariable: aFamixJavaUnknownVariable
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaVariable: aFamixJavaVariable [

	<generated>
	self visitFamixTInvocationsReceiver: aFamixJavaVariable.
	self visitFamixJavaNamedEntity: aFamixJavaVariable
]

{ #category : #'as yet unclassified' }
FamixJavaVisitor >> visitFamixJavaWildcard: aFamixJavaWildcard [

	<generated>
	self visitFamixJavaTBounded: aFamixJavaWildcard.
	self visitFamixJavaType: aFamixJavaWildcard
]
