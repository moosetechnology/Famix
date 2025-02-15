Trait {
	#name : #FamixTTraitVisitor,
	#category : #'Famix-Visitor'
}

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAccess: aFamixTAccess [
	<generated>
	self visitFamixTAssociation: aFamixTAccess.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAccessible: aFamixTAccessible [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationInstance: aFamixTAnnotationInstance [
	<generated>
	self visitFamixTEntityMetaLevelDependency: aFamixTAnnotationInstance.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationInstanceAttribute: aFamixTAnnotationInstanceAttribute [
	<generated>
	self visitFamixTEntityMetaLevelDependency: aFamixTAnnotationInstanceAttribute.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationType: aFamixTAnnotationType [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationTypeAttribute: aFamixTAnnotationTypeAttribute [
	<generated>
	self visitFamixTAttribute: aFamixTAnnotationTypeAttribute.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAssociation: aFamixTAssociation [
	<generated>
	self visitFamixTSourceEntity: aFamixTAssociation.
	self visitFamixTAssociationMetaLevelDependency: aFamixTAssociation.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAssociationMetaLevelDependency: FamixEntity [
]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAttribute: aFamixTAttribute [
	<generated>
	self visitFamixTStructuralEntity: aFamixTAttribute.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCanBeAbstract: aFamixTCanBeAbstract [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCanBeClassSide: aFamixTCanBeClassSide [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCanBeFinal: aFamixTCanBeFinal [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCanBeStub: aFamixTCanBeStub [
	<generated>
	self visitFamixTSourceEntity: aFamixTCanBeStub.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCanImplement: aFamixTCanImplement [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTClass: aFamixTClass [
	<generated>
	self visitFamixTInvocationsReceiver: aFamixTClass.
	self visitFamixTType: aFamixTClass.
	self visitFamixTWithAttributes: aFamixTClass.
	self visitFamixTWithComments: aFamixTClass.
	self visitFamixTWithInheritances: aFamixTClass.
	self visitFamixTWithMethods: aFamixTClass.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTClassMetrics: aFamixTClassMetrics [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTClassWithVisibility: aFamixTClassWithVisibility [
	<generated>
	self visitFamixTClass: aFamixTClassWithVisibility.
	self visitFamixTHasVisibility: aFamixTClassWithVisibility.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCohesionCouplingMetrics: aFamixTCohesionCouplingMetrics [
	<generated>
	self visitFamixTPackage: aFamixTCohesionCouplingMetrics.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTComment: aFamixTComment [
	<generated>
	self visitFamixTEntityMetaLevelDependency: aFamixTComment.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCompilationUnit: aFamixTCompilationUnit [
	<generated>
	self visitFamixTFile: aFamixTCompilationUnit.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTConcreteParameterType: aFamixTConcreteParameterType [
	<generated>
	self visitFamixTType: aFamixTConcreteParameterType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTConcretization: aFamixTConcretization [
	<generated>
	self visitFamixTAssociation: aFamixTConcretization.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTDefinedInModule: aFamixTDefinedInModule [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTDereferencedInvocation: aFamixTDereferencedInvocation [
	<generated>
	self visitFamixTInvocation: aFamixTDereferencedInvocation.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTEntityMetaLevelDependency: FamixEntity [
]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTEnum: aFamixTEnum [
	<generated>
	self visitFamixTType: aFamixTEnum.
	self visitFamixTWithEnumValues: aFamixTEnum.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTEnumValue: aFamixTEnumValue [
	<generated>
	self visitFamixTStructuralEntity: aFamixTEnumValue.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTException: aFamixTException [
	<generated>
	self visitFamixTClass: aFamixTException.
	self visitFamixTThrowable: aFamixTException.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFile: aFamixTFile [
	<generated>
	self visitFamixTFileSystemEntity: aFamixTFile.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileAnchor: aFamixTFileAnchor [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileInclude: aFamixTFileInclude [
	<generated>
	self visitFamixTAssociation: aFamixTFileInclude.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileNavigation: aFamixTFileNavigation [
	<generated>
	self visitFamixTFileAnchor: aFamixTFileNavigation.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileSystemEntity: aFamixTFileSystemEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFolder: aFamixTFolder [
	<generated>
	self visitFamixTFileSystemEntity: aFamixTFolder.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFunction: aFamixTFunction [
	<generated>
	self visitFamixTHasSignature: aFamixTFunction.
	self visitFamixTInvocable: aFamixTFunction.
	self visitFamixTNamedEntity: aFamixTFunction.
	self visitFamixTTypedEntity: aFamixTFunction.
	self visitFamixTWithLocalVariables: aFamixTFunction.
	self visitFamixTWithParameters: aFamixTFunction.
	self visitFamixTWithStatements: aFamixTFunction.
	self visitFamixTEntityMetaLevelDependency: aFamixTFunction.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTGenericParameterType: aFamixTGenericParameterType [
	<generated>
	self visitFamixTType: aFamixTGenericParameterType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTGlobalVariable: aFamixTGlobalVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTGlobalVariable.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTHasImmediateSource: aFamixTHasImmediateSource [
	<generated>
	self visitFamixTSourceAnchor: aFamixTHasImmediateSource.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTHasKind: aFamixTHasKind [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTHasModifiers: aFamixTHasModifiers [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTHasSignature: aFamixTHasSignature [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTHasVisibility: aFamixTHasVisibility [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTHeader: aFamixTHeader [
	<generated>
	self visitFamixTFile: aFamixTHeader.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImplementable: aFamixTImplementable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImplementation: aFamixTImplementation [
	<generated>
	self visitFamixTAssociation: aFamixTImplementation.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImplicitVariable: aFamixTImplicitVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTImplicitVariable.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImport: aFamixTImport [
	<generated>
	self visitFamixTAssociation: aFamixTImport.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImportable: aFamixTImportable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTIndexedFileNavigation: aFamixTIndexedFileNavigation [
	<generated>
	self visitFamixTFileAnchor: aFamixTIndexedFileNavigation.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTInheritance: aFamixTInheritance [
	<generated>
	self visitFamixTAssociation: aFamixTInheritance.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTInvocable: aFamixTInvocable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTInvocation: aFamixTInvocation [
	<generated>
	self visitFamixTAssociation: aFamixTInvocation.
	self visitFamixTHasSignature: aFamixTInvocation.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTInvocationsReceiver: aFamixTInvocationsReceiver [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTLCOMMetrics: aFamixTLCOMMetrics [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTLambda: aFamixTLambda [
	<generated>
	self visitFamixTHasSignature: aFamixTLambda.
	self visitFamixTInvocable: aFamixTLambda.
	self visitFamixTWithLocalVariables: aFamixTLambda.
	self visitFamixTWithParameters: aFamixTLambda.
	self visitFamixTWithStatements: aFamixTLambda.
	self visitFamixTEntityMetaLevelDependency: aFamixTLambda.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTLocalVariable: aFamixTLocalVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTLocalVariable.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTMethod: aFamixTMethod [
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
	self visitFamixTEntityMetaLevelDependency: aFamixTMethod.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTMethodMetrics: aFamixTMethodMetrics [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTModule: aFamixTModule [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTMultipleFileAnchor: aFamixTMultipleFileAnchor [
	<generated>
	self visitFamixTSourceAnchor: aFamixTMultipleFileAnchor.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTNamedEntity: aFamixTNamedEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTNamespace: aFamixTNamespace [
	<generated>
	self visitFamixTCanBeStub: aFamixTNamespace.
	self visitFamixTNamedEntity: aFamixTNamespace.
	self visitFamixTEntityMetaLevelDependency: aFamixTNamespace.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTPackage: aFamixTPackage [
	<generated>
	self visitFamixTCanBeStub: aFamixTPackage.
	self visitFamixTNamedEntity: aFamixTPackage.
	self visitFamixTEntityMetaLevelDependency: aFamixTPackage.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTPackageable: aFamixTPackageable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTParameter: aFamixTParameter [
	<generated>
	self visitFamixTStructuralEntity: aFamixTParameter.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTParameterConcretization: aFamixTParameterConcretization [
	<generated>
	self visitFamixTAssociation: aFamixTParameterConcretization.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTParametricEntity: aFamixTParametricEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTPreprocessorDefine: aFamixTPreprocessorDefine [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTPreprocessorIfdef: aFamixTPreprocessorIfdef [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTPrimitiveType: aFamixTPrimitiveType [
	<generated>
	self visitFamixTType: aFamixTPrimitiveType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTReference: aFamixTReference [
	<generated>
	self visitFamixTAssociation: aFamixTReference.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTReferenceable: aFamixTReferenceable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTRelativeSourceAnchor: aFamixTRelativeSourceAnchor [
	<generated>
	self visitFamixTSourceAnchor: aFamixTRelativeSourceAnchor.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTShadowable: aFamixTShadowable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTShadower: aFamixTShadower [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTSourceAnchor: aFamixTSourceAnchor [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTSourceEntity: aFamixTSourceEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTSourceLanguage: aFamixTSourceLanguage [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTStructuralEntity: aFamixTStructuralEntity [
	<generated>
	self visitFamixTAccessible: aFamixTStructuralEntity.
	self visitFamixTCanBeStub: aFamixTStructuralEntity.
	self visitFamixTNamedEntity: aFamixTStructuralEntity.
	self visitFamixTTypedEntity: aFamixTStructuralEntity.
	self visitFamixTEntityMetaLevelDependency: aFamixTStructuralEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTemplate: aFamixTTemplate [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTemplateUser: aFamixTTemplateUser [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTThrowable: aFamixTThrowable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTrait: aFamixTTrait [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTraitUsage: aFamixTTraitUsage [
	<generated>
	self visitFamixTAssociation: aFamixTTraitUsage.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTraitUser: aFamixTTraitUser [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTType: aFamixTType [
	<generated>
	self visitFamixTCanBeStub: aFamixTType.
	self visitFamixTNamedEntity: aFamixTType.
	self visitFamixTReferenceable: aFamixTType.
	self visitFamixTEntityMetaLevelDependency: aFamixTType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypeAlias: aFamixTTypeAlias [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypedAnnotationInstance: aFamixTTypedAnnotationInstance [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypedAnnotationInstanceAttribute: aFamixTTypedAnnotationInstanceAttribute [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypedEntity: aFamixTTypedEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTUnknownVariable: aFamixTUnknownVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTUnknownVariable.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAccesses: aFamixTWithAccesses [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAnnotationInstanceAttributes: aFamixTWithAnnotationInstanceAttributes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAnnotationInstances: aFamixTWithAnnotationInstances [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAnnotationTypes: aFamixTWithAnnotationTypes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAttributes: aFamixTWithAttributes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithClasses: aFamixTWithClasses [
	<generated>
	self visitFamixTWithTypes: aFamixTWithClasses.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithComments: aFamixTWithComments [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithCompilationUnits: aFamixTWithCompilationUnits [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithDereferencedInvocations: aFamixTWithDereferencedInvocations [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithEnumValues: aFamixTWithEnumValues [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithExceptions: aFamixTWithExceptions [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithFileIncludes: aFamixTWithFileIncludes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithFiles: aFamixTWithFiles [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithFunctions: aFamixTWithFunctions [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithGlobalVariables: aFamixTWithGlobalVariables [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithHeaders: aFamixTWithHeaders [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithImplicitVariables: aFamixTWithImplicitVariables [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithImports: aFamixTWithImports [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithInheritances: aFamixTWithInheritances [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithInvocations: aFamixTWithInvocations [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithLambdas: aFamixTWithLambdas [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithLocalVariables: aFamixTWithLocalVariables [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithMethods: aFamixTWithMethods [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithParameters: aFamixTWithParameters [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithReferences: aFamixTWithReferences [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithSourceLanguages: aFamixTWithSourceLanguages [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithStatements: aFamixTWithStatements [
	<generated>
	self visitFamixTCanBeStub: aFamixTWithStatements.
	self visitFamixTWithAccesses: aFamixTWithStatements.
	self visitFamixTWithInvocations: aFamixTWithStatements.
	self visitFamixTWithReferences: aFamixTWithStatements.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithTemplates: aFamixTWithTemplates [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithTraits: aFamixTWithTraits [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithTypeAliases: aFamixTWithTypeAliases [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithTypes: aFamixTWithTypes [
	<generated>

]
