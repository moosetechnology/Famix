"
I am a visitor for FamixJavaEntities. 
I am generated with the metamodel.


"
Trait {
	#name : 'FamixJavaTVisitor',
	#category : 'Famix-Java-Entities-Visitor',
	#package : 'Famix-Java-Entities',
	#tag : 'Visitor'
}

{ #category : 'meta' }
FamixJavaTVisitor classSide >> annotation [

	<FMClass: #TVisitor super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitCollection: aCollection [

	<generated>
	^ aCollection collect: [ :each | each accept: self ]
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitEntity: aFamixEntity [

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAccess: aFamixJavaAccess [

	<generated>
	self visitFamixTAccess: aFamixJavaAccess
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAnnotationInstance: aFamixJavaAnnotationInstance [

	<generated>
	self visitFamixTAnnotationInstance: aFamixJavaAnnotationInstance.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstance
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute [

	<generated>
	self visitFamixTAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstanceAttribute
]

{ #category : 'visiting' }
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

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute [

	<generated>
	self visitFamixTAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute.
	self visitFamixTWithComments: aFamixJavaAnnotationTypeAttribute.
	self visitFamixJavaVariable: aFamixJavaAnnotationTypeAttribute
]

{ #category : 'visiting' }
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

{ #category : 'visiting' }
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

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaComment: aFamixJavaComment [

	<generated>
	self visitFamixTComment: aFamixJavaComment.
	self visitFamixJavaSourcedEntity: aFamixJavaComment
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaConcretization: aFamixJavaConcretization [

	<generated>
	self visitFamixTConcretization: aFamixJavaConcretization
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaContainerEntity: aFamixJavaContainerEntity [

	<generated>
	self visitFamixJavaTWithInterfaces: aFamixJavaContainerEntity.
	self visitFamixTWithAnnotationTypes: aFamixJavaContainerEntity.
	self visitFamixTWithClasses: aFamixJavaContainerEntity.
	self visitFamixJavaNamedEntity: aFamixJavaContainerEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaEntity: aFamixJavaEntity [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaEntityTyping: aFamixJavaEntityTyping [

	<generated>
	self visitFamixTEntityTyping: aFamixJavaEntityTyping
]

{ #category : 'visiting' }
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

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaEnumValue: aFamixJavaEnumValue [

	<generated>
	self visitFamixTEnumValue: aFamixJavaEnumValue.
	self visitFamixTWithComments: aFamixJavaEnumValue.
	self visitFamixJavaVariable: aFamixJavaEnumValue
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaException: aFamixJavaException [

	<generated>
	self visitFamixTException: aFamixJavaException.
	self visitFamixJavaClass: aFamixJavaException
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaImplementation: aFamixJavaImplementation [

	<generated>
	self visitFamixTImplementation: aFamixJavaImplementation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaImplicitVariable: aFamixJavaImplicitVariable [

	<generated>
	self visitFamixTImplicitVariable: aFamixJavaImplicitVariable.
	self visitFamixJavaVariable: aFamixJavaImplicitVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaImport: aFamixJavaImport [

	<generated>
	self visitFamixTImport: aFamixJavaImport
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaIndexedFileAnchor: aFamixJavaIndexedFileAnchor [

	<generated>
	self visitFamixTIndexedFileNavigation: aFamixJavaIndexedFileAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaIndexedFileAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaInheritance: aFamixJavaInheritance [

	<generated>
	self visitFamixTInheritance: aFamixJavaInheritance
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaInitializer: aFamixJavaInitializer [

	<generated>
	self visitFamixJavaMethod: aFamixJavaInitializer
]

{ #category : 'visiting' }
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

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaInvocation: aFamixJavaInvocation [

	<generated>
	self visitFamixTInvocation: aFamixJavaInvocation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaLocalVariable: aFamixJavaLocalVariable [

	<generated>
	self visitFamixTCanBeFinal: aFamixJavaLocalVariable.
	self visitFamixTLocalVariable: aFamixJavaLocalVariable.
	self visitFamixTWithComments: aFamixJavaLocalVariable.
	self visitFamixJavaVariable: aFamixJavaLocalVariable
]

{ #category : 'visiting' }
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

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaNamedEntity: aFamixJavaNamedEntity [

	<generated>
	self visitFamixTNamedEntity: aFamixJavaNamedEntity.
	self visitFamixTWithAnnotationInstances: aFamixJavaNamedEntity.
	self visitTEntityMetaLevelDependency: aFamixJavaNamedEntity.
	self visitFamixJavaSourcedEntity: aFamixJavaNamedEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaPackage: aFamixJavaPackage [

	<generated>
	self visitFamixTImportable: aFamixJavaPackage.
	self visitFamixTPackage: aFamixJavaPackage.
	self visitFamixTPackageable: aFamixJavaPackage.
	self visitFamixTWithComments: aFamixJavaPackage.
	self visitFamixJavaContainerEntity: aFamixJavaPackage
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParameter: aFamixJavaParameter [

	<generated>
	self visitFamixTCanBeFinal: aFamixJavaParameter.
	self visitFamixTParameter: aFamixJavaParameter.
	self visitFamixTWithComments: aFamixJavaParameter.
	self visitFamixJavaVariable: aFamixJavaParameter
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricClass: aFamixJavaParametricClass [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricClass.
	self visitFamixJavaClass: aFamixJavaParametricClass
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricEntityTyping: aFamixJavaParametricEntityTyping [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricEntityTyping.
	self visitFamixJavaEntityTyping: aFamixJavaParametricEntityTyping
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricImplementation: aFamixJavaParametricImplementation [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricImplementation.
	self visitFamixJavaImplementation: aFamixJavaParametricImplementation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricInheritance: aFamixJavaParametricInheritance [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricInheritance.
	self visitFamixJavaInheritance: aFamixJavaParametricInheritance
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricInterface: aFamixJavaParametricInterface [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricInterface.
	self visitFamixJavaInterface: aFamixJavaParametricInterface
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricInvocation: aFamixJavaParametricInvocation [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricInvocation.
	self visitFamixJavaInvocation: aFamixJavaParametricInvocation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricMethod: aFamixJavaParametricMethod [

	<generated>
	self visitFamixTParametricEntity: aFamixJavaParametricMethod.
	self visitFamixJavaMethod: aFamixJavaParametricMethod
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricReference: aFamixJavaParametricReference [

	<generated>
	self visitFamixTParametricAssociation: aFamixJavaParametricReference.
	self visitFamixJavaReference: aFamixJavaParametricReference
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaPrimitiveType: aFamixJavaPrimitiveType [

	<generated>
	self visitFamixTPrimitiveType: aFamixJavaPrimitiveType.
	self visitFamixTTypeArgument: aFamixJavaPrimitiveType.
	self visitFamixJavaType: aFamixJavaPrimitiveType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaReference: aFamixJavaReference [

	<generated>
	self visitFamixTReference: aFamixJavaReference
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourceAnchor: aFamixJavaSourceAnchor [

	<generated>
	self visitFamixTSourceAnchor: aFamixJavaSourceAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourceLanguage: aFamixJavaSourceLanguage [

	<generated>
	self visitFamixTSourceLanguage: aFamixJavaSourceLanguage
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourceTextAnchor: aFamixJavaSourceTextAnchor [

	<generated>
	self visitFamixTHasImmediateSource: aFamixJavaSourceTextAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaSourceTextAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourcedEntity: aFamixJavaSourcedEntity [

	<generated>
	self visitFamixTSourceEntity: aFamixJavaSourcedEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTBound: aFamixJavaTBound [

	<generated>
	self visitCollection: aFamixJavaTBound lowerBoundedWildcards.
	self visitCollection: aFamixJavaTBound upperBoundedWildcards
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTBounded: aFamixJavaTBounded [

	<generated>
	self visitEntity: aFamixJavaTBounded lowerBound.
	self visitEntity: aFamixJavaTBounded upperBound
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTCanBeSynchronized: aFamixJavaTCanBeSynchronized [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTCanBeTransient: aFamixJavaTCanBeTransient [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTCanBeVolatile: aFamixJavaTCanBeVolatile [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTClassMetrics: aFamixJavaTClassMetrics [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTWithInterfaces: aFamixJavaTWithInterfaces [

	<generated>
	self visitFamixTWithTypes: aFamixJavaTWithInterfaces
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaType: aFamixJavaType [

	<generated>
	self visitFamixJavaTBound: aFamixJavaType.
	self visitFamixTType: aFamixJavaType.
	self visitFamixTWithMethods: aFamixJavaType.
	self visitFamixJavaContainerEntity: aFamixJavaType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTypeParameter: aFamixJavaTypeParameter [

	<generated>
	self visitFamixJavaTBounded: aFamixJavaTypeParameter.
	self visitFamixTThrowable: aFamixJavaTypeParameter.
	self visitFamixTTypeArgument: aFamixJavaTypeParameter.
	self visitFamixTTypeParameter: aFamixJavaTypeParameter.
	self visitFamixJavaType: aFamixJavaTypeParameter
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaUnknownVariable: aFamixJavaUnknownVariable [

	<generated>
	self visitFamixTUnknownVariable: aFamixJavaUnknownVariable.
	self visitFamixJavaVariable: aFamixJavaUnknownVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaVariable: aFamixJavaVariable [

	<generated>
	self visitFamixTInvocationsReceiver: aFamixJavaVariable.
	self visitFamixJavaNamedEntity: aFamixJavaVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaWildcard: aFamixJavaWildcard [

	<generated>
	self visitFamixJavaTBounded: aFamixJavaWildcard.
	self visitFamixTTypeArgument: aFamixJavaWildcard.
	self visitFamixJavaType: aFamixJavaWildcard
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAccess: aFamixTAccess [

	<generated>
	self visitFamixTAssociation: aFamixTAccess.

	self visitEntity: aFamixTAccess accessor.
	self visitCollection: aFamixTAccess candidates
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationInstance: aFamixTAnnotationInstance [

	<generated>
	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstance.

	self visitEntity: aFamixTAnnotationInstance annotatedEntity.
	self visitCollection: aFamixTAnnotationInstance attributes.
	self visitEntity: aFamixTAnnotationInstance annotationType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationInstanceAttribute: aFamixTAnnotationInstanceAttribute [

	<generated>
	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstanceAttribute.

	self visitEntity: aFamixTAnnotationInstanceAttribute annotationTypeAttribute
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationType: aFamixTAnnotationType [

	<generated>
	self visitCollection: aFamixTAnnotationType instances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationTypeAttribute: aFamixTAnnotationTypeAttribute [

	<generated>
	self visitFamixTAttribute: aFamixTAnnotationTypeAttribute.

	self visitCollection: aFamixTAnnotationTypeAttribute annotationAttributeInstances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAttribute: aFamixTAttribute [

	<generated>
	self visitFamixTStructuralEntity: aFamixTAttribute.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanBeAbstract: aFamixTCanBeAbstract [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanBeClassSide: aFamixTCanBeClassSide [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanBeFinal: aFamixTCanBeFinal [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanImplement: aFamixTCanImplement [

	<generated>
	self visitCollection: aFamixTCanImplement interfaceImplementations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTClass: aFamixTClass [

	<generated>
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aFamixTClass class)
		ifFalse: [ self visitFamixTInvocationsReceiver: aFamixTClass ].
	"We should visit FamixTType but all its users in this language already visit it in their superclasses so we skip the call here.".
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aFamixTClass class)
		ifFalse: [ self visitFamixTWithAttributes: aFamixTClass ].
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aFamixTClass class)
		ifFalse: [ self visitFamixTWithComments: aFamixTClass ].
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aFamixTClass class)
		ifFalse: [ self visitFamixTWithInheritances: aFamixTClass ].
	"We should visit FamixTWithMethods but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTClassMetrics: aFamixTClassMetrics [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTComment: aFamixTComment [

	<generated>
	"We should visit FamixTSourceEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitTEntityMetaLevelDependency: aFamixTComment.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTConcretization: aFamixTConcretization [

	<generated>
	self visitFamixTAssociation: aFamixTConcretization.

	self visitEntity: aFamixTConcretization triggeringAssociation.
	self visitEntity: aFamixTConcretization typeArgument.
	self visitEntity: aFamixTConcretization typeParameter
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTEntityTyping: aFamixTEntityTyping [

	<generated>
	self visitFamixTAssociation: aFamixTEntityTyping.

	self visitEntity: aFamixTEntityTyping typedEntity.
	self visitEntity: aFamixTEntityTyping declaredType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTEnum: aFamixTEnum [

	<generated>
	"We should visit FamixTType but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitFamixTWithEnumValues: aFamixTEnum
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTEnumValue: aFamixTEnumValue [

	<generated>
	self visitFamixTStructuralEntity: aFamixTEnumValue.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTException: aFamixTException [

	<generated>
	"We should visit FamixTClass but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitFamixTThrowable: aFamixTException
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTHasImmediateSource: aFamixTHasImmediateSource [

	<generated>
	"We should visit FamixTSourceAnchor but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTHasKind: aFamixTHasKind [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTHasVisibility: aFamixTHasVisibility [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImplementable: aFamixTImplementable [

	<generated>
	self visitCollection: aFamixTImplementable implementations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImplementation: aFamixTImplementation [

	<generated>
	self visitFamixTAssociation: aFamixTImplementation.

	self visitEntity: aFamixTImplementation implementingClass.
	self visitEntity: aFamixTImplementation interface
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImplicitVariable: aFamixTImplicitVariable [

	<generated>
	self visitFamixTStructuralEntity: aFamixTImplicitVariable.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImport: aFamixTImport [

	<generated>
	self visitFamixTAssociation: aFamixTImport.

	self visitEntity: aFamixTImport importingEntity.
	self visitEntity: aFamixTImport importedEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImportable: aFamixTImportable [

	<generated>
	self visitCollection: aFamixTImportable incomingImports
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTIndexedFileNavigation: aFamixTIndexedFileNavigation [

	<generated>
	self visitFamixTFileAnchor: aFamixTIndexedFileNavigation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTInheritance: aFamixTInheritance [

	<generated>
	self visitFamixTAssociation: aFamixTInheritance.

	self visitEntity: aFamixTInheritance subclass.
	self visitEntity: aFamixTInheritance superclass
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTInvocation: aFamixTInvocation [

	<generated>
	self visitFamixTAssociation: aFamixTInvocation.
	self visitFamixTHasSignature: aFamixTInvocation.

	self visitCollection: aFamixTInvocation candidates.
	self visitEntity: aFamixTInvocation sender.
	self visitEntity: aFamixTInvocation receiver
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTInvocationsReceiver: aFamixTInvocationsReceiver [

	<generated>
	self visitCollection: aFamixTInvocationsReceiver receivingInvocations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTLCOMMetrics: aFamixTLCOMMetrics [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTLocalVariable: aFamixTLocalVariable [

	<generated>
	self visitFamixTStructuralEntity: aFamixTLocalVariable.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTMethod: aFamixTMethod [

	<generated>
	self visitFamixTHasSignature: aFamixTMethod.
	self visitFamixTInvocable: aFamixTMethod.
	self visitFamixTMethodMetrics: aFamixTMethod.
	"We should visit FamixTNamedEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitFamixTTypedEntity: aFamixTMethod.
	self visitFamixTWithImplicitVariables: aFamixTMethod.
	self visitFamixTWithLocalVariables: aFamixTMethod.
	self visitFamixTWithParameters: aFamixTMethod.
	self visitFamixTWithStatements: aFamixTMethod.
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here.".


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTNamedEntity: aFamixTNamedEntity [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTPackage: aFamixTPackage [

	<generated>
	self visitFamixTCanBeStub: aFamixTPackage.
	"We should visit FamixTNamedEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here.".

	self visitCollection: aFamixTPackage childEntities
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTPackageable: aFamixTPackageable [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTParameter: aFamixTParameter [

	<generated>
	self visitFamixTStructuralEntity: aFamixTParameter.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTParametricAssociation: aFamixTParametricAssociation [

	<generated>
	self visitCollection: aFamixTParametricAssociation concretizations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTParametricEntity: aFamixTParametricEntity [

	<generated>
	self visitCollection: aFamixTParametricEntity typeParameters
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTPrimitiveType: aFamixTPrimitiveType [

	<generated>
	"We should visit FamixTType but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTReference: aFamixTReference [

	<generated>
	self visitFamixTAssociation: aFamixTReference.

	self visitEntity: aFamixTReference referencer.
	self visitEntity: aFamixTReference referredEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTSourceAnchor: aFamixTSourceAnchor [

	<generated>
	self visitEntity: aFamixTSourceAnchor element
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTSourceEntity: aFamixTSourceEntity [

	<generated>
	self visitEntity: aFamixTSourceEntity sourceAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTSourceLanguage: aFamixTSourceLanguage [

	<generated>
	self visitCollection: aFamixTSourceLanguage sourcedEntities
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTThrowable: aFamixTThrowable [

	<generated>
	self visitCollection: aFamixTThrowable catchingEntities.
	self visitCollection: aFamixTThrowable declaringEntities.
	self visitCollection: aFamixTThrowable throwingEntities
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTType: aFamixTType [

	<generated>
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaClass . FamixJavaEnum . FamixJavaException . FamixJavaPrimitiveType } includes: aFamixTType class)
		ifFalse: [ self visitFamixTCanBeStub: aFamixTType ].
	"We should visit FamixTNamedEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaClass . FamixJavaEnum . FamixJavaException . FamixJavaPrimitiveType } includes: aFamixTType class)
		ifFalse: [ self visitFamixTReferenceable: aFamixTType ].
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here.".

	self visitCollection: aFamixTType incomingTypings
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTTypeArgument: aFamixTTypeArgument [

	<generated>
	self visitCollection: aFamixTTypeArgument outgoingConcretizations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTTypeParameter: aFamixTTypeParameter [

	<generated>
	self visitCollection: aFamixTTypeParameter concretizations.
	self visitEntity: aFamixTTypeParameter genericEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTUnknownVariable: aFamixTUnknownVariable [

	<generated>
	self visitFamixTStructuralEntity: aFamixTUnknownVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithAnnotationInstances: aFamixTWithAnnotationInstances [

	<generated>
	self visitCollection: aFamixTWithAnnotationInstances annotationInstances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithAnnotationTypes: aFamixTWithAnnotationTypes [

	<generated>
	self visitCollection: aFamixTWithAnnotationTypes definedAnnotationTypes
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithAttributes: aFamixTWithAttributes [

	<generated>
	self visitCollection: aFamixTWithAttributes attributes
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithClasses: aFamixTWithClasses [

	<generated>
	self visitFamixTWithTypes: aFamixTWithClasses
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithComments: aFamixTWithComments [

	<generated>
	self visitCollection: aFamixTWithComments comments
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithExceptions: aFamixTWithExceptions [

	<generated>
	self visitCollection: aFamixTWithExceptions caughtExceptions.
	self visitCollection: aFamixTWithExceptions declaredExceptions.
	self visitCollection: aFamixTWithExceptions thrownExceptions
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithImports: aFamixTWithImports [

	<generated>
	self visitCollection: aFamixTWithImports imports
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithInheritances: aFamixTWithInheritances [

	<generated>
	self visitCollection: aFamixTWithInheritances superInheritances.
	self visitCollection: aFamixTWithInheritances subInheritances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithMethods: aFamixTWithMethods [

	<generated>
	self visitCollection: aFamixTWithMethods methods
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithTypes: aFamixTWithTypes [

	<generated>
	self visitCollection: aFamixTWithTypes types
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitTAssociationMetaLevelDependency: aTAssociationMetaLevelDependency [

	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitTEntityMetaLevelDependency: aTEntityMetaLevelDependency [

	<generated>

]
