"
I am a visitor for FamixJavaEntity
"
Trait {
	#name : #FamixJavaVisitor,
	#traits : 'FamixTTraitVisitor',
	#classTraits : 'FamixTTraitVisitor classTrait',
	#category : #'Famix-Java-Visitor'
}

{ #category : #visiting }
FamixJavaVisitor >> visitAccess: aFamixJavaAccess [
	<generated>
	^ self visitEntity: aFamixJavaAccess
]

{ #category : #visiting }
FamixJavaVisitor >> visitAnnotationInstance: aFamixJavaAnnotationInstance [
	<generated>
	^ self visitSourcedEntity: aFamixJavaAnnotationInstance
]

{ #category : #visiting }
FamixJavaVisitor >> visitAnnotationInstanceAttribute: aFamixJavaAnnotationInstanceAttribute [
	<generated>
	^ self visitSourcedEntity: aFamixJavaAnnotationInstanceAttribute
]

{ #category : #visiting }
FamixJavaVisitor >> visitAnnotationType: aFamixJavaAnnotationType [
	<generated>
	^ self visitType: aFamixJavaAnnotationType
]

{ #category : #visiting }
FamixJavaVisitor >> visitAnnotationTypeAttribute: aFamixJavaAnnotationTypeAttribute [
	<generated>
	^ self visitNamedEntity: aFamixJavaAnnotationTypeAttribute
]

{ #category : #visiting }
FamixJavaVisitor >> visitAttribute: aFamixJavaAttribute [
	<generated>
	^ self visitNamedEntity: aFamixJavaAttribute
]

{ #category : #visiting }
FamixJavaVisitor >> visitClass: aFamixJavaClass [
	<generated>
	^ self visitType: aFamixJavaClass
]

{ #category : #visiting }
FamixJavaVisitor >> visitComment: aFamixJavaComment [
	<generated>
	^ self visitSourcedEntity: aFamixJavaComment
]

{ #category : #visiting }
FamixJavaVisitor >> visitConcretization: aFamixJavaConcretization [
	<generated>
	^ self visitEntity: aFamixJavaConcretization
]

{ #category : #visiting }
FamixJavaVisitor >> visitContainerEntity: aFamixJavaContainerEntity [
	<generated>
	^ self visitNamedEntity: aFamixJavaContainerEntity
]

{ #category : #visiting }
FamixJavaVisitor >> visitEntity: aFamixJavaEntity [

	^aFamixJavaEntity children collect: [ :child | child accept: self ]
]

{ #category : #visiting }
FamixJavaVisitor >> visitEnum: aFamixJavaEnum [
	<generated>
	^ self visitType: aFamixJavaEnum
]

{ #category : #visiting }
FamixJavaVisitor >> visitEnumValue: aFamixJavaEnumValue [
	<generated>
	^ self visitNamedEntity: aFamixJavaEnumValue
]

{ #category : #visiting }
FamixJavaVisitor >> visitException: aFamixJavaException [
	<generated>
	^ self visitClass: aFamixJavaException
]

{ #category : #visiting }
FamixJavaVisitor >> visitImplementation: aFamixJavaImplementation [
	<generated>
	^ self visitEntity: aFamixJavaImplementation
]

{ #category : #visiting }
FamixJavaVisitor >> visitImplicitVariable: aFamixJavaImplicitVariable [
	<generated>
	^ self visitNamedEntity: aFamixJavaImplicitVariable
]

{ #category : #visiting }
FamixJavaVisitor >> visitImport: aFamixJavaImport [
	<generated>
	^ self visitEntity: aFamixJavaImport
]

{ #category : #visiting }
FamixJavaVisitor >> visitIndexedFileAnchor: aFamixJavaIndexedFileAnchor [
	<generated>
	^ self visitSourceAnchor: aFamixJavaIndexedFileAnchor
]

{ #category : #visiting }
FamixJavaVisitor >> visitInheritance: aFamixJavaInheritance [
	<generated>
	^ self visitEntity: aFamixJavaInheritance
]

{ #category : #visiting }
FamixJavaVisitor >> visitInterface: aFamixJavaInterface [
	<generated>
	^ self visitType: aFamixJavaInterface
]

{ #category : #visiting }
FamixJavaVisitor >> visitInvocation: aFamixJavaInvocation [

	^ self visitFamixTInvocation: aFamixJavaInvocation
]

{ #category : #visiting }
FamixJavaVisitor >> visitLocalVariable: aFamixJavaLocalVariable [
	<generated>
	^ self visitNamedEntity: aFamixJavaLocalVariable
]

{ #category : #visiting }
FamixJavaVisitor >> visitMethod: aFamixJavaMethod [

	self visitFamixTCanBeAbstract: aFamixJavaMethod.
	self visitFamixTCanBeClassSide: aFamixJavaMethod.
	self visitFamixTCanBeFinal: aFamixJavaMethod.
	self visitFamixTHasKind: aFamixJavaMethod.
	self visitFamixTHasVisibility: aFamixJavaMethod.
	self visitFamixTImportable: aFamixJavaMethod.
	self visitFamixTMethod: aFamixJavaMethod.
	self visitFamixTWithComments: aFamixJavaMethod.
	self visitFamixTWithExceptions: aFamixJavaMethod.
]

{ #category : #visiting }
FamixJavaVisitor >> visitMooseQueryMockSpecializedInvocation: aMooseQueryMockSpecializedInvocation [
	<generated>
	^ self visitInvocation: aMooseQueryMockSpecializedInvocation
]

{ #category : #visiting }
FamixJavaVisitor >> visitNamedEntity: aFamixJavaNamedEntity [
	<generated>
	^ self visitSourcedEntity: aFamixJavaNamedEntity
]

{ #category : #visiting }
FamixJavaVisitor >> visitPackage: aFamixJavaPackage [
	<generated>
	^ self visitContainerEntity: aFamixJavaPackage
]

{ #category : #visiting }
FamixJavaVisitor >> visitParameter: aFamixJavaParameter [
	<generated>
	^ self visitNamedEntity: aFamixJavaParameter
]

{ #category : #visiting }
FamixJavaVisitor >> visitParameterConcretization: aFamixJavaParameterConcretization [
	<generated>
	^ self visitEntity: aFamixJavaParameterConcretization
]

{ #category : #visiting }
FamixJavaVisitor >> visitParameterType: aFamixJavaParameterType [
	<generated>
	^ self visitType: aFamixJavaParameterType
]

{ #category : #visiting }
FamixJavaVisitor >> visitParametricClass: aFamixJavaParametricClass [
	<generated>
	^ self visitClass: aFamixJavaParametricClass
]

{ #category : #visiting }
FamixJavaVisitor >> visitParametricInterface: aFamixJavaParametricInterface [
	<generated>
	^ self visitInterface: aFamixJavaParametricInterface
]

{ #category : #visiting }
FamixJavaVisitor >> visitParametricMethod: aFamixJavaParametricMethod [
	<generated>
	^ self visitMethod: aFamixJavaParametricMethod
]

{ #category : #visiting }
FamixJavaVisitor >> visitPrimitiveType: aFamixJavaPrimitiveType [
	<generated>
	^ self visitType: aFamixJavaPrimitiveType
]

{ #category : #visiting }
FamixJavaVisitor >> visitReference: aFamixJavaReference [
	<generated>
	^ self visitEntity: aFamixJavaReference
]

{ #category : #visiting }
FamixJavaVisitor >> visitSourceAnchor: aFamixJavaSourceAnchor [
	<generated>
	^ self visitEntity: aFamixJavaSourceAnchor
]

{ #category : #visiting }
FamixJavaVisitor >> visitSourceLanguage: aFamixJavaSourceLanguage [
	<generated>
	^ self visitEntity: aFamixJavaSourceLanguage
]

{ #category : #visiting }
FamixJavaVisitor >> visitSourceTextAnchor: aFamixJavaSourceTextAnchor [
	<generated>
	^ self visitSourceAnchor: aFamixJavaSourceTextAnchor
]

{ #category : #visiting }
FamixJavaVisitor >> visitSourcedEntity: aFamixJavaSourcedEntity [
	<generated>
	^ self visitEntity: aFamixJavaSourcedEntity
]

{ #category : #visiting }
FamixJavaVisitor >> visitType: aFamixJavaType [
	<generated>
	^ self visitContainerEntity: aFamixJavaType
]

{ #category : #visiting }
FamixJavaVisitor >> visitUnknownVariable: aFamixJavaUnknownVariable [
	<generated>
	^ self visitNamedEntity: aFamixJavaUnknownVariable
]

{ #category : #visiting }
FamixJavaVisitor >> visitWildcard: aFamixJavaWildcard [
	<generated>
	^ self visitType: aFamixJavaWildcard
]
