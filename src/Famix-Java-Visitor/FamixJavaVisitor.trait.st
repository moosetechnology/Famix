"
I am a visitor for FamixJavaEntity
"
Trait {
	#name : #FamixJavaVisitor,
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
FamixJavaVisitor >> visitCaughtException: aFamixJavaCaughtException [
	<generated>
	^ self visitException: aFamixJavaCaughtException
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
FamixJavaVisitor >> visitContainerEntity: aFamixJavaContainerEntity [
	<generated>
	^ self visitNamedEntity: aFamixJavaContainerEntity
]

{ #category : #visiting }
FamixJavaVisitor >> visitDeclaredException: aFamixJavaDeclaredException [
	<generated>
	^ self visitException: aFamixJavaDeclaredException
]

{ #category : #visiting }
FamixJavaVisitor >> visitEntity: aFamixJavaEntity [
	^ self subclassResponsibility
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
	^ self visitEntity: aFamixJavaException
]

{ #category : #visiting }
FamixJavaVisitor >> visitFile: aFamixJavaFile [
	<generated>
	^ self visitNamedEntity: aFamixJavaFile
]

{ #category : #visiting }
FamixJavaVisitor >> visitFolder: aFamixJavaFolder [
	<generated>
	^ self visitNamedEntity: aFamixJavaFolder
]

{ #category : #visiting }
FamixJavaVisitor >> visitGlobalVariable: aFamixJavaGlobalVariable [
	<generated>
	^ self visitNamedEntity: aFamixJavaGlobalVariable
]

{ #category : #visiting }
FamixJavaVisitor >> visitImplicitVariable: aFamixJavaImplicitVariable [
	<generated>
	^ self visitNamedEntity: aFamixJavaImplicitVariable
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
FamixJavaVisitor >> visitInvocation: aFamixJavaInvocation [
	<generated>
	^ self visitEntity: aFamixJavaInvocation
]

{ #category : #visiting }
FamixJavaVisitor >> visitLocalVariable: aFamixJavaLocalVariable [
	<generated>
	^ self visitNamedEntity: aFamixJavaLocalVariable
]

{ #category : #visiting }
FamixJavaVisitor >> visitMethod: aFamixJavaMethod [
	<generated>
	^ self visitContainerEntity: aFamixJavaMethod
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
FamixJavaVisitor >> visitNamespace: aFamixJavaNamespace [
	<generated>
	^ self visitContainerEntity: aFamixJavaNamespace
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
FamixJavaVisitor >> visitParameterType: aFamixJavaParameterType [
	<generated>
	^ self visitType: aFamixJavaParameterType
]

{ #category : #visiting }
FamixJavaVisitor >> visitParameterizableClass: aFamixJavaParameterizableClass [
	<generated>
	^ self visitClass: aFamixJavaParameterizableClass
]

{ #category : #visiting }
FamixJavaVisitor >> visitParameterizedType: aFamixJavaParameterizedType [
	<generated>
	^ self visitType: aFamixJavaParameterizedType
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
FamixJavaVisitor >> visitThrownException: aFamixJavaThrownException [
	<generated>
	^ self visitException: aFamixJavaThrownException
]

{ #category : #visiting }
FamixJavaVisitor >> visitType: aFamixJavaType [
	<generated>
	^ self visitContainerEntity: aFamixJavaType
]

{ #category : #visiting }
FamixJavaVisitor >> visitUnknownSourceLanguage: aFamixJavaUnknownSourceLanguage [
	<generated>
	^ self visitSourceLanguage: aFamixJavaUnknownSourceLanguage
]

{ #category : #visiting }
FamixJavaVisitor >> visitUnknownVariable: aFamixJavaUnknownVariable [
	<generated>
	^ self visitNamedEntity: aFamixJavaUnknownVariable
]
