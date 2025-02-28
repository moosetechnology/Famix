"
I am a visitor for FamixEntities. 
I am generated with the metamodel.
"
Trait {
	#name : #FamixTVisitor,
	#category : #'Famix-Visitor-Trait'
}

{ #category : #meta }
FamixTVisitor classSide >> annotation [

	<FMClass: #TVisitor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visiting }
FamixTVisitor >> visitCollection: aCollection [

	<generated>
	^ aCollection collect: [ :each | each accept: self ]
]

{ #category : #visiting }
FamixTVisitor >> visitEntity: aFamixEntity [

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAccess: aFamixTAccess [

	<generated>
	self visitFamixTAssociation: aFamixTAccess.

	self visitEntity: aFamixTAccess accessor.
	self visitEntity: aFamixTAccess variable
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAccessible: aFamixTAccessible [

	<generated>
	self visitCollection: aFamixTAccessible incomingAccesses
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAnnotationInstance: aFamixTAnnotationInstance [

	<generated>
	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstance.

	self visitEntity: aFamixTAnnotationInstance annotatedEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAnnotationInstanceAttribute: aFamixTAnnotationInstanceAttribute [

	<generated>
	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstanceAttribute.

	self visitEntity: aFamixTAnnotationInstanceAttribute parentAnnotationInstance
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAnnotationType: aFamixTAnnotationType [

	<generated>
	self visitCollection: aFamixTAnnotationType instances.
	self visitEntity: aFamixTAnnotationType annotationTypesContainer
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAnnotationTypeAttribute: aFamixTAnnotationTypeAttribute [

	<generated>
	self visitFamixTAttribute: aFamixTAnnotationTypeAttribute.

	self visitCollection: aFamixTAnnotationTypeAttribute annotationAttributeInstances
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAssociation: aFamixTAssociation [

	<generated>
	self visitFamixTSourceEntity: aFamixTAssociation.
	self visitTAssociationMetaLevelDependency: aFamixTAssociation.

	self visitEntity: aFamixTAssociation previous.
	self visitEntity: aFamixTAssociation next
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTAttribute: aFamixTAttribute [

	<generated>
	self visitFamixTStructuralEntity: aFamixTAttribute.

	self visitEntity: aFamixTAttribute parentType
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTCanBeAbstract: aFamixTCanBeAbstract [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTCanBeClassSide: aFamixTCanBeClassSide [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTCanBeFinal: aFamixTCanBeFinal [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTCanBeStub: aFamixTCanBeStub [

	<generated>
	self visitFamixTSourceEntity: aFamixTCanBeStub
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTCanImplement: aFamixTCanImplement [

	<generated>
	self visitCollection: aFamixTCanImplement interfaceImplementations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTClass: aFamixTClass [

	<generated>
	self visitFamixTInvocationsReceiver: aFamixTClass.
	self visitFamixTType: aFamixTClass.
	self visitFamixTWithAttributes: aFamixTClass.
	self visitFamixTWithComments: aFamixTClass.
	self visitFamixTWithInheritances: aFamixTClass.
	self visitFamixTWithMethods: aFamixTClass
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTClassMetrics: aFamixTClassMetrics [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTClassWithVisibility: aFamixTClassWithVisibility [

	<generated>
	self visitFamixTClass: aFamixTClassWithVisibility.
	self visitFamixTHasVisibility: aFamixTClassWithVisibility
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTCohesionCouplingMetrics: aFamixTCohesionCouplingMetrics [

	<generated>
	self visitFamixTPackage: aFamixTCohesionCouplingMetrics
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTComment: aFamixTComment [

	<generated>
	self visitFamixTSourceEntity: aFamixTComment.
	self visitTEntityMetaLevelDependency: aFamixTComment.

	self visitEntity: aFamixTComment commentedEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTCompilationUnit: aFamixTCompilationUnit [

	<generated>
	self visitFamixTFile: aFamixTCompilationUnit.

	self visitEntity: aFamixTCompilationUnit compilationUnitOwner
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTConcreteType: aFamixTConcreteType [

	<generated>
	self visitCollection: aFamixTConcreteType outgoingConcretizations.
	self visitCollection: aFamixTConcreteType genericEntities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTConcretization: aFamixTConcretization [

	<generated>
	self visitFamixTAssociation: aFamixTConcretization.

	self visitEntity: aFamixTConcretization triggeringAssociation.
	self visitEntity: aFamixTConcretization concreteParameter.
	self visitEntity: aFamixTConcretization genericParameter
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTDefinedInModule: aFamixTDefinedInModule [

	<generated>
	self visitEntity: aFamixTDefinedInModule parentModule
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTDereferencedInvocation: aFamixTDereferencedInvocation [

	<generated>
	self visitFamixTInvocation: aFamixTDereferencedInvocation.

	self visitEntity: aFamixTDereferencedInvocation referencer
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTEntityTyping: aFamixTEntityTyping [

	<generated>
	self visitFamixTAssociation: aFamixTEntityTyping.

	self visitEntity: aFamixTEntityTyping typedEntity.
	self visitEntity: aFamixTEntityTyping declaredType
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTEnum: aFamixTEnum [

	<generated>
	self visitFamixTType: aFamixTEnum.
	self visitFamixTWithEnumValues: aFamixTEnum
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTEnumValue: aFamixTEnumValue [

	<generated>
	self visitFamixTStructuralEntity: aFamixTEnumValue.

	self visitEntity: aFamixTEnumValue parentEnum
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTException: aFamixTException [

	<generated>
	self visitFamixTClass: aFamixTException.
	self visitFamixTThrowable: aFamixTException
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTFile: aFamixTFile [

	<generated>
	self visitFamixTFileSystemEntity: aFamixTFile.

	self visitCollection: aFamixTFile entities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTFileAnchor: aFamixTFileAnchor [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTFileInclude: aFamixTFileInclude [

	<generated>
	self visitFamixTAssociation: aFamixTFileInclude.

	self visitEntity: aFamixTFileInclude source.
	self visitEntity: aFamixTFileInclude target
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTFileNavigation: aFamixTFileNavigation [

	<generated>
	self visitFamixTFileAnchor: aFamixTFileNavigation
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTFileSystemEntity: aFamixTFileSystemEntity [

	<generated>
	self visitEntity: aFamixTFileSystemEntity parentFolder
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTFolder: aFamixTFolder [

	<generated>
	self visitFamixTFileSystemEntity: aFamixTFolder.

	self visitCollection: aFamixTFolder childrenFileSystemEntities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTFunction: aFamixTFunction [

	<generated>
	self visitFamixTHasSignature: aFamixTFunction.
	self visitFamixTInvocable: aFamixTFunction.
	self visitFamixTNamedEntity: aFamixTFunction.
	self visitFamixTTypedEntity: aFamixTFunction.
	self visitFamixTWithLocalVariables: aFamixTFunction.
	self visitFamixTWithParameters: aFamixTFunction.
	self visitFamixTWithStatements: aFamixTFunction.
	self visitTEntityMetaLevelDependency: aFamixTFunction.

	self visitEntity: aFamixTFunction functionOwner
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTGlobalVariable: aFamixTGlobalVariable [

	<generated>
	self visitFamixTStructuralEntity: aFamixTGlobalVariable.

	self visitEntity: aFamixTGlobalVariable parentScope
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTHasImmediateSource: aFamixTHasImmediateSource [

	<generated>
	self visitFamixTSourceAnchor: aFamixTHasImmediateSource
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTHasKind: aFamixTHasKind [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTHasSignature: aFamixTHasSignature [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTHasVisibility: aFamixTHasVisibility [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTHeader: aFamixTHeader [

	<generated>
	self visitFamixTFile: aFamixTHeader.

	self visitEntity: aFamixTHeader headerOwner
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTImplementable: aFamixTImplementable [

	<generated>
	self visitCollection: aFamixTImplementable implementations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTImplementation: aFamixTImplementation [

	<generated>
	self visitFamixTAssociation: aFamixTImplementation.

	self visitEntity: aFamixTImplementation implementingClass.
	self visitEntity: aFamixTImplementation interface
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTImplicitVariable: aFamixTImplicitVariable [

	<generated>
	self visitFamixTStructuralEntity: aFamixTImplicitVariable.

	self visitEntity: aFamixTImplicitVariable parentBehaviouralEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTImport: aFamixTImport [

	<generated>
	self visitFamixTAssociation: aFamixTImport.

	self visitEntity: aFamixTImport importingEntity.
	self visitEntity: aFamixTImport importedEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTImportable: aFamixTImportable [

	<generated>
	self visitCollection: aFamixTImportable incomingImports
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTIndexedFileNavigation: aFamixTIndexedFileNavigation [

	<generated>
	self visitFamixTFileAnchor: aFamixTIndexedFileNavigation
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTInheritance: aFamixTInheritance [

	<generated>
	self visitFamixTAssociation: aFamixTInheritance.

	self visitEntity: aFamixTInheritance subclass.
	self visitEntity: aFamixTInheritance superclass
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTInvocable: aFamixTInvocable [

	<generated>
	self visitCollection: aFamixTInvocable incomingInvocations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTInvocation: aFamixTInvocation [

	<generated>
	self visitFamixTAssociation: aFamixTInvocation.
	self visitFamixTHasSignature: aFamixTInvocation.

	self visitCollection: aFamixTInvocation candidates.
	self visitEntity: aFamixTInvocation sender.
	self visitEntity: aFamixTInvocation receiver
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTInvocationsReceiver: aFamixTInvocationsReceiver [

	<generated>
	self visitCollection: aFamixTInvocationsReceiver receivingInvocations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTLCOMMetrics: aFamixTLCOMMetrics [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTLambda: aFamixTLambda [

	<generated>
	self visitFamixTHasSignature: aFamixTLambda.
	self visitFamixTInvocable: aFamixTLambda.
	self visitFamixTWithLocalVariables: aFamixTLambda.
	self visitFamixTWithParameters: aFamixTLambda.
	self visitFamixTWithStatements: aFamixTLambda.
	self visitTEntityMetaLevelDependency: aFamixTLambda.

	self visitEntity: aFamixTLambda lambdaContainer
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTLocalVariable: aFamixTLocalVariable [

	<generated>
	self visitFamixTStructuralEntity: aFamixTLocalVariable.

	self visitEntity: aFamixTLocalVariable parentBehaviouralEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTMethod: aFamixTMethod [

	<generated>
	self visitFamixTHasSignature: aFamixTMethod.
	self visitFamixTInvocable: aFamixTMethod.
	self visitFamixTMethodMetrics: aFamixTMethod.
	self visitFamixTNamedEntity: aFamixTMethod.
	self visitFamixTTypedEntity: aFamixTMethod.
	self visitFamixTWithImplicitVariables: aFamixTMethod.
	self visitFamixTWithLocalVariables: aFamixTMethod.
	self visitFamixTWithParameters: aFamixTMethod.
	self visitFamixTWithStatements: aFamixTMethod.
	self visitTEntityMetaLevelDependency: aFamixTMethod.

	self visitEntity: aFamixTMethod parentType
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTMethodMetrics: aFamixTMethodMetrics [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTModule: aFamixTModule [

	<generated>
	self visitCollection: aFamixTModule moduleEntities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTMultipleFileAnchor: aFamixTMultipleFileAnchor [

	<generated>
	self visitFamixTSourceAnchor: aFamixTMultipleFileAnchor
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTNamedEntity: aFamixTNamedEntity [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTNamespace: aFamixTNamespace [

	<generated>
	self visitFamixTCanBeStub: aFamixTNamespace.
	self visitFamixTNamedEntity: aFamixTNamespace.
	self visitTEntityMetaLevelDependency: aFamixTNamespace
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTPackage: aFamixTPackage [

	<generated>
	self visitFamixTCanBeStub: aFamixTPackage.
	self visitFamixTNamedEntity: aFamixTPackage.
	self visitTEntityMetaLevelDependency: aFamixTPackage.

	self visitCollection: aFamixTPackage childEntities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTPackageable: aFamixTPackageable [

	<generated>
	self visitEntity: aFamixTPackageable parentPackage
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTParameter: aFamixTParameter [

	<generated>
	self visitFamixTStructuralEntity: aFamixTParameter.

	self visitEntity: aFamixTParameter parentBehaviouralEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTParametricAssociation: aFamixTParametricAssociation [

	<generated>
	self visitCollection: aFamixTParametricAssociation concretization
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTParametricEntity: aFamixTParametricEntity [

	<generated>
	self visitCollection: aFamixTParametricEntity typeParameters
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTPreprocessorDefine: aFamixTPreprocessorDefine [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTPreprocessorIfdef: aFamixTPreprocessorIfdef [

	<generated>

]

{ #category : #visiting }
FamixTVisitor >> visitFamixTPrimitiveType: aFamixTPrimitiveType [

	<generated>
	self visitFamixTType: aFamixTPrimitiveType
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTReference: aFamixTReference [

	<generated>
	self visitFamixTAssociation: aFamixTReference.

	self visitEntity: aFamixTReference referencer.
	self visitEntity: aFamixTReference referredEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTReferenceable: aFamixTReferenceable [

	<generated>
	self visitCollection: aFamixTReferenceable incomingReferences
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTRelativeSourceAnchor: aFamixTRelativeSourceAnchor [

	<generated>
	self visitFamixTSourceAnchor: aFamixTRelativeSourceAnchor
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTShadowable: aFamixTShadowable [

	<generated>
	self visitEntity: aFamixTShadowable shadowingEntities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTShadower: aFamixTShadower [

	<generated>
	self visitEntity: aFamixTShadower shadowedEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTSourceAnchor: aFamixTSourceAnchor [

	<generated>
	self visitEntity: aFamixTSourceAnchor element
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTSourceEntity: aFamixTSourceEntity [

	<generated>
	self visitEntity: aFamixTSourceEntity sourceAnchor
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTSourceLanguage: aFamixTSourceLanguage [

	<generated>
	self visitCollection: aFamixTSourceLanguage sourcedEntities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTStructuralEntity: aFamixTStructuralEntity [

	<generated>
	self visitFamixTAccessible: aFamixTStructuralEntity.
	self visitFamixTCanBeStub: aFamixTStructuralEntity.
	self visitFamixTNamedEntity: aFamixTStructuralEntity.
	self visitFamixTTypedEntity: aFamixTStructuralEntity.
	self visitTEntityMetaLevelDependency: aFamixTStructuralEntity
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTemplate: aFamixTTemplate [

	<generated>
	self visitEntity: aFamixTTemplate templateOwner.
	self visitCollection: aFamixTTemplate templateUsers
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTemplateUser: aFamixTTemplateUser [

	<generated>
	self visitEntity: aFamixTTemplateUser template
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTThrowable: aFamixTThrowable [

	<generated>
	self visitCollection: aFamixTThrowable catchingEntities.
	self visitCollection: aFamixTThrowable declaringEntities.
	self visitCollection: aFamixTThrowable throwingEntities
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTrait: aFamixTTrait [

	<generated>
	self visitEntity: aFamixTTrait traitOwner.
	self visitCollection: aFamixTTrait incomingTraitUsages
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTraitUsage: aFamixTTraitUsage [

	<generated>
	self visitFamixTAssociation: aFamixTTraitUsage.

	self visitEntity: aFamixTTraitUsage trait.
	self visitEntity: aFamixTTraitUsage user
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTraitUser: aFamixTTraitUser [

	<generated>
	self visitCollection: aFamixTTraitUser outgoingTraitUsages
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTType: aFamixTType [

	<generated>
	self visitFamixTCanBeStub: aFamixTType.
	self visitFamixTNamedEntity: aFamixTType.
	self visitFamixTReferenceable: aFamixTType.
	self visitTEntityMetaLevelDependency: aFamixTType.

	self visitEntity: aFamixTType typeContainer.
	self visitCollection: aFamixTType incomingTypings
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTypeAlias: aFamixTTypeAlias [

	<generated>
	self visitEntity: aFamixTTypeAlias aliasedType
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTypeParameter: aFamixTTypeParameter [

	<generated>
	self visitCollection: aFamixTTypeParameter concretizations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTypedAnnotationInstance: aFamixTTypedAnnotationInstance [

	<generated>
	self visitEntity: aFamixTTypedAnnotationInstance annotationType
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTypedAnnotationInstanceAttribute: aFamixTTypedAnnotationInstanceAttribute [

	<generated>
	self visitEntity: aFamixTTypedAnnotationInstanceAttribute annotationTypeAttribute
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTTypedEntity: aFamixTTypedEntity [

	<generated>
	self visitEntity: aFamixTTypedEntity typing
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTUnknownVariable: aFamixTUnknownVariable [

	<generated>
	self visitFamixTStructuralEntity: aFamixTUnknownVariable
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithAccesses: aFamixTWithAccesses [

	<generated>
	self visitCollection: aFamixTWithAccesses accesses
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithAnnotationInstanceAttributes: aFamixTWithAnnotationInstanceAttributes [

	<generated>
	self visitCollection: aFamixTWithAnnotationInstanceAttributes attributes
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithAnnotationInstances: aFamixTWithAnnotationInstances [

	<generated>
	self visitCollection: aFamixTWithAnnotationInstances annotationInstances
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithAnnotationTypes: aFamixTWithAnnotationTypes [

	<generated>
	self visitCollection: aFamixTWithAnnotationTypes definedAnnotationTypes
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithAttributes: aFamixTWithAttributes [

	<generated>
	self visitCollection: aFamixTWithAttributes attributes
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithClasses: aFamixTWithClasses [

	<generated>
	self visitFamixTWithTypes: aFamixTWithClasses
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithComments: aFamixTWithComments [

	<generated>
	self visitCollection: aFamixTWithComments comments
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithCompilationUnits: aFamixTWithCompilationUnits [

	<generated>
	self visitEntity: aFamixTWithCompilationUnits compilationUnit
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithDereferencedInvocations: aFamixTWithDereferencedInvocations [

	<generated>
	self visitCollection: aFamixTWithDereferencedInvocations dereferencedInvocations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithEnumValues: aFamixTWithEnumValues [

	<generated>
	self visitCollection: aFamixTWithEnumValues enumValues
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithExceptions: aFamixTWithExceptions [

	<generated>
	self visitCollection: aFamixTWithExceptions caughtExceptions.
	self visitCollection: aFamixTWithExceptions declaredExceptions.
	self visitCollection: aFamixTWithExceptions thrownExceptions
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithFileIncludes: aFamixTWithFileIncludes [

	<generated>
	self visitCollection: aFamixTWithFileIncludes outgoingIncludeRelations.
	self visitCollection: aFamixTWithFileIncludes incomingIncludeRelations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithFiles: aFamixTWithFiles [

	<generated>
	self visitCollection: aFamixTWithFiles containerFiles
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithFunctions: aFamixTWithFunctions [

	<generated>
	self visitCollection: aFamixTWithFunctions functions
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithGlobalVariables: aFamixTWithGlobalVariables [

	<generated>
	self visitCollection: aFamixTWithGlobalVariables globalVariables
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithHeaders: aFamixTWithHeaders [

	<generated>
	self visitEntity: aFamixTWithHeaders header
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithImplicitVariables: aFamixTWithImplicitVariables [

	<generated>
	self visitCollection: aFamixTWithImplicitVariables implicitVariables
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithImports: aFamixTWithImports [

	<generated>
	self visitCollection: aFamixTWithImports outgoingImports
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithInheritances: aFamixTWithInheritances [

	<generated>
	self visitCollection: aFamixTWithInheritances superInheritances.
	self visitCollection: aFamixTWithInheritances subInheritances
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithInvocations: aFamixTWithInvocations [

	<generated>
	self visitCollection: aFamixTWithInvocations outgoingInvocations
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithLambdas: aFamixTWithLambdas [

	<generated>
	self visitCollection: aFamixTWithLambdas lambdas
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithLocalVariables: aFamixTWithLocalVariables [

	<generated>
	self visitCollection: aFamixTWithLocalVariables localVariables
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithMethods: aFamixTWithMethods [

	<generated>
	self visitCollection: aFamixTWithMethods methods
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithParameters: aFamixTWithParameters [

	<generated>
	self visitCollection: aFamixTWithParameters parameters
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithReferences: aFamixTWithReferences [

	<generated>
	self visitCollection: aFamixTWithReferences outgoingReferences
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithSourceLanguages: aFamixTWithSourceLanguages [

	<generated>
	self visitEntity: aFamixTWithSourceLanguages declaredSourceLanguage
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithStatements: aFamixTWithStatements [

	<generated>
	self visitFamixTCanBeStub: aFamixTWithStatements.
	self visitFamixTWithAccesses: aFamixTWithStatements.
	self visitFamixTWithInvocations: aFamixTWithStatements.
	self visitFamixTWithReferences: aFamixTWithStatements
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithTemplates: aFamixTWithTemplates [

	<generated>
	self visitCollection: aFamixTWithTemplates templates
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithTraits: aFamixTWithTraits [

	<generated>
	self visitCollection: aFamixTWithTraits traits
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithTypeAliases: aFamixTWithTypeAliases [

	<generated>
	self visitCollection: aFamixTWithTypeAliases typeAliases
]

{ #category : #visiting }
FamixTVisitor >> visitFamixTWithTypes: aFamixTWithTypes [

	<generated>
	self visitCollection: aFamixTWithTypes types
]

{ #category : #visiting }
FamixTVisitor >> visitTEntityMetaLevelDependency: aFamixEntity [
	"This method is not generated to avoid complexify the visitor generation"

	
]
