"
I am a visitor for FamixJavaEntity
"
Trait {
	#name : #FamixJavaVisitor,
	#traits : 'FamixTTraitVisitor',
	#classTraits : 'FamixTTraitVisitor classTrait',
	#category : #'Famix-Java-Visitor'
}

{ #category : #'visiting - traits' }
FamixJavaVisitor >> acceptMeIfNotNil: aFamixEntity [
	<generated>

	^aFamixEntity ifNil: [ nil ] ifNotNil: [ aFamixEntity accept: self ]

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaAccess: aFamixJavaAccess [
	<generated>

	self visitFamixTAccess: aFamixJavaAccess.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaAnnotationInstance: aFamixJavaAnnotationInstance [
	<generated>

	self visitFamixTAnnotationInstance: aFamixJavaAnnotationInstance.
	self visitFamixTTypedAnnotationInstance: aFamixJavaAnnotationInstance.
	self visitFamixTWithAnnotationInstanceAttributes: aFamixJavaAnnotationInstance.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstance.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute [
	<generated>

	self visitFamixTAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute.
	self visitFamixTTypedAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute.
	self visitFamixJavaSourcedEntity: aFamixJavaAnnotationInstanceAttribute.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaAnnotationType: aFamixJavaAnnotationType [
	<generated>

	self visitFamixTAnnotationType: aFamixJavaAnnotationType.
	self visitFamixTHasVisibility: aFamixJavaAnnotationType.
	self visitFamixTImplementable: aFamixJavaAnnotationType.
	self visitFamixTPackageable: aFamixJavaAnnotationType.
	self visitFamixTWithAttributes: aFamixJavaAnnotationType.
	self visitFamixTWithComments: aFamixJavaAnnotationType.
	self visitFamixTWithInheritances: aFamixJavaAnnotationType.
	self visitFamixJavaType: aFamixJavaAnnotationType.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute [
	<generated>

	self visitFamixTAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute.
	self visitFamixTTypedAnnotationInstanceAttribute: aFamixJavaAnnotationTypeAttribute.
	self visitFamixTWithComments: aFamixJavaAnnotationTypeAttribute.
	self visitFamixJavaVariable: aFamixJavaAnnotationTypeAttribute.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaAttribute: aFamixJavaAttribute [
	<generated>

	self visitFamixJavaTCanBeTransient: aFamixJavaAttribute.
	self visitFamixJavaTCanBeVolatile: aFamixJavaAttribute.
	self visitFamixTAttribute: aFamixJavaAttribute.
	self visitFamixTCanBeClassSide: aFamixJavaAttribute.
	self visitFamixTCanBeFinal: aFamixJavaAttribute.
	self visitFamixTHasVisibility: aFamixJavaAttribute.
	self visitFamixTWithComments: aFamixJavaAttribute.
	self visitFamixJavaVariable: aFamixJavaAttribute.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaClass: aFamixJavaClass [
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
	self visitFamixTWithImports: aFamixJavaClass.
	self visitFamixJavaType: aFamixJavaClass.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaComment: aFamixJavaComment [
	<generated>

	self visitFamixTComment: aFamixJavaComment.
	self visitFamixJavaSourcedEntity: aFamixJavaComment.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaConcretization: aFamixJavaConcretization [
	<generated>

	self visitFamixTConcretization: aFamixJavaConcretization.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaContainerEntity: aFamixJavaContainerEntity [
	<generated>

	self visitFamixJavaTWithInterfaces: aFamixJavaContainerEntity.
	self visitFamixTWithAnnotationTypes: aFamixJavaContainerEntity.
	self visitFamixTWithClasses: aFamixJavaContainerEntity.
	self visitFamixJavaNamedEntity: aFamixJavaContainerEntity.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaEntity: aFamixJavaEntity [
	<generated>


]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaEnum: aFamixJavaEnum [
	<generated>

	self visitFamixTEnum: aFamixJavaEnum.
	self visitFamixTHasVisibility: aFamixJavaEnum.
	self visitFamixTImportable: aFamixJavaEnum.
	self visitFamixTWithAttributes: aFamixJavaEnum.
	self visitFamixTWithComments: aFamixJavaEnum.
	self visitFamixTWithImports: aFamixJavaEnum.
	self visitFamixTWithInheritances: aFamixJavaEnum.
	self visitFamixJavaType: aFamixJavaEnum.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaEnumValue: aFamixJavaEnumValue [
	<generated>

	self visitFamixTEnumValue: aFamixJavaEnumValue.
	self visitFamixTWithComments: aFamixJavaEnumValue.
	self visitFamixJavaVariable: aFamixJavaEnumValue.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaException: aFamixJavaException [
	<generated>

	self visitFamixTException: aFamixJavaException.
	self visitFamixTWithTypes: aFamixJavaException.
	self visitFamixJavaClass: aFamixJavaException.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaImplementation: aFamixJavaImplementation [
	<generated>

	self visitFamixTImplementation: aFamixJavaImplementation.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaImplicitVariable: aFamixJavaImplicitVariable [
	<generated>

	self visitFamixTImplicitVariable: aFamixJavaImplicitVariable.
	self visitFamixJavaVariable: aFamixJavaImplicitVariable.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaImport: aFamixJavaImport [
	<generated>

	self visitFamixTImport: aFamixJavaImport.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaImportingContext: aFamixJavaImportingContext [
	<generated>


]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaIndexedFileAnchor: aFamixJavaIndexedFileAnchor [
	<generated>

	self visitFamixTIndexedFileNavigation: aFamixJavaIndexedFileAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaIndexedFileAnchor.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaInheritance: aFamixJavaInheritance [
	<generated>

	self visitFamixTInheritance: aFamixJavaInheritance.

]

{ #category : #visiting }
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
	self visitFamixJavaType: aFamixJavaInterface.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaInvocation: aFamixJavaInvocation [
	<generated>

	self visitFamixTInvocation: aFamixJavaInvocation.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaLocalVariable: aFamixJavaLocalVariable [
	<generated>

	self visitFamixTCanBeFinal: aFamixJavaLocalVariable.
	self visitFamixTLocalVariable: aFamixJavaLocalVariable.
	self visitFamixTWithComments: aFamixJavaLocalVariable.
	self visitFamixJavaVariable: aFamixJavaLocalVariable.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaMethod: aFamixJavaMethod [
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
	self visitFamixJavaContainerEntity: aFamixJavaMethod.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaNamedEntity: aFamixJavaNamedEntity [
	<generated>

	self visitFamixTNamedEntity: aFamixJavaNamedEntity.
	self visitFamixTWithAnnotationInstances: aFamixJavaNamedEntity.
	self visitTEntityMetaLevelDependency: aFamixJavaNamedEntity.
	self visitFamixJavaSourcedEntity: aFamixJavaNamedEntity.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaPackage: aFamixJavaPackage [
	<generated>

	self visitFamixTImportable: aFamixJavaPackage.
	self visitFamixTPackage: aFamixJavaPackage.
	self visitFamixTPackageable: aFamixJavaPackage.
	self visitFamixTWithComments: aFamixJavaPackage.
	self visitFamixJavaContainerEntity: aFamixJavaPackage.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaParameter: aFamixJavaParameter [
	<generated>

	self visitFamixTCanBeFinal: aFamixJavaParameter.
	self visitFamixTParameter: aFamixJavaParameter.
	self visitFamixTWithComments: aFamixJavaParameter.
	self visitFamixJavaVariable: aFamixJavaParameter.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaParameterConcretization: aFamixJavaParameterConcretization [
	<generated>

	self visitFamixTParameterConcretization: aFamixJavaParameterConcretization.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaParameterType: aFamixJavaParameterType [
	<generated>

	self visitFamixTGenericParameterType: aFamixJavaParameterType.
	self visitFamixTThrowable: aFamixJavaParameterType.
	self visitFamixTTypedEntity: aFamixJavaParameterType.
	self visitFamixTWithInheritances: aFamixJavaParameterType.
	self visitFamixJavaType: aFamixJavaParameterType.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaParametricClass: aFamixJavaParametricClass [
	<generated>

	self visitFamixTParametricEntity: aFamixJavaParametricClass.
	self visitFamixJavaClass: aFamixJavaParametricClass.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaParametricInterface: aFamixJavaParametricInterface [
	<generated>

	self visitFamixTParametricEntity: aFamixJavaParametricInterface.
	self visitFamixJavaInterface: aFamixJavaParametricInterface.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaParametricMethod: aFamixJavaParametricMethod [
	<generated>

	self visitFamixTParametricEntity: aFamixJavaParametricMethod.
	self visitFamixJavaMethod: aFamixJavaParametricMethod.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaPrimitiveType: aFamixJavaPrimitiveType [
	<generated>

	self visitFamixTPrimitiveType: aFamixJavaPrimitiveType.
	self visitFamixJavaType: aFamixJavaPrimitiveType.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaReference: aFamixJavaReference [
	<generated>

	self visitFamixTReference: aFamixJavaReference.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaSourceAnchor: aFamixJavaSourceAnchor [
	<generated>

	self visitFamixTSourceAnchor: aFamixJavaSourceAnchor.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaSourceLanguage: aFamixJavaSourceLanguage [
	<generated>

	self visitFamixTSourceLanguage: aFamixJavaSourceLanguage.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaSourceTextAnchor: aFamixJavaSourceTextAnchor [
	<generated>

	self visitFamixTHasImmediateSource: aFamixJavaSourceTextAnchor.
	self visitFamixJavaSourceAnchor: aFamixJavaSourceTextAnchor.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaSourcedEntity: aFamixJavaSourcedEntity [
	<generated>

	self visitFamixTSourceEntity: aFamixJavaSourcedEntity.

]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTBound: aFamixJavaTBound [
	<generated>

	self visitList: aFamixJavaTBound lowerBoundedWildcards.
	self visitList: aFamixJavaTBound upperBoundedWildcards.

]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTBounded: aFamixJavaTBounded [
	<generated>

	self acceptMeIfNotNil: aFamixJavaTBounded lowerBound.
	self acceptMeIfNotNil: aFamixJavaTBounded upperBound.

]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTCanBeSynchronized: aFamixJavaTCanBeSynchronized [
	<generated>


]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTCanBeTransient: aFamixJavaTCanBeTransient [
	<generated>


]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTCanBeVolatile: aFamixJavaTCanBeVolatile [
	<generated>


]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTClassMetrics: aFamixJavaTClassMetrics [
	<generated>


]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTEntityCreator: aFamixJavaTEntityCreator [
	<generated>


]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitFamixJavaTWithInterfaces: aFamixJavaTWithInterfaces [
	<generated>

	self visitFamixTWithTypes: aFamixJavaTWithInterfaces.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaType: aFamixJavaType [
	<generated>

	self visitFamixJavaTBound: aFamixJavaType.
	self visitFamixTConcreteParameterType: aFamixJavaType.
	self visitFamixTWithMethods: aFamixJavaType.
	self visitFamixJavaContainerEntity: aFamixJavaType.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaUnknownVariable: aFamixJavaUnknownVariable [
	<generated>

	self visitFamixTUnknownVariable: aFamixJavaUnknownVariable.
	self visitFamixJavaVariable: aFamixJavaUnknownVariable.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaVariable: aFamixJavaVariable [
	<generated>

	self visitFamixTInvocationsReceiver: aFamixJavaVariable.
	self visitFamixJavaNamedEntity: aFamixJavaVariable.

]

{ #category : #visiting }
FamixJavaVisitor >> visitFamixJavaWildcard: aFamixJavaWildcard [
	<generated>

	self visitFamixJavaTBounded: aFamixJavaWildcard.
	self visitFamixJavaType: aFamixJavaWildcard.

]

{ #category : #'visiting - traits' }
FamixJavaVisitor >> visitList: aCollection [
	<generated>

	^aCollection collect: [ :each | each accept: self ]

]
