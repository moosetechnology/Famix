"
I am a visitor for FamixJavaEntities. 
I am generated with the metamodel.
"
Trait {
	#name : #FamixJavaTVisitor,
	#traits : 'FamixTVisitor',
	#classTraits : 'FamixTVisitor classTrait',
	#category : #'Famix-Java-Visitor-Trait'
}

{ #category : #meta }
FamixJavaTVisitor classSide >> annotation [

	<FMClass: #TVisitor super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaAccess: aFamixJavaAccess [

	<generated>
	self visitFamixTAccess: aFamixJavaAccess
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaAnnotationInstance: aFamixJavaAnnotationInstance [

	<generated>
	self visitFamixTAnnotationInstance: aFamixJavaAnnotationInstance.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstance
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute [

	<generated>
	self visitFamixTAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstanceAttribute
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaAnnotationType: aFamixJavaAnnotationType [

	<generated>
	self visitFamixTAnnotationType: aFamixJavaAnnotationType.
	self visitFamixTHasVisibility: aFamixJavaAnnotationType.
	self visitFamixTImplementable: aFamixJavaAnnotationType.
	self visitFamixTPackageable: aFamixJavaAnnotationType.
	self visitFamixTTypeArgument: aFamixJavaAnnotationType.
	self visitFamixTWithAttributes: aFamixJavaAnnotationType.
	self visitFamixTWithComments: aFamixJavaAnnotationType.
	self visitFamixTWithInheritances: aFamixJavaAnnotationType.
	self visitFamixJavaType: aFamixJavaAnnotationType
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute [

	<generated>
	self visitFamixTAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute.
	self visitFamixTWithComments: aFamixJavaAnnotationTypeAttribute.
	self visitFamixJavaVariable: aFamixJavaAnnotationTypeAttribute
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaAttribute: aFamixJavaAttribute [

	<generated>
	self visitFamixJavaTCanBeTransient: aFamixJavaAttribute.
	self visitFamixJavaTCanBeVolatile: aFamixJavaAttribute.
	self visitFamixTAttribute: aFamixJavaAttribute.
	self visitFamixTCanBeClassSide: aFamixJavaAttribute.
	self visitFamixTCanBeFinal: aFamixJavaAttribute.
	self visitFamixTHasVisibility: aFamixJavaAttribute.
	self visitFamixTWithComments: aFamixJavaAttribute.
	self visitFamixJavaVariable: aFamixJavaAttribute
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaClass: aFamixJavaClass [

	<generated>
	self visitFamixJavaTClassMetrics: aFamixJavaClass.
	self visitFamixTCanBeAbstract: aFamixJavaClass.
	self visitFamixTCanBeClassSide: aFamixJavaClass.
	self visitFamixTCanBeFinal: aFamixJavaClass.
	self visitFamixTCanImplement: aFamixJavaClass.
	self visitFamixTClass: aFamixJavaClass.
	self visitFamixTClassMetrics: aFamixJavaClass.
	self visitFamixTHasVisibility: aFamixJavaClass.
	self visitFamixTImportable: aFamixJavaClass.
	self visitFamixTLCOMMetrics: aFamixJavaClass.
	self visitFamixTPackageable: aFamixJavaClass.
	self visitFamixTTypeArgument: aFamixJavaClass.
	self visitFamixTWithImports: aFamixJavaClass.
	self visitFamixJavaType: aFamixJavaClass
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaComment: aFamixJavaComment [

	<generated>
	self visitFamixTComment: aFamixJavaComment.
	self visitFamixJavaSourcedEntity: aFamixJavaComment
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaConcretization: aFamixJavaConcretization [

	<generated>
	self visitFamixTConcretization: aFamixJavaConcretization
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaContainerEntity: aFamixJavaContainerEntity [

	<generated>
	self visitFamixJavaTWithInterfaces: aFamixJavaContainerEntity.
	self visitFamixTWithAnnotationTypes: aFamixJavaContainerEntity.
	self visitFamixTWithClasses: aFamixJavaContainerEntity.
	self visitFamixJavaNamedEntity: aFamixJavaContainerEntity
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaEntity: aFamixJavaEntity [

	<generated>

]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaEntityTyping: aFamixJavaEntityTyping [

	<generated>
	self visitFamixTEntityTyping: aFamixJavaEntityTyping
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaEnum: aFamixJavaEnum [

	<generated>
	self visitFamixTEnum: aFamixJavaEnum.
	self visitFamixTHasVisibility: aFamixJavaEnum.
	self visitFamixTImportable: aFamixJavaEnum.
	self visitFamixTInvocationsReceiver: aFamixJavaEnum.
	self visitFamixTTypeArgument: aFamixJavaEnum.
	self visitFamixTWithAttributes: aFamixJavaEnum.
	self visitFamixTWithComments: aFamixJavaEnum.
	self visitFamixTWithImports: aFamixJavaEnum.
	self visitFamixTWithInheritances: aFamixJavaEnum.
	self visitFamixTWithMethods: aFamixJavaEnum.
	self visitFamixJavaType: aFamixJavaEnum
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaEnumValue: aFamixJavaEnumValue [

	<generated>
	self visitFamixTEnumValue: aFamixJavaEnumValue.
	self visitFamixTWithComments: aFamixJavaEnumValue.
	self visitFamixJavaVariable: aFamixJavaEnumValue
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaException: aFamixJavaException [

	<generated>
	self visitFamixTCanImplement: aFamixJavaException.
	self visitFamixTException: aFamixJavaException.
	self visitFamixTHasVisibility: aFamixJavaException.
	self visitFamixTWithAnnotationInstances: aFamixJavaException.
	self visitFamixTWithTypes: aFamixJavaException.
	self visitFamixJavaClass: aFamixJavaException
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaImplementation: aFamixJavaImplementation [

	<generated>
	self visitFamixTImplementation: aFamixJavaImplementation
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaImplicitVariable: aFamixJavaImplicitVariable [

	<generated>
	self visitFamixTImplicitVariable: aFamixJavaImplicitVariable.
	self visitFamixJavaVariable: aFamixJavaImplicitVariable
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaImport: aFamixJavaImport [

	<generated>
	self visitFamixTImport: aFamixJavaImport
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaIndexedFileAnchor: aFamixJavaIndexedFileAnchor [

	<generated>
	self visitFamixTIndexedFileNavigation: aFamixJavaIndexedFileAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaIndexedFileAnchor
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaInheritance: aFamixJavaInheritance [

	<generated>
	self visitFamixTInheritance: aFamixJavaInheritance
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaInterface: aFamixJavaInterface [

	<generated>
	self visitFamixTCanBeClassSide: aFamixJavaInterface.
	self visitFamixTCanBeFinal: aFamixJavaInterface.
	self visitFamixTHasVisibility: aFamixJavaInterface.
	self visitFamixTImplementable: aFamixJavaInterface.
	self visitFamixTImportable: aFamixJavaInterface.
	self visitFamixTInvocationsReceiver: aFamixJavaInterface.
	self visitFamixTPackageable: aFamixJavaInterface.
	self visitFamixTTypeArgument: aFamixJavaInterface.
	self visitFamixTWithAttributes: aFamixJavaInterface.
	self visitFamixTWithComments: aFamixJavaInterface.
	self visitFamixTWithImports: aFamixJavaInterface.
	self visitFamixTWithInheritances: aFamixJavaInterface.
	self visitFamixTWithMethods: aFamixJavaInterface.
	self visitFamixJavaType: aFamixJavaInterface
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaInvocation: aFamixJavaInvocation [

	<generated>
	self visitFamixTInvocation: aFamixJavaInvocation
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaLocalVariable: aFamixJavaLocalVariable [

	<generated>
	self visitFamixTCanBeFinal: aFamixJavaLocalVariable.
	self visitFamixTLocalVariable: aFamixJavaLocalVariable.
	self visitFamixTWithComments: aFamixJavaLocalVariable.
	self visitFamixJavaVariable: aFamixJavaLocalVariable
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaMethod: aFamixJavaMethod [

	<generated>
	self visitFamixJavaTCanBeSynchronized: aFamixJavaMethod.
	self visitFamixTCanBeAbstract: aFamixJavaMethod.
	self visitFamixTCanBeClassSide: aFamixJavaMethod.
	self visitFamixTCanBeFinal: aFamixJavaMethod.
	self visitFamixTHasKind: aFamixJavaMethod.
	self visitFamixTHasVisibility: aFamixJavaMethod.
	self visitFamixTImportable: aFamixJavaMethod.
	self visitFamixTMethod: aFamixJavaMethod.
	self visitFamixTWithComments: aFamixJavaMethod.
	self visitFamixTWithExceptions: aFamixJavaMethod.
	self visitFamixJavaContainerEntity: aFamixJavaMethod
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaNamedEntity: aFamixJavaNamedEntity [

	<generated>
	self visitFamixTNamedEntity: aFamixJavaNamedEntity.
	self visitFamixTWithAnnotationInstances: aFamixJavaNamedEntity.
	self visitTEntityMetaLevelDependency: aFamixJavaNamedEntity.
	self visitFamixJavaSourcedEntity: aFamixJavaNamedEntity
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaPackage: aFamixJavaPackage [

	<generated>
	self visitFamixTImportable: aFamixJavaPackage.
	self visitFamixTPackage: aFamixJavaPackage.
	self visitFamixTPackageable: aFamixJavaPackage.
	self visitFamixTWithComments: aFamixJavaPackage.
	self visitFamixJavaContainerEntity: aFamixJavaPackage
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParameter: aFamixJavaParameter [

	<generated>
	self visitFamixTCanBeFinal: aFamixJavaParameter.
	self visitFamixTParameter: aFamixJavaParameter.
	self visitFamixTWithComments: aFamixJavaParameter.
	self visitFamixJavaVariable: aFamixJavaParameter
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricClass: aFamixJavaParametricClass [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricClass.
	self visitFamixJavaClass: aFamixJavaParametricClass
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricEntityTyping: aFamixJavaParametricEntityTyping [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricEntityTyping.
	self visitFamixJavaEntityTyping: aFamixJavaParametricEntityTyping
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricImplementation: aFamixJavaParametricImplementation [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricImplementation.
	self visitFamixJavaImplementation: aFamixJavaParametricImplementation
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricInheritance: aFamixJavaParametricInheritance [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricInheritance.
	self visitFamixJavaInheritance: aFamixJavaParametricInheritance
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricInterface: aFamixJavaParametricInterface [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricInterface.
	self visitFamixJavaInterface: aFamixJavaParametricInterface
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricInvocation: aFamixJavaParametricInvocation [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricInvocation.
	self visitFamixJavaInvocation: aFamixJavaParametricInvocation
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricMethod: aFamixJavaParametricMethod [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricMethod.
	self visitFamixJavaMethod: aFamixJavaParametricMethod
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaParametricReference: aFamixJavaParametricReference [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricReference.
	self visitFamixJavaReference: aFamixJavaParametricReference
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaPrimitiveType: aFamixJavaPrimitiveType [

	<generated>
	self visitFamixTPrimitiveType: aFamixJavaPrimitiveType.
	self visitFamixJavaType: aFamixJavaPrimitiveType
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaReference: aFamixJavaReference [

	<generated>
	self visitFamixTReference: aFamixJavaReference
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaSourceAnchor: aFamixJavaSourceAnchor [

	<generated>
	self visitFamixTSourceAnchor: aFamixJavaSourceAnchor
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaSourceLanguage: aFamixJavaSourceLanguage [

	<generated>
	self visitFamixTSourceLanguage: aFamixJavaSourceLanguage
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaSourceTextAnchor: aFamixJavaSourceTextAnchor [

	<generated>
	self visitFamixTHasImmediateSource: aFamixJavaSourceTextAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaSourceTextAnchor
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaSourcedEntity: aFamixJavaSourcedEntity [

	<generated>
	self visitFamixTSourceEntity: aFamixJavaSourcedEntity
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTBound: aFamixJavaTBound [

	<generated>
	self visitCollection: aFamixJavaTBound lowerBoundedWildcards.
	self visitCollection: aFamixJavaTBound upperBoundedWildcards
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTBounded: aFamixJavaTBounded [

	<generated>
	self visitEntity: aFamixJavaTBounded lowerBound.
	self visitEntity: aFamixJavaTBounded upperBound
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTCanBeSynchronized: aFamixJavaTCanBeSynchronized [

	<generated>

]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTCanBeTransient: aFamixJavaTCanBeTransient [

	<generated>

]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTCanBeVolatile: aFamixJavaTCanBeVolatile [

	<generated>

]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTClassMetrics: aFamixJavaTClassMetrics [

	<generated>

]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTWithInterfaces: aFamixJavaTWithInterfaces [

	<generated>
	self visitFamixTWithTypes: aFamixJavaTWithInterfaces
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaType: aFamixJavaType [

	<generated>
	self visitFamixJavaTBound: aFamixJavaType.
	self visitFamixTType: aFamixJavaType.
	self visitFamixTWithMethods: aFamixJavaType.
	self visitFamixJavaContainerEntity: aFamixJavaType
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaTypeParameter: aFamixJavaTypeParameter [

	<generated>
	self visitFamixJavaTBounded: aFamixJavaTypeParameter.
	self visitFamixTThrowable: aFamixJavaTypeParameter.
	self visitFamixTTypeArgument: aFamixJavaTypeParameter.
	self visitFamixTTypeParameter: aFamixJavaTypeParameter.
	self visitFamixJavaType: aFamixJavaTypeParameter
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaUnknownVariable: aFamixJavaUnknownVariable [

	<generated>
	self visitFamixTUnknownVariable: aFamixJavaUnknownVariable.
	self visitFamixJavaVariable: aFamixJavaUnknownVariable
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaVariable: aFamixJavaVariable [

	<generated>
	self visitFamixTInvocationsReceiver: aFamixJavaVariable.
	self visitFamixJavaNamedEntity: aFamixJavaVariable
]

{ #category : #visiting }
FamixJavaTVisitor >> visitFamixJavaWildcard: aFamixJavaWildcard [

	<generated>
	self visitFamixJavaTBounded: aFamixJavaWildcard.
	self visitFamixTTypeArgument: aFamixJavaWildcard.
	self visitFamixJavaType: aFamixJavaWildcard
]
