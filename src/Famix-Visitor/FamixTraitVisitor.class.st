Class {
	#name : #FamixTraitVisitor,
	#superclass : #Object,
	#category : #'Famix-Visitor'
}

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAccess: aFamixTAccess [
	<generated>
	self visitFamixTAssociation: aFamixTAccess.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAccessible: aFamixTAccessible [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAnnotationInstance: aFamixTAnnotationInstance [
	<generated>
	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstance.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAnnotationInstanceAttribute: aFamixTAnnotationInstanceAttribute [
	<generated>
	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstanceAttribute.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAnnotationType: aFamixTAnnotationType [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAnnotationTypeAttribute: aFamixTAnnotationTypeAttribute [
	<generated>
	self visitFamixTAttribute: aFamixTAnnotationTypeAttribute.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAssociation: aFamixTAssociation [
	<generated>
	self visitFamixTSourceEntity: aFamixTAssociation.
	self visitTAssociationMetaLevelDependency: aFamixTAssociation.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTAttribute: aFamixTAttribute [
	<generated>
	self visitFamixTStructuralEntity: aFamixTAttribute.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTCanBeAbstract: aFamixTCanBeAbstract [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTCanBeClassSide: aFamixTCanBeClassSide [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTCanBeFinal: aFamixTCanBeFinal [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTCanBeStub: aFamixTCanBeStub [
	<generated>
	self visitFamixTSourceEntity: aFamixTCanBeStub.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTCanImplement: aFamixTCanImplement [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTClass: aFamixTClass [
	<generated>
	self visitFamixTInvocationsReceiver: aFamixTClass.
	self visitFamixTType: aFamixTClass.
	self visitFamixTWithAttributes: aFamixTClass.
	self visitFamixTWithComments: aFamixTClass.
	self visitFamixTWithInheritances: aFamixTClass.
	self visitFamixTWithMethods: aFamixTClass.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTClassMetrics: aFamixTClassMetrics [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTClassWithVisibility: aFamixTClassWithVisibility [
	<generated>
	self visitFamixTClass: aFamixTClassWithVisibility.
	self visitFamixTHasVisibility: aFamixTClassWithVisibility.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTCohesionCouplingMetrics: aFamixTCohesionCouplingMetrics [
	<generated>
	self visitFamixTPackage: aFamixTCohesionCouplingMetrics.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTComment: aFamixTComment [
	<generated>
	self visitTEntityMetaLevelDependency: aFamixTComment.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTCompilationUnit: aFamixTCompilationUnit [
	<generated>
	self visitFamixTFile: aFamixTCompilationUnit.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTConcreteParameterType: aFamixTConcreteParameterType [
	<generated>
	self visitFamixTType: aFamixTConcreteParameterType.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTConcretization: aFamixTConcretization [
	<generated>
	self visitFamixTAssociation: aFamixTConcretization.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTDefinedInModule: aFamixTDefinedInModule [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTDereferencedInvocation: aFamixTDereferencedInvocation [
	<generated>
	self visitFamixTInvocation: aFamixTDereferencedInvocation.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTEnum: aFamixTEnum [
	<generated>
	self visitFamixTType: aFamixTEnum.
	self visitFamixTWithEnumValues: aFamixTEnum.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTEnumValue: aFamixTEnumValue [
	<generated>
	self visitFamixTStructuralEntity: aFamixTEnumValue.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTException: aFamixTException [
	<generated>
	self visitFamixTClass: aFamixTException.
	self visitFamixTThrowable: aFamixTException.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTFile: aFamixTFile [
	<generated>
	self visitFamixTFileSystemEntity: aFamixTFile.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTFileAnchor: aFamixTFileAnchor [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTFileInclude: aFamixTFileInclude [
	<generated>
	self visitFamixTAssociation: aFamixTFileInclude.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTFileNavigation: aFamixTFileNavigation [
	<generated>
	self visitFamixTFileAnchor: aFamixTFileNavigation.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTFileSystemEntity: aFamixTFileSystemEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTFolder: aFamixTFolder [
	<generated>
	self visitFamixTFileSystemEntity: aFamixTFolder.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTFunction: aFamixTFunction [
	<generated>
	self visitFamixTHasSignature: aFamixTFunction.
	self visitFamixTInvocable: aFamixTFunction.
	self visitFamixTNamedEntity: aFamixTFunction.
	self visitFamixTTypedEntity: aFamixTFunction.
	self visitFamixTWithLocalVariables: aFamixTFunction.
	self visitFamixTWithParameters: aFamixTFunction.
	self visitFamixTWithStatements: aFamixTFunction.
	self visitTEntityMetaLevelDependency: aFamixTFunction.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTGenericParameterType: aFamixTGenericParameterType [
	<generated>
	self visitFamixTType: aFamixTGenericParameterType.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTGlobalVariable: aFamixTGlobalVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTGlobalVariable.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTHasImmediateSource: aFamixTHasImmediateSource [
	<generated>
	self visitFamixTSourceAnchor: aFamixTHasImmediateSource.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTHasKind: aFamixTHasKind [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTHasModifiers: aFamixTHasModifiers [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTHasSignature: aFamixTHasSignature [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTHasVisibility: aFamixTHasVisibility [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTHeader: aFamixTHeader [
	<generated>
	self visitFamixTFile: aFamixTHeader.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTImplementable: aFamixTImplementable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTImplementation: aFamixTImplementation [
	<generated>
	self visitFamixTAssociation: aFamixTImplementation.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTImplicitVariable: aFamixTImplicitVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTImplicitVariable.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTImport: aFamixTImport [
	<generated>
	self visitFamixTAssociation: aFamixTImport.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTImportable: aFamixTImportable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTIndexedFileNavigation: aFamixTIndexedFileNavigation [
	<generated>
	self visitFamixTFileAnchor: aFamixTIndexedFileNavigation.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTInheritance: aFamixTInheritance [
	<generated>
	self visitFamixTAssociation: aFamixTInheritance.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTInvocable: aFamixTInvocable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTInvocation: aFamixTInvocation [
	<generated>
	self visitFamixTAssociation: aFamixTInvocation.
	self visitFamixTHasSignature: aFamixTInvocation.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTInvocationsReceiver: aFamixTInvocationsReceiver [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTLCOMMetrics: aFamixTLCOMMetrics [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTLambda: aFamixTLambda [
	<generated>
	self visitFamixTHasSignature: aFamixTLambda.
	self visitFamixTInvocable: aFamixTLambda.
	self visitFamixTWithLocalVariables: aFamixTLambda.
	self visitFamixTWithParameters: aFamixTLambda.
	self visitFamixTWithStatements: aFamixTLambda.
	self visitTEntityMetaLevelDependency: aFamixTLambda.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTLocalVariable: aFamixTLocalVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTLocalVariable.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTMethod: aFamixTMethod [
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

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTMethodMetrics: aFamixTMethodMetrics [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTModule: aFamixTModule [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTMultipleFileAnchor: aFamixTMultipleFileAnchor [
	<generated>
	self visitFamixTSourceAnchor: aFamixTMultipleFileAnchor.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTNamedEntity: aFamixTNamedEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTNamespace: aFamixTNamespace [
	<generated>
	self visitFamixTCanBeStub: aFamixTNamespace.
	self visitFamixTNamedEntity: aFamixTNamespace.
	self visitTEntityMetaLevelDependency: aFamixTNamespace.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTPackage: aFamixTPackage [
	<generated>
	self visitFamixTCanBeStub: aFamixTPackage.
	self visitFamixTNamedEntity: aFamixTPackage.
	self visitTEntityMetaLevelDependency: aFamixTPackage.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTPackageable: aFamixTPackageable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTParameter: aFamixTParameter [
	<generated>
	self visitFamixTStructuralEntity: aFamixTParameter.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTParameterConcretization: aFamixTParameterConcretization [
	<generated>
	self visitFamixTAssociation: aFamixTParameterConcretization.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTParametricEntity: aFamixTParametricEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTPreprocessorDefine: aFamixTPreprocessorDefine [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTPreprocessorIfdef: aFamixTPreprocessorIfdef [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTPrimitiveType: aFamixTPrimitiveType [
	<generated>
	self visitFamixTType: aFamixTPrimitiveType.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTReference: aFamixTReference [
	<generated>
	self visitFamixTAssociation: aFamixTReference.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTReferenceable: aFamixTReferenceable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTRelativeSourceAnchor: aFamixTRelativeSourceAnchor [
	<generated>
	self visitFamixTSourceAnchor: aFamixTRelativeSourceAnchor.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTShadowable: aFamixTShadowable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTShadower: aFamixTShadower [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTSourceAnchor: aFamixTSourceAnchor [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTSourceEntity: aFamixTSourceEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTSourceLanguage: aFamixTSourceLanguage [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTStructuralEntity: aFamixTStructuralEntity [
	<generated>
	self visitFamixTAccessible: aFamixTStructuralEntity.
	self visitFamixTCanBeStub: aFamixTStructuralEntity.
	self visitFamixTNamedEntity: aFamixTStructuralEntity.
	self visitFamixTTypedEntity: aFamixTStructuralEntity.
	self visitTEntityMetaLevelDependency: aFamixTStructuralEntity.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTemplate: aFamixTTemplate [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTemplateUser: aFamixTTemplateUser [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTThrowable: aFamixTThrowable [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTrait: aFamixTTrait [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTraitUsage: aFamixTTraitUsage [
	<generated>
	self visitFamixTAssociation: aFamixTTraitUsage.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTraitUser: aFamixTTraitUser [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTType: aFamixTType [
	<generated>
	self visitFamixTCanBeStub: aFamixTType.
	self visitFamixTNamedEntity: aFamixTType.
	self visitFamixTReferenceable: aFamixTType.
	self visitTEntityMetaLevelDependency: aFamixTType.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTypeAlias: aFamixTTypeAlias [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTypedAnnotationInstance: aFamixTTypedAnnotationInstance [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTypedAnnotationInstanceAttribute: aFamixTTypedAnnotationInstanceAttribute [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTTypedEntity: aFamixTTypedEntity [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTUnknownVariable: aFamixTUnknownVariable [
	<generated>
	self visitFamixTStructuralEntity: aFamixTUnknownVariable.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithAccesses: aFamixTWithAccesses [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithAnnotationInstanceAttributes: aFamixTWithAnnotationInstanceAttributes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithAnnotationInstances: aFamixTWithAnnotationInstances [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithAnnotationTypes: aFamixTWithAnnotationTypes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithAttributes: aFamixTWithAttributes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithClasses: aFamixTWithClasses [
	<generated>
	self visitFamixTWithTypes: aFamixTWithClasses.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithComments: aFamixTWithComments [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithCompilationUnits: aFamixTWithCompilationUnits [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithDereferencedInvocations: aFamixTWithDereferencedInvocations [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithEnumValues: aFamixTWithEnumValues [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithExceptions: aFamixTWithExceptions [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithFileIncludes: aFamixTWithFileIncludes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithFiles: aFamixTWithFiles [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithFunctions: aFamixTWithFunctions [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithGlobalVariables: aFamixTWithGlobalVariables [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithHeaders: aFamixTWithHeaders [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithImplicitVariables: aFamixTWithImplicitVariables [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithImports: aFamixTWithImports [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithInheritances: aFamixTWithInheritances [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithInvocations: aFamixTWithInvocations [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithLambdas: aFamixTWithLambdas [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithLocalVariables: aFamixTWithLocalVariables [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithMethods: aFamixTWithMethods [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithParameters: aFamixTWithParameters [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithReferences: aFamixTWithReferences [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithSourceLanguages: aFamixTWithSourceLanguages [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithStatements: aFamixTWithStatements [
	<generated>
	self visitFamixTCanBeStub: aFamixTWithStatements.
	self visitFamixTWithAccesses: aFamixTWithStatements.
	self visitFamixTWithInvocations: aFamixTWithStatements.
	self visitFamixTWithReferences: aFamixTWithStatements.

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithTemplates: aFamixTWithTemplates [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithTraits: aFamixTWithTraits [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithTypeAliases: aFamixTWithTypeAliases [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitFamixTWithTypes: aFamixTWithTypes [
	<generated>

]

{ #category : #'visiting - traits' }
FamixTraitVisitor >> visitTEntityMetaLevelDependency: aFamixEntity [

]
