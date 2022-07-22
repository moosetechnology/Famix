Class {
	#name : #FamixPharoSmalltalkGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'access',
		'annotationInstance',
		'annotationInstanceAttribute',
		'annotationType',
		'annotationTypeAttribute',
		'attribute',
		'class',
		'globalVariable',
		'implicitVariable',
		'inheritance',
		'invocation',
		'localVariable',
		'method',
		'namespace',
		'package',
		'parameter',
		'reference',
		'unknownVariable',
		'pharoEntitySourceAnchor'
	],
	#category : #'Famix-PharoSmalltalk-Generator'
}

{ #category : #accessing }
FamixPharoSmalltalkGenerator class >> packageName [

	^ #'Famix-PharoSmalltalk-Entities'
]

{ #category : #accessing }
FamixPharoSmalltalkGenerator class >> prefix [

	^ #'FamixSt'
]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> defineClasses [
	super defineClasses.

	access := builder newClassNamed: #Access.
	annotationInstance := builder newClassNamed: #AnnotationInstance.
	annotationInstanceAttribute := builder newClassNamed: #AnnotationInstanceAttribute.
	annotationType := builder newClassNamed: #AnnotationType.
	annotationTypeAttribute := builder newClassNamed: #AnnotationTypeAttribute.
	attribute := builder newClassNamed: #Attribute.
	class := builder newClassNamed: #Class.
	globalVariable := builder newClassNamed: #GlobalVariable.
	implicitVariable := builder newClassNamed: #ImplicitVariable.
	inheritance := builder newClassNamed: #Inheritance.
	invocation := builder newClassNamed: #Invocation.
	localVariable := builder newClassNamed: #LocalVariable.
	pharoEntitySourceAnchor := builder newClassNamed: #PharoEntitySourceAnchor.
	method := builder newClassNamed: #Method.
	namespace := builder newClassNamed: #Namespace.
	package := builder newClassNamed: #Package.
	parameter := builder newClassNamed: #Parameter.
	reference := builder newClassNamed: #Reference.
	unknownVariable := builder newClassNamed: #UnknownVariable.

]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> defineHierarchy [

	super defineHierarchy.

	access --|> #TAccess.

	annotationInstance --|> sourcedEntity.
	annotationInstance --|> #TAnnotationInstance.
	annotationInstance --|> #TWithAnnotationInstanceAttributes.
	annotationInstance --|> #TTypedAnnotationInstance.

	annotationInstanceAttribute --|> sourcedEntity.
	annotationInstanceAttribute --|> #TAnnotationInstanceAttribute.
	annotationInstanceAttribute --|> #TTypedAnnotationInstanceAttribute.

	annotationType --|> namedEntity.
	annotationType --|> #TEntityMetaLevelDependency.
	annotationType --|> #TAnnotationType.
	annotationType --|> #TWithAttributes.

	annotationTypeAttribute --|> namedEntity.
	annotationTypeAttribute --|> #TEntityMetaLevelDependency.
	annotationTypeAttribute --|> sourcedEntity.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.
	annotationTypeAttribute --|> #TTypedAnnotationInstanceAttribute.

	attribute --|> namedEntity.
	attribute --|> #TAttribute.
	attribute --|> #TInvocationsReceiver.
	attribute --|> #TCanBeClassSide.

	class --|> namedEntity.
	self flag:
		'WithTypes should not be necessary but needed in tests like FamixMetricsTest>>testAfferentCouplingFamixClassGroup'.
	class --|> #TWithTypes.
	class --|> #TWithExceptions.
	class --|> #TClass.
	class --|> #TCanBeAbstract.
	class --|> #TClassMetrics.

	globalVariable --|> namedEntity.
	globalVariable --|> #TGlobalVariable.
	globalVariable --|> #TInvocationsReceiver.

	implicitVariable --|> namedEntity.
	implicitVariable --|> #TImplicitVariable.
	implicitVariable --|> #TInvocationsReceiver.

	inheritance --|> #TInheritance.

	invocation --|> #TInvocation.
	invocation --|> #THasSignature.

	localVariable --|> namedEntity.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TInvocationsReceiver.

	method --|> namedEntity.
	method --|> #TMethod.
	method --|> #TWithAnnotationTypes.
	method --|> #TCanBeAbstract.
	method --|> #THasKind.
	method --|> #TWithComments.
	method --|> #TWithAnnotationInstances.
	method --|> #TCanBeClassSide.

	namedEntity --|> #TPackageable.
	namedEntity --|> #TInvocationsReceiver.
	namedEntity --|> #TEntityMetaLevelDependency.
	namedEntity --|> sourcedEntity.

	namespace --|> namedEntity.
	namespace --|> #TNamespace.
	namespace --|> #TWithGlobalVariables.
	namespace --|> #TWithClasses.
	namespace --|> #TInvocationsReceiver.

	package --|> namedEntity.
	package --|> #TPackage.
	package --|> #TWithGlobalVariables.
	package --|> #TCohesionCouplingMetrics.
	package --|> #TOODependencyQueries.
	package withPrecedenceOf: #TOODependencyQueries.

	parameter --|> namedEntity.
	parameter --|> #TParameter.
	parameter --|> #TInvocationsReceiver.

	reference --|> #TReference.

	pharoEntitySourceAnchor --|> sourceAnchor.
	pharoEntitySourceAnchor --|> #TSourceAnchor.

	unknownVariable --|> namedEntity.
	unknownVariable --|> #TUnknownVariable.
	unknownVariable --|> #TInvocationsReceiver
]

{ #category : #definition }
FamixPharoSmalltalkGenerator >> defineProperties [
	super defineProperties.
	((method property: #protocol type: #String)
		comment: 'Protocol of the method'). 
]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
