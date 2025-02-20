"
An empty visitor for Famix entities

**/!\\** This was generated automatically as maximal visit (visiting all relations of all entities).
For example:
```
#visitFamixTMethod: aFamixTMethod
	aFamixTMethod parentType accept: self.

#visitFamixTWithMethods: aFamixTWithMethods
	self visitList: aFamixTWithMethods methods.
```

Using it without precaution will result in infinite visit.
Users **must redefine** some methods.
"
Trait {
	#name : #FamixTTraitVisitor,
	#category : #'Famix-Visitor'
}

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> acceptMeIfNotNil: aFamixEntity [
	<generated>

	^aFamixEntity ifNil: [ nil ] ifNotNil: [ aFamixEntity accept: self ]

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAccess: aFamixTAccess [
	<generated>

	self visitFamixTAssociation: aFamixTAccess.
	self acceptMeIfNotNil: aFamixTAccess accessor.
	self acceptMeIfNotNil: aFamixTAccess variable.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAccessible: aFamixTAccessible [
	<generated>

	self visitList: aFamixTAccessible incomingAccesses.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationInstance: aFamixTAnnotationInstance [
	<generated>

	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstance.
	self acceptMeIfNotNil: aFamixTAnnotationInstance annotatedEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationInstanceAttribute: aFamixTAnnotationInstanceAttribute [
	<generated>

	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstanceAttribute.
	self acceptMeIfNotNil: aFamixTAnnotationInstanceAttribute parentAnnotationInstance.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationType: aFamixTAnnotationType [
	<generated>

	self acceptMeIfNotNil: aFamixTAnnotationType annotationTypesContainer.
	self visitList: aFamixTAnnotationType instances.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAnnotationTypeAttribute: aFamixTAnnotationTypeAttribute [
	<generated>

	self visitFamixTAttribute: aFamixTAnnotationTypeAttribute.
	self visitList: aFamixTAnnotationTypeAttribute annotationAttributeInstances.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAssociation: aFamixTAssociation [
	<generated>

	self visitFamixTSourceEntity: aFamixTAssociation.
	self visitTAssociationMetaLevelDependency: aFamixTAssociation.
	self acceptMeIfNotNil: aFamixTAssociation next.
	self acceptMeIfNotNil: aFamixTAssociation previous.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTAttribute: aFamixTAttribute [
	<generated>

	self visitFamixTStructuralEntity: aFamixTAttribute.
	self acceptMeIfNotNil: aFamixTAttribute parentType.

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

	self visitList: aFamixTCanImplement interfaceImplementations.

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

	self visitTEntityMetaLevelDependency: aFamixTComment.
	self acceptMeIfNotNil: aFamixTComment commentedEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTCompilationUnit: aFamixTCompilationUnit [
	<generated>

	self visitFamixTFile: aFamixTCompilationUnit.
	self acceptMeIfNotNil: aFamixTCompilationUnit compilationUnitOwner.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTConcreteParameterType: aFamixTConcreteParameterType [
	<generated>

	self visitFamixTType: aFamixTConcreteParameterType.
	self visitList: aFamixTConcreteParameterType concreteEntities.
	self visitList: aFamixTConcreteParameterType generics.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTConcretization: aFamixTConcretization [
	<generated>

	self visitFamixTAssociation: aFamixTConcretization.
	self visitList: aFamixTConcretization parameterConcretizations.
	self acceptMeIfNotNil: aFamixTConcretization genericEntity.
	self acceptMeIfNotNil: aFamixTConcretization concreteEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTDefinedInModule: aFamixTDefinedInModule [
	<generated>

	self acceptMeIfNotNil: aFamixTDefinedInModule parentModule.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTDereferencedInvocation: aFamixTDereferencedInvocation [
	<generated>

	self visitFamixTInvocation: aFamixTDereferencedInvocation.
	self acceptMeIfNotNil: aFamixTDereferencedInvocation referencer.

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
	self acceptMeIfNotNil: aFamixTEnumValue parentEnum.

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
	self visitList: aFamixTFile entities.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileAnchor: aFamixTFileAnchor [
	<generated>


]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileInclude: aFamixTFileInclude [
	<generated>

	self visitFamixTAssociation: aFamixTFileInclude.
	self acceptMeIfNotNil: aFamixTFileInclude source.
	self acceptMeIfNotNil: aFamixTFileInclude target.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileNavigation: aFamixTFileNavigation [
	<generated>

	self visitFamixTFileAnchor: aFamixTFileNavigation.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFileSystemEntity: aFamixTFileSystemEntity [
	<generated>

	self acceptMeIfNotNil: aFamixTFileSystemEntity parentFolder.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTFolder: aFamixTFolder [
	<generated>

	self visitFamixTFileSystemEntity: aFamixTFolder.
	self visitList: aFamixTFolder childrenFileSystemEntities.

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
	self visitTEntityMetaLevelDependency: aFamixTFunction.
	self acceptMeIfNotNil: aFamixTFunction functionOwner.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTGenericParameterType: aFamixTGenericParameterType [
	<generated>

	self visitFamixTType: aFamixTGenericParameterType.
	self visitList: aFamixTGenericParameterType concretizations.
	self visitList: aFamixTGenericParameterType genericEntities.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTGlobalVariable: aFamixTGlobalVariable [
	<generated>

	self visitFamixTStructuralEntity: aFamixTGlobalVariable.
	self acceptMeIfNotNil: aFamixTGlobalVariable parentScope.

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
	self acceptMeIfNotNil: aFamixTHeader headerOwner.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImplementable: aFamixTImplementable [
	<generated>

	self visitList: aFamixTImplementable implementations.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImplementation: aFamixTImplementation [
	<generated>

	self visitFamixTAssociation: aFamixTImplementation.
	self acceptMeIfNotNil: aFamixTImplementation implementingClass.
	self acceptMeIfNotNil: aFamixTImplementation interface.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImplicitVariable: aFamixTImplicitVariable [
	<generated>

	self visitFamixTStructuralEntity: aFamixTImplicitVariable.
	self acceptMeIfNotNil: aFamixTImplicitVariable parentBehaviouralEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImport: aFamixTImport [
	<generated>

	self visitFamixTAssociation: aFamixTImport.
	self acceptMeIfNotNil: aFamixTImport importingEntity.
	self acceptMeIfNotNil: aFamixTImport importedEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTImportable: aFamixTImportable [
	<generated>

	self visitList: aFamixTImportable incomingImports.

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
	self acceptMeIfNotNil: aFamixTInheritance subclass.
	self acceptMeIfNotNil: aFamixTInheritance superclass.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTInvocable: aFamixTInvocable [
	<generated>

	self visitList: aFamixTInvocable incomingInvocations.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTInvocation: aFamixTInvocation [
	<generated>

	self visitFamixTAssociation: aFamixTInvocation.
	self visitFamixTHasSignature: aFamixTInvocation.
	self visitList: aFamixTInvocation candidates.
	self acceptMeIfNotNil: aFamixTInvocation receiver.
	self acceptMeIfNotNil: aFamixTInvocation sender.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTInvocationsReceiver: aFamixTInvocationsReceiver [
	<generated>

	self visitList: aFamixTInvocationsReceiver receivingInvocations.

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
	self visitTEntityMetaLevelDependency: aFamixTLambda.
	self acceptMeIfNotNil: aFamixTLambda lambdaContainer.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTLocalVariable: aFamixTLocalVariable [
	<generated>

	self visitFamixTStructuralEntity: aFamixTLocalVariable.
	self acceptMeIfNotNil: aFamixTLocalVariable parentBehaviouralEntity.

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
	self visitTEntityMetaLevelDependency: aFamixTMethod.
	self acceptMeIfNotNil: aFamixTMethod parentType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTMethodMetrics: aFamixTMethodMetrics [
	<generated>


]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTModule: aFamixTModule [
	<generated>

	self visitList: aFamixTModule moduleEntities.

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
	self visitTEntityMetaLevelDependency: aFamixTNamespace.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTPackage: aFamixTPackage [
	<generated>

	self visitFamixTCanBeStub: aFamixTPackage.
	self visitFamixTNamedEntity: aFamixTPackage.
	self visitTEntityMetaLevelDependency: aFamixTPackage.
	self visitList: aFamixTPackage childEntities.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTPackageable: aFamixTPackageable [
	<generated>

	self acceptMeIfNotNil: aFamixTPackageable parentPackage.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTParameter: aFamixTParameter [
	<generated>

	self visitFamixTStructuralEntity: aFamixTParameter.
	self acceptMeIfNotNil: aFamixTParameter parentBehaviouralEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTParameterConcretization: aFamixTParameterConcretization [
	<generated>

	self visitFamixTAssociation: aFamixTParameterConcretization.
	self visitList: aFamixTParameterConcretization concretizations.
	self acceptMeIfNotNil: aFamixTParameterConcretization genericParameter.
	self acceptMeIfNotNil: aFamixTParameterConcretization concreteParameter.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTParametricEntity: aFamixTParametricEntity [
	<generated>

	self visitList: aFamixTParametricEntity concreteParameters.
	self visitList: aFamixTParametricEntity concretizations.
	self visitList: aFamixTParametricEntity genericParameters.
	self acceptMeIfNotNil: aFamixTParametricEntity genericization.

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
	self acceptMeIfNotNil: aFamixTReference referencer.
	self acceptMeIfNotNil: aFamixTReference referredEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTReferenceable: aFamixTReferenceable [
	<generated>

	self visitList: aFamixTReferenceable incomingReferences.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTRelativeSourceAnchor: aFamixTRelativeSourceAnchor [
	<generated>

	self visitFamixTSourceAnchor: aFamixTRelativeSourceAnchor.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTShadowable: aFamixTShadowable [
	<generated>

	self visitList: aFamixTShadowable shadowingEntities.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTShadower: aFamixTShadower [
	<generated>

	self acceptMeIfNotNil: aFamixTShadower shadowedEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTSourceAnchor: aFamixTSourceAnchor [
	<generated>

	self acceptMeIfNotNil: aFamixTSourceAnchor element.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTSourceEntity: aFamixTSourceEntity [
	"Probably not necessary to visit the sourceAnchors

	<generated>

	self acceptMeIfNotNil: aFamixTSourceEntity sourceAnchor."

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTSourceLanguage: aFamixTSourceLanguage [
	<generated>

	self visitList: aFamixTSourceLanguage sourcedEntities.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTStructuralEntity: aFamixTStructuralEntity [
	<generated>

	self visitFamixTAccessible: aFamixTStructuralEntity.
	self visitFamixTCanBeStub: aFamixTStructuralEntity.
	self visitFamixTNamedEntity: aFamixTStructuralEntity.
	self visitFamixTTypedEntity: aFamixTStructuralEntity.
	self visitTEntityMetaLevelDependency: aFamixTStructuralEntity.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTemplate: aFamixTTemplate [
	<generated>

	self acceptMeIfNotNil: aFamixTTemplate templateOwner.
	self visitList: aFamixTTemplate templateUsers.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTemplateUser: aFamixTTemplateUser [
	<generated>

	self acceptMeIfNotNil: aFamixTTemplateUser template.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTThrowable: aFamixTThrowable [
	<generated>

	self visitList: aFamixTThrowable catchingEntities.
	self visitList: aFamixTThrowable declaringEntities.
	self visitList: aFamixTThrowable throwingEntities.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTrait: aFamixTTrait [
	<generated>

	self visitList: aFamixTTrait incomingTraitUsages.
	self acceptMeIfNotNil: aFamixTTrait traitOwner.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTraitUsage: aFamixTTraitUsage [
	<generated>

	self visitFamixTAssociation: aFamixTTraitUsage.
	self acceptMeIfNotNil: aFamixTTraitUsage trait.
	self acceptMeIfNotNil: aFamixTTraitUsage user.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTraitUser: aFamixTTraitUser [
	<generated>

	self visitList: aFamixTTraitUser outgoingTraitUsages.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTType: aFamixTType [
	<generated>

	self visitFamixTCanBeStub: aFamixTType.
	self visitFamixTNamedEntity: aFamixTType.
	self visitFamixTReferenceable: aFamixTType.
	self visitTEntityMetaLevelDependency: aFamixTType.
	self acceptMeIfNotNil: aFamixTType typeContainer.
	self visitList: aFamixTType typedEntities.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypeAlias: aFamixTTypeAlias [
	<generated>

	self acceptMeIfNotNil: aFamixTTypeAlias aliasedType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypedAnnotationInstance: aFamixTTypedAnnotationInstance [
	<generated>

	self acceptMeIfNotNil: aFamixTTypedAnnotationInstance annotationType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypedAnnotationInstanceAttribute: aFamixTTypedAnnotationInstanceAttribute [
	<generated>

	self acceptMeIfNotNil: aFamixTTypedAnnotationInstanceAttribute annotationTypeAttribute.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTTypedEntity: aFamixTTypedEntity [
	<generated>

	self acceptMeIfNotNil: aFamixTTypedEntity declaredType.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTUnknownVariable: aFamixTUnknownVariable [
	<generated>

	self visitFamixTStructuralEntity: aFamixTUnknownVariable.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAccesses: aFamixTWithAccesses [
	<generated>

	self visitList: aFamixTWithAccesses accesses.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAnnotationInstanceAttributes: aFamixTWithAnnotationInstanceAttributes [
	<generated>

	self visitList: aFamixTWithAnnotationInstanceAttributes attributes.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAnnotationInstances: aFamixTWithAnnotationInstances [
	<generated>

	self visitList: aFamixTWithAnnotationInstances annotationInstances.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAnnotationTypes: aFamixTWithAnnotationTypes [
	<generated>

	self visitList: aFamixTWithAnnotationTypes definedAnnotationTypes.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithAttributes: aFamixTWithAttributes [
	<generated>

	self visitList: aFamixTWithAttributes attributes.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithClasses: aFamixTWithClasses [
	<generated>

	self visitFamixTWithTypes: aFamixTWithClasses.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithComments: aFamixTWithComments [
	<generated>

	self visitList: aFamixTWithComments comments.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithCompilationUnits: aFamixTWithCompilationUnits [
	<generated>

	self acceptMeIfNotNil: aFamixTWithCompilationUnits compilationUnit.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithDereferencedInvocations: aFamixTWithDereferencedInvocations [
	<generated>

	self visitList: aFamixTWithDereferencedInvocations dereferencedInvocations.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithEnumValues: aFamixTWithEnumValues [
	<generated>

	self visitList: aFamixTWithEnumValues enumValues.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithExceptions: aFamixTWithExceptions [
	<generated>

	self visitList: aFamixTWithExceptions caughtExceptions.
	self visitList: aFamixTWithExceptions declaredExceptions.
	self visitList: aFamixTWithExceptions thrownExceptions.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithFileIncludes: aFamixTWithFileIncludes [
	<generated>

	self visitList: aFamixTWithFileIncludes incomingIncludeRelations.
	self visitList: aFamixTWithFileIncludes outgoingIncludeRelations.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithFiles: aFamixTWithFiles [
	<generated>

	self visitList: aFamixTWithFiles containerFiles.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithFunctions: aFamixTWithFunctions [
	<generated>

	self visitList: aFamixTWithFunctions functions.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithGlobalVariables: aFamixTWithGlobalVariables [
	<generated>

	self visitList: aFamixTWithGlobalVariables globalVariables.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithHeaders: aFamixTWithHeaders [
	<generated>

	self acceptMeIfNotNil: aFamixTWithHeaders header.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithImplicitVariables: aFamixTWithImplicitVariables [
	<generated>

	self visitList: aFamixTWithImplicitVariables implicitVariables.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithImports: aFamixTWithImports [
	<generated>

	self visitList: aFamixTWithImports outgoingImports.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithInheritances: aFamixTWithInheritances [
	<generated>

	self visitList: aFamixTWithInheritances superInheritances.
	self visitList: aFamixTWithInheritances subInheritances.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithInvocations: aFamixTWithInvocations [
	<generated>

	self visitList: aFamixTWithInvocations outgoingInvocations.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithLambdas: aFamixTWithLambdas [
	<generated>

	self visitList: aFamixTWithLambdas lambdas.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithLocalVariables: aFamixTWithLocalVariables [
	<generated>

	self visitList: aFamixTWithLocalVariables localVariables.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithMethods: aFamixTWithMethods [
	<generated>

	self visitList: aFamixTWithMethods methods.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithParameters: aFamixTWithParameters [
	<generated>

	self visitList: aFamixTWithParameters parameters.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithReferences: aFamixTWithReferences [
	<generated>

	self visitList: aFamixTWithReferences outgoingReferences.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithSourceLanguages: aFamixTWithSourceLanguages [
	<generated>

	self acceptMeIfNotNil: aFamixTWithSourceLanguages declaredSourceLanguage.

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

	self visitList: aFamixTWithTemplates templates.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithTraits: aFamixTWithTraits [
	<generated>

	self visitList: aFamixTWithTraits traits.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithTypeAliases: aFamixTWithTypeAliases [
	<generated>

	self visitList: aFamixTWithTypeAliases typeAliases.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitFamixTWithTypes: aFamixTWithTypes [
	<generated>

	self visitList: aFamixTWithTypes types.

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitList: aCollection [
	<generated>

	^aCollection collect: [ :each | each accept: self ]

]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitTAssociationMetaLevelDependency: aFamixEntity [
]

{ #category : #'visiting - traits' }
FamixTTraitVisitor >> visitTEntityMetaLevelDependency: aFamixEntity [
]
