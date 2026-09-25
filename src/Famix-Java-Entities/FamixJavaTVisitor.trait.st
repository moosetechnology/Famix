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

	<ignoreForCoverage>
	<FMClass: #TVisitor super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitCollection: aCollection [

	<ignoreForCoverage>
	<generated>
	^ aCollection collect: [ :each | each accept: self ]
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitEntity: aFamixEntity [

	<ignoreForCoverage>
	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAccess: anAccess [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAccess: anAccess
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAnnotationInstance: anAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAnnotationInstance: anAnnotationInstance.
	self visitFamixJavaSourcedEntity: anAnnotationInstance
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAnnotationInstanceAttribute: anAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAnnotationInstanceAttribute: anAnnotationInstanceAttribute.
	self visitFamixJavaSourcedEntity: anAnnotationInstanceAttribute
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAnnotationType: anAnnotationType [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAnnotationType: anAnnotationType.
	self visitFamixTHasVisibility: anAnnotationType.
	self visitFamixTImplementable: anAnnotationType.
	self visitFamixTPackageable: anAnnotationType.
	self visitFamixTTypeArgument: anAnnotationType.
	self visitFamixTWithAttributes: anAnnotationType.
	self visitFamixTWithComments: anAnnotationType.
	self visitFamixTWithInheritances: anAnnotationType.
	self visitFamixJavaType: anAnnotationType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAnnotationTypeAttribute: anAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAnnotationTypeAttribute: anAnnotationTypeAttribute.
	self visitFamixTWithComments: anAnnotationTypeAttribute.
	self visitFamixJavaVariable: anAnnotationTypeAttribute
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaAttribute: anAttribute [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaTCanBeTransient: anAttribute.
	self visitFamixJavaTCanBeVolatile: anAttribute.
	self visitFamixTAttribute: anAttribute.
	self visitFamixTCanBeClassSide: anAttribute.
	self visitFamixTCanBeFinal: anAttribute.
	self visitFamixTHasVisibility: anAttribute.
	self visitFamixTWithComments: anAttribute.
	self visitFamixJavaVariable: anAttribute
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaClass: aClass [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaTClassMetrics: aClass.
	self visitFamixTCanBeAbstract: aClass.
	self visitFamixTCanBeClassSide: aClass.
	self visitFamixTCanBeFinal: aClass.
	self visitFamixTCanImplement: aClass.
	self visitFamixTClass: aClass.
	self visitFamixTClassMetrics: aClass.
	self visitFamixTHasVisibility: aClass.
	self visitFamixTImportable: aClass.
	self visitFamixTLCOMMetrics: aClass.
	self visitFamixTPackageable: aClass.
	self visitFamixTTypeArgument: aClass.
	self visitFamixTWithImports: aClass.
	self visitFamixJavaType: aClass
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaComment: aComment [

	<ignoreForCoverage>
	<generated>
	self visitFamixTComment: aComment.
	self visitFamixJavaSourcedEntity: aComment
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaConcretization: aConcretization [

	<ignoreForCoverage>
	<generated>
	self visitFamixTConcretization: aConcretization
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaContainerEntity: aContainerEntity [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaTWithInterfaces: aContainerEntity.
	self visitFamixTWithAnnotationTypes: aContainerEntity.
	self visitFamixTWithClasses: aContainerEntity.
	self visitFamixJavaNamedEntity: aContainerEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaEntity: anEntity [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaEntityTyping: anEntityTyping [

	<ignoreForCoverage>
	<generated>
	self visitFamixTEntityTyping: anEntityTyping
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaEnum: anEnum [

	<ignoreForCoverage>
	<generated>
	self visitFamixTEnum: anEnum.
	self visitFamixTHasVisibility: anEnum.
	self visitFamixTImportable: anEnum.
	self visitFamixTInvocationsReceiver: anEnum.
	self visitFamixTTypeArgument: anEnum.
	self visitFamixTWithAttributes: anEnum.
	self visitFamixTWithComments: anEnum.
	self visitFamixTWithImports: anEnum.
	self visitFamixTWithInheritances: anEnum.
	self visitFamixTWithMethods: anEnum.
	self visitFamixJavaType: anEnum
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaEnumValue: anEnumValue [

	<ignoreForCoverage>
	<generated>
	self visitFamixTEnumValue: anEnumValue.
	self visitFamixTWithComments: anEnumValue.
	self visitFamixJavaVariable: anEnumValue
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaException: anException [

	<ignoreForCoverage>
	<generated>
	self visitFamixTException: anException.
	self visitFamixJavaClass: anException
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaImplementation: anImplementation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTImplementation: anImplementation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaImplicitVariable: anImplicitVariable [

	<ignoreForCoverage>
	<generated>
	self visitFamixTImplicitVariable: anImplicitVariable.
	self visitFamixJavaVariable: anImplicitVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaImport: anImport [

	<ignoreForCoverage>
	<generated>
	self visitFamixTImport: anImport
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaIndexedFileAnchor: anIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	self visitFamixTIndexedFileNavigation: anIndexedFileAnchor.
	self visitFamixJavaSourceAnchor: anIndexedFileAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaInheritance: anInheritance [

	<ignoreForCoverage>
	<generated>
	self visitFamixTInheritance: anInheritance
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaInitializer: anInitializer [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaMethod: anInitializer
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaInterface: anInterface [

	<ignoreForCoverage>
	<generated>
	self visitFamixTCanBeClassSide: anInterface.
	self visitFamixTCanBeFinal: anInterface.
	self visitFamixTHasVisibility: anInterface.
	self visitFamixTImplementable: anInterface.
	self visitFamixTImportable: anInterface.
	self visitFamixTInvocationsReceiver: anInterface.
	self visitFamixTPackageable: anInterface.
	self visitFamixTTypeArgument: anInterface.
	self visitFamixTWithAttributes: anInterface.
	self visitFamixTWithComments: anInterface.
	self visitFamixTWithImports: anInterface.
	self visitFamixTWithInheritances: anInterface.
	self visitFamixTWithMethods: anInterface.
	self visitFamixJavaType: anInterface
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaInvocation: anInvocation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTInvocation: anInvocation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaLocalVariable: aLocalVariable [

	<ignoreForCoverage>
	<generated>
	self visitFamixTCanBeFinal: aLocalVariable.
	self visitFamixTLocalVariable: aLocalVariable.
	self visitFamixTWithComments: aLocalVariable.
	self visitFamixJavaVariable: aLocalVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaMethod: aMethod [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaTCanBeSynchronized: aMethod.
	self visitFamixTCanBeAbstract: aMethod.
	self visitFamixTCanBeClassSide: aMethod.
	self visitFamixTCanBeFinal: aMethod.
	self visitFamixTHasKind: aMethod.
	self visitFamixTHasVisibility: aMethod.
	self visitFamixTImportable: aMethod.
	self visitFamixTMethod: aMethod.
	self visitFamixTWithComments: aMethod.
	self visitFamixTWithExceptions: aMethod.
	self visitFamixJavaContainerEntity: aMethod
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaNamedEntity: aNamedEntity [

	<ignoreForCoverage>
	<generated>
	self visitFamixTNamedEntity: aNamedEntity.
	self visitFamixTWithAnnotationInstances: aNamedEntity.
	self visitTEntityMetaLevelDependency: aNamedEntity.
	self visitFamixJavaSourcedEntity: aNamedEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaPackage: aPackage [

	<ignoreForCoverage>
	<generated>
	self visitFamixTImportable: aPackage.
	self visitFamixTPackage: aPackage.
	self visitFamixTPackageable: aPackage.
	self visitFamixTWithComments: aPackage.
	self visitFamixJavaContainerEntity: aPackage
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParameter: aParameter [

	<ignoreForCoverage>
	<generated>
	self visitFamixTCanBeFinal: aParameter.
	self visitFamixTParameter: aParameter.
	self visitFamixTWithComments: aParameter.
	self visitFamixJavaVariable: aParameter
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricClass: aParametricClass [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricEntity: aParametricClass.
	self visitFamixJavaClass: aParametricClass
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricEntityTyping: aParametricEntityTyping [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricAssociation: aParametricEntityTyping.
	self visitFamixJavaEntityTyping: aParametricEntityTyping
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricImplementation: aParametricImplementation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricAssociation: aParametricImplementation.
	self visitFamixJavaImplementation: aParametricImplementation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricInheritance: aParametricInheritance [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricAssociation: aParametricInheritance.
	self visitFamixJavaInheritance: aParametricInheritance
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricInterface: aParametricInterface [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricEntity: aParametricInterface.
	self visitFamixJavaInterface: aParametricInterface
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricInvocation: aParametricInvocation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricAssociation: aParametricInvocation.
	self visitFamixJavaInvocation: aParametricInvocation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricMethod: aParametricMethod [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricEntity: aParametricMethod.
	self visitFamixJavaMethod: aParametricMethod
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaParametricReference: aParametricReference [

	<ignoreForCoverage>
	<generated>
	self visitFamixTParametricAssociation: aParametricReference.
	self visitFamixJavaReference: aParametricReference
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaPrimitiveType: aPrimitiveType [

	<ignoreForCoverage>
	<generated>
	self visitFamixTPrimitiveType: aPrimitiveType.
	self visitFamixTTypeArgument: aPrimitiveType.
	self visitFamixJavaType: aPrimitiveType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaReference: aReference [

	<ignoreForCoverage>
	<generated>
	self visitFamixTReference: aReference
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourceAnchor: aSourceAnchor [

	<ignoreForCoverage>
	<generated>
	self visitFamixTSourceAnchor: aSourceAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourceLanguage: aSourceLanguage [

	<ignoreForCoverage>
	<generated>
	self visitFamixTSourceLanguage: aSourceLanguage
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourceTextAnchor: aSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	self visitFamixTHasImmediateSource: aSourceTextAnchor.
	self visitFamixJavaSourceAnchor: aSourceTextAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaSourcedEntity: aSourcedEntity [

	<ignoreForCoverage>
	<generated>
	self visitFamixTSourceEntity: aSourcedEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTBound: aTBound [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTBound lowerBoundedWildcards.
	self visitCollection: aTBound upperBoundedWildcards
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTBounded: aTBounded [

	<ignoreForCoverage>
	<generated>
	self visitEntity: aTBounded lowerBound.
	self visitEntity: aTBounded upperBound
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTCanBeSynchronized: aTCanBeSynchronized [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTCanBeTransient: aTCanBeTransient [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTCanBeVolatile: aTCanBeVolatile [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTClassMetrics: aTClassMetrics [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTWithInterfaces: aTWithInterfaces [

	<ignoreForCoverage>
	<generated>
	self visitFamixTWithTypes: aTWithInterfaces
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaType: aType [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaTBound: aType.
	self visitFamixTType: aType.
	self visitFamixTWithMethods: aType.
	self visitFamixJavaContainerEntity: aType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaTypeParameter: aTypeParameter [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaTBounded: aTypeParameter.
	self visitFamixTThrowable: aTypeParameter.
	self visitFamixTTypeArgument: aTypeParameter.
	self visitFamixTTypeParameter: aTypeParameter.
	self visitFamixJavaType: aTypeParameter
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaUnknownVariable: anUnknownVariable [

	<ignoreForCoverage>
	<generated>
	self visitFamixTUnknownVariable: anUnknownVariable.
	self visitFamixJavaVariable: anUnknownVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaVariable: aVariable [

	<ignoreForCoverage>
	<generated>
	self visitFamixTInvocationsReceiver: aVariable.
	self visitFamixJavaNamedEntity: aVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixJavaWildcard: aWildcard [

	<ignoreForCoverage>
	<generated>
	self visitFamixJavaTBounded: aWildcard.
	self visitFamixTTypeArgument: aWildcard.
	self visitFamixJavaType: aWildcard
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAccess: aTAccess [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTAccess.

	self visitEntity: aTAccess accessor.
	self visitCollection: aTAccess candidates
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAccessible: aTAccessible [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTAccessible incomingAccesses
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationInstance: aTAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	self visitTEntityMetaLevelDependency: aTAnnotationInstance.

	self visitEntity: aTAnnotationInstance annotatedEntity.
	self visitCollection: aTAnnotationInstance attributes.
	self visitEntity: aTAnnotationInstance annotationType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationInstanceAttribute: aTAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	self visitTEntityMetaLevelDependency: aTAnnotationInstanceAttribute.

	self visitEntity: aTAnnotationInstanceAttribute annotationTypeAttribute
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationType: aTAnnotationType [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTAnnotationType instances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAnnotationTypeAttribute: aTAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAttribute: aTAnnotationTypeAttribute.

	self visitCollection: aTAnnotationTypeAttribute annotationAttributeInstances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAssociation: aTAssociation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTSourceEntity: aTAssociation.
	self visitTAssociationMetaLevelDependency: aTAssociation.

	self visitEntity: aTAssociation previous.
	self visitEntity: aTAssociation next
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTAttribute: aTAttribute [

	<ignoreForCoverage>
	<generated>
	self visitFamixTStructuralEntity: aTAttribute.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanBeAbstract: aTCanBeAbstract [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanBeClassSide: aTCanBeClassSide [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanBeFinal: aTCanBeFinal [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanBeStub: aTCanBeStub [

	<ignoreForCoverage>
	<generated>
	"We should visit FamixTSourceEntity but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTCanImplement: aTCanImplement [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTCanImplement interfaceImplementations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTClass: aTClass [

	<ignoreForCoverage>
	<generated>
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aTClass class)
		ifFalse: [ self visitFamixTInvocationsReceiver: aTClass ].
	"We should visit FamixTType but all its users in this language already visit it in their superclasses so we skip the call here.".
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aTClass class)
		ifFalse: [ self visitFamixTWithAttributes: aTClass ].
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aTClass class)
		ifFalse: [ self visitFamixTWithComments: aTClass ].
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaException } includes: aTClass class)
		ifFalse: [ self visitFamixTWithInheritances: aTClass ].
	"We should visit FamixTWithMethods but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTClassMetrics: aTClassMetrics [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTComment: aTComment [

	<ignoreForCoverage>
	<generated>
	"We should visit FamixTSourceEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitTEntityMetaLevelDependency: aTComment.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTConcretization: aTConcretization [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTConcretization.

	self visitEntity: aTConcretization triggeringAssociation.
	self visitEntity: aTConcretization typeArgument.
	self visitEntity: aTConcretization typeParameter
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTEntityTyping: aTEntityTyping [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTEntityTyping.

	self visitEntity: aTEntityTyping typedEntity.
	self visitEntity: aTEntityTyping declaredType
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTEnum: aTEnum [

	<ignoreForCoverage>
	<generated>
	"We should visit FamixTType but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitFamixTWithEnumValues: aTEnum
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTEnumValue: aTEnumValue [

	<ignoreForCoverage>
	<generated>
	self visitFamixTStructuralEntity: aTEnumValue.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTException: aTException [

	<ignoreForCoverage>
	<generated>
	"We should visit FamixTClass but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitFamixTThrowable: aTException
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTFileAnchor: aTFileAnchor [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTHasImmediateSource: aTHasImmediateSource [

	<ignoreForCoverage>
	<generated>
	"We should visit FamixTSourceAnchor but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTHasKind: aTHasKind [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTHasSignature: aTHasSignature [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTHasVisibility: aTHasVisibility [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImplementable: aTImplementable [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTImplementable implementations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImplementation: aTImplementation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTImplementation.

	self visitEntity: aTImplementation implementingClass.
	self visitEntity: aTImplementation interface
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImplicitVariable: aTImplicitVariable [

	<ignoreForCoverage>
	<generated>
	self visitFamixTStructuralEntity: aTImplicitVariable.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImport: aTImport [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTImport.

	self visitEntity: aTImport importingEntity.
	self visitEntity: aTImport importedEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTImportable: aTImportable [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTImportable incomingImports
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTIndexedFileNavigation: aTIndexedFileNavigation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTFileAnchor: aTIndexedFileNavigation
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTInheritance: aTInheritance [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTInheritance.

	self visitEntity: aTInheritance subclass.
	self visitEntity: aTInheritance superclass
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTInvocable: aTInvocable [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTInvocable incomingInvocations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTInvocation: aTInvocation [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTInvocation.
	self visitFamixTHasSignature: aTInvocation.

	self visitCollection: aTInvocation candidates.
	self visitEntity: aTInvocation sender.
	self visitEntity: aTInvocation receiver
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTInvocationsReceiver: aTInvocationsReceiver [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTInvocationsReceiver receivingInvocations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTLCOMMetrics: aTLCOMMetrics [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTLocalVariable: aTLocalVariable [

	<ignoreForCoverage>
	<generated>
	self visitFamixTStructuralEntity: aTLocalVariable.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTMethod: aTMethod [

	<ignoreForCoverage>
	<generated>
	self visitFamixTHasSignature: aTMethod.
	self visitFamixTInvocable: aTMethod.
	self visitFamixTMethodMetrics: aTMethod.
	"We should visit FamixTNamedEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitFamixTTypedEntity: aTMethod.
	self visitFamixTWithImplicitVariables: aTMethod.
	self visitFamixTWithLocalVariables: aTMethod.
	self visitFamixTWithParameters: aTMethod.
	self visitFamixTWithStatements: aTMethod.
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here.".


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTMethodMetrics: aTMethodMetrics [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTNamedEntity: aTNamedEntity [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTPackage: aTPackage [

	<ignoreForCoverage>
	<generated>
	self visitFamixTCanBeStub: aTPackage.
	"We should visit FamixTNamedEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here.".

	self visitCollection: aTPackage childEntities
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTPackageable: aTPackageable [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTParameter: aTParameter [

	<ignoreForCoverage>
	<generated>
	self visitFamixTStructuralEntity: aTParameter.


]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTParametricAssociation: aTParametricAssociation [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTParametricAssociation concretizations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTParametricEntity: aTParametricEntity [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTParametricEntity typeParameters
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTPrimitiveType: aTPrimitiveType [

	<ignoreForCoverage>
	<generated>
	"We should visit FamixTType but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTReference: aTReference [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAssociation: aTReference.

	self visitEntity: aTReference referencer.
	self visitEntity: aTReference referredEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTReferenceable: aTReferenceable [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTReferenceable incomingReferences
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTSourceAnchor: aTSourceAnchor [

	<ignoreForCoverage>
	<generated>
	self visitEntity: aTSourceAnchor element
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTSourceEntity: aTSourceEntity [

	<ignoreForCoverage>
	<generated>
	self visitEntity: aTSourceEntity sourceAnchor
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTSourceLanguage: aTSourceLanguage [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTSourceLanguage sourcedEntities
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTStructuralEntity: aTStructuralEntity [

	<ignoreForCoverage>
	<generated>
	self visitFamixTAccessible: aTStructuralEntity.
	self visitFamixTCanBeStub: aTStructuralEntity.
	"We should visit FamixTNamedEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	self visitFamixTTypedEntity: aTStructuralEntity.
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTThrowable: aTThrowable [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTThrowable catchingEntities.
	self visitCollection: aTThrowable declaringEntities.
	self visitCollection: aTThrowable throwingEntities
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTType: aTType [

	<ignoreForCoverage>
	<generated>
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaClass . FamixJavaEnum . FamixJavaException . FamixJavaPrimitiveType } includes: aTType class)
		ifFalse: [ self visitFamixTCanBeStub: aTType ].
	"We should visit FamixTNamedEntity but all its users in this language already visit it in their superclasses so we skip the call here.".
	"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."
	({ FamixJavaClass . FamixJavaEnum . FamixJavaException . FamixJavaPrimitiveType } includes: aTType class)
		ifFalse: [ self visitFamixTReferenceable: aTType ].
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here.".

	self visitCollection: aTType incomingTypings
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTTypeArgument: aTTypeArgument [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTTypeArgument outgoingConcretizations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTTypeParameter: aTTypeParameter [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTTypeParameter concretizations.
	self visitEntity: aTTypeParameter genericEntity
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTTypedEntity: aTTypedEntity [

	<ignoreForCoverage>
	<generated>
	self visitEntity: aTTypedEntity typing
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTUnknownVariable: aTUnknownVariable [

	<ignoreForCoverage>
	<generated>
	self visitFamixTStructuralEntity: aTUnknownVariable
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithAccesses: aTWithAccesses [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithAccesses accesses
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithAnnotationInstances: aTWithAnnotationInstances [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithAnnotationInstances annotationInstances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithAnnotationTypes: aTWithAnnotationTypes [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithAnnotationTypes definedAnnotationTypes
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithAttributes: aTWithAttributes [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithAttributes attributes
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithClasses: aTWithClasses [

	<ignoreForCoverage>
	<generated>
	self visitFamixTWithTypes: aTWithClasses
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithComments: aTWithComments [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithComments comments
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithEnumValues: aTWithEnumValues [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithEnumValues enumValues
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithExceptions: aTWithExceptions [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithExceptions caughtExceptions.
	self visitCollection: aTWithExceptions declaredExceptions.
	self visitCollection: aTWithExceptions thrownExceptions
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithImplicitVariables: aTWithImplicitVariables [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithImplicitVariables implicitVariables
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithImports: aTWithImports [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithImports imports
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithInheritances: aTWithInheritances [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithInheritances superInheritances.
	self visitCollection: aTWithInheritances subInheritances
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithInvocations: aTWithInvocations [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithInvocations outgoingInvocations
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithLocalVariables: aTWithLocalVariables [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithLocalVariables localVariables
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithMethods: aTWithMethods [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithMethods methods
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithParameters: aTWithParameters [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithParameters parameters
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithReferences: aTWithReferences [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithReferences outgoingReferences
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithStatements: aTWithStatements [

	<ignoreForCoverage>
	<generated>
	self visitFamixTCanBeStub: aTWithStatements.
	self visitFamixTWithAccesses: aTWithStatements.
	self visitFamixTWithInvocations: aTWithStatements.
	self visitFamixTWithReferences: aTWithStatements
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitFamixTWithTypes: aTWithTypes [

	<ignoreForCoverage>
	<generated>
	self visitCollection: aTWithTypes types
]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitTAssociationMetaLevelDependency: aTAssociationMetaLevelDependency [

	<ignoreForCoverage>
	<generated>

]

{ #category : 'visiting' }
FamixJavaTVisitor >> visitTEntityMetaLevelDependency: aTEntityMetaLevelDependency [

	<ignoreForCoverage>
	<generated>

]
