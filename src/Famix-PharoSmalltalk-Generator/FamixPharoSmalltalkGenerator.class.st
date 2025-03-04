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
		'pharoEntitySourceAnchor',
		'entityTyping'
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

	access := self newClassNamed: #Access.
	annotationInstance := self newClassNamed: #AnnotationInstance.
	annotationInstanceAttribute := self newClassNamed: #AnnotationInstanceAttribute.
	annotationType := self newClassNamed: #AnnotationType.
	annotationTypeAttribute := self newClassNamed: #AnnotationTypeAttribute.
	attribute := self newClassNamed: #Attribute.
	class := self newClassNamed: #Class.
	globalVariable := self newClassNamed: #GlobalVariable.
	implicitVariable := self newClassNamed: #ImplicitVariable.
	inheritance := self newClassNamed: #Inheritance.
	invocation := self newClassNamed: #Invocation.
	localVariable := self newClassNamed: #LocalVariable.
	pharoEntitySourceAnchor := self newClassNamed: #PharoEntitySourceAnchor.
	method := self newClassNamed: #Method.
	namespace := self newClassNamed: #Namespace.
	package := self newClassNamed: #Package.
	parameter := self newClassNamed: #Parameter.
	reference := self newClassNamed: #Reference.
	entityTyping := self newClassNamed: #EntityTyping.
	unknownVariable := self newClassNamed: #UnknownVariable.

]

{ #category : #initialization }
FamixPharoSmalltalkGenerator >> defineHierarchy [

	super defineHierarchy.

	access --|> #TAccess.

	annotationInstance --|> sourcedEntity.
	annotationInstance --|> #TAnnotationInstance.

	annotationInstanceAttribute --|> sourcedEntity.
	annotationInstanceAttribute --|> #TAnnotationInstanceAttribute.

	annotationType --|> namedEntity.
	annotationType --|> #TEntityMetaLevelDependency.
	annotationType --|> #TAnnotationType.
	annotationType --|> #TWithAttributes.
	annotationType --|> #TPackageable.

	annotationTypeAttribute --|> namedEntity.
	annotationTypeAttribute --|> #TEntityMetaLevelDependency.
	annotationTypeAttribute --|> sourcedEntity.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.

	attribute --|> namedEntity.
	attribute --|> #TAttribute.
	attribute --|> #TInvocationsReceiver.
	attribute --|> #TCanBeClassSide.

	class --|> namedEntity.
	class --|> #TClass.
	class --|> #TCanBeAbstract.
	class --|> #TClassMetrics.
	class --|> #TPackageable.

	globalVariable --|> namedEntity.
	globalVariable --|> #TGlobalVariable.
	globalVariable --|> #TInvocationsReceiver.

	implicitVariable --|> namedEntity.
	implicitVariable --|> #TImplicitVariable.
	implicitVariable --|> #TInvocationsReceiver.

	inheritance --|> #TInheritance.

	invocation --|> #TInvocation.

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
	method --|> #TPackageable.

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
	package --|> #TWithClasses.
	package --|> #TCohesionCouplingMetrics.

	parameter --|> namedEntity.
	parameter --|> #TParameter.
	parameter --|> #TInvocationsReceiver.

	reference --|> #TReference.
	
	entityTyping --|> #TEntityTyping. 

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
		  withFileImport;
		  yourself
]
