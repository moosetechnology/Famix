Class {
	#name : #FamixJavaGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'access',
		'annotationInstance',
		'annotationInstanceAttribute',
		'annotationType',
		'annotationTypeAttribute',
		'attribute',
		'caughtException',
		'class',
		'containerEntity',
		'declaredException',
		'enum',
		'enumValue',
		'exception',
		'globalVariable',
		'implicitVariable',
		'inheritance',
		'invocation',
		'localVariable',
		'method',
		'package',
		'parameter',
		'parameterType',
		'parameterizableClass',
		'primitiveType',
		'reference',
		'thrownException',
		'type',
		'unknownVariable',
		'parameterizedType',
		'file',
		'folder',
		'indexedFileAnchor',
		'tCanBeVolatile',
		'tCanBeTransient',
		'tCanBeSynchronized',
		'tJavaClassMetrics',
		'interface'
	],
	#category : #'Famix-Java-Generator'
}

{ #category : #accessing }
FamixJavaGenerator class >> packageName [

	^ #'Famix-Java-Entities'
]

{ #category : #accessing }
FamixJavaGenerator class >> prefix [

	^ #'FamixJava'
]

{ #category : #definition }
FamixJavaGenerator >> commentForTCanBeSynchronized [
	^ 'I allow an entity to be synchronized
ex:

```java
public class SynchronizedCounter {
    private int c = 0;

    public synchronized void increment() {
        c++;
    }
}
```'
]

{ #category : #definition }
FamixJavaGenerator >> commentForTCanBeTransient [
	^ 'I allow an entity to be transient
ex:

```java
public class Student implements Serializable{  
 transient int age; //Now it will not be serialized  
}  
```'
]

{ #category : #definition }
FamixJavaGenerator >> commentForTCanBeVolatile [
	^ 'I allow an entity to be volatible
ex:

```java
public class SharedObject {
    public volatile int counter = 0;
}
```'
]

{ #category : #definition }
FamixJavaGenerator >> commentForTInterface [
	'I correspond to an interface'

]

{ #category : #definition }
FamixJavaGenerator >> defineClasses [
	super defineClasses.

	access := builder newClassNamed: #Access.
	annotationInstance := builder newClassNamed: #AnnotationInstance.
	annotationInstanceAttribute := builder newClassNamed: #AnnotationInstanceAttribute.
	annotationType := builder newClassNamed: #AnnotationType.
	annotationTypeAttribute := builder newClassNamed: #AnnotationTypeAttribute.
	attribute := builder newClassNamed: #Attribute.
	caughtException := builder newClassNamed: #CaughtException.
	class := builder newClassNamed: #Class.
	interface := builder newClassNamed: #Interface.
	containerEntity := builder newClassNamed: #ContainerEntity.
	declaredException := builder newClassNamed: #DeclaredException.
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	exception := builder newClassNamed: #Exception.
	file := builder newClassNamed: #File.
	folder := builder newClassNamed: #Folder.
	globalVariable := builder newClassNamed: #GlobalVariable.
	implicitVariable := builder newClassNamed: #ImplicitVariable.
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.
	inheritance := builder newClassNamed: #Inheritance.
	invocation := builder newClassNamed: #Invocation.
	localVariable := builder newClassNamed: #LocalVariable.
	method := builder newClassNamed: #Method.
	package := builder newClassNamed: #Package.
	parameter := builder newClassNamed: #Parameter.
	parameterType := builder newClassNamed: #ParameterType.
	parameterizableClass := builder newClassNamed: #ParameterizableClass.
	parameterizedType := builder newClassNamed: #ParameterizedType.
	primitiveType := builder newClassNamed: #PrimitiveType.
	reference := builder newClassNamed: #Reference.
	thrownException := builder newClassNamed: #ThrownException.
	type := builder newClassNamed: #Type.
	unknownVariable := builder newClassNamed: #UnknownVariable.
	primitiveType withTesting.

	self defineComments
]

{ #category : #definition }
FamixJavaGenerator >> defineComments [
	(builder ensureClassNamed: #Entity)
		comment:
			'file := ''ArgoUML-0-34.mse'' asFileReference readStream.

repo := MooseModel importFrom: file withMetamodel: FamixJavaModel metamodel.

model := MooseModel new.
model silentlyAddAll: repo elements.
model entityStorage forRuntime.
model'
]

{ #category : #definition }
FamixJavaGenerator >> defineHierarchy [
	super defineHierarchy.

	access --|> #TAccess.

	annotationInstance --|> sourcedEntity.
	annotationInstance --|> #TAnnotationInstance.
	annotationInstance --|> #TWithAnnotationInstanceAttributes.
	annotationInstance --|> #TTypedAnnotationInstance.

	annotationInstanceAttribute --|> sourcedEntity.
	annotationInstanceAttribute --|> #TAnnotationInstanceAttribute.
	annotationInstanceAttribute --|> #TTypedAnnotationInstanceAttribute.

	annotationType --|> type.
	annotationType --|> #TAnnotationType.
	annotationType --|> #TWithAttributes.
	annotationType --|> #TWithInheritances.
	annotationType --|> #TPackageable.
	annotationType --|> #TWithComments.
	annotationType --|> #THasVisibility.

	annotationTypeAttribute --|> namedEntity.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.
	annotationTypeAttribute --|> #TTypedAnnotationInstanceAttribute.
	annotationTypeAttribute --|> #TWithComments.

	attribute --|> namedEntity.
	attribute --|> #TAttribute.
	attribute --|> #TCanBeFinal.
	attribute --|> #THasVisibility.
	attribute --|> tCanBeVolatile.
	attribute --|> tCanBeTransient.
	attribute --|> #TInvocationsReceiver.
	attribute --|> #TWithComments.
	attribute --|> #TCanBeClassSide.
	
	file --|> namedEntity.
	file --|> #TFile.
	
	folder --|> namedEntity.
	folder --|> #TFolder.

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	method --|> containerEntity.
	method --|> #TMethod.
	method --|> #TWithThrownExceptions.
	method --|> #TWithDeclaredExceptions.
	method --|> #TWithCaughtExceptions.
	method --|> #TCanBeAbstract.
	method --|> #TCanBeFinal.
	method --|> #THasVisibility.
	method --|> #THasKind.
	method --|> #TWithComments.
	method --|> tCanBeSynchronized.
	method --|> #TCanBeClassSide.

	caughtException --|> exception.
	caughtException --|> #TCaughtException.

	class --|> type.
	class --|> #TWithExceptions.
	class --|> #TPackageable.
	class --|> #TClass.
	class --|> #TLCOMMetrics.
	class --|> #TCanBeAbstract.
	class --|> #TCanBeFinal.
	class --|> #THasVisibility.
	class --|> #TCanBeClassSide. 
	class --|> #TClassMetrics.
	class --|> #TWithComments.
	class --|> tJavaClassMetrics.	
	
	interface --|> type.
	interface --|> #TPackageable.
	interface --|> #TWithMethods.
	interface --|> #TWithInheritances.
	interface --|> #TWithAttributes.
	interface --|> #TInvocationsReceiver.
	interface --|> #TOODependencyQueries.
	interface --|> #TCanBeFinal.
	interface --|> #THasVisibility.
	interface --|> #TCanBeClassSide. 
	interface --|> #TWithComments.

	containerEntity --|> namedEntity.
	containerEntity --|> #TWithClasses.
	containerEntity --|> #TWithAnnotationTypes.
	containerEntity --|> #TOODependencyQueries.

	declaredException --|> exception.
	declaredException --|> #TDeclaredException.

	enum --|> type.
	enum --|> #TEnum.
	enum --|> #THasVisibility.
	enum --|> #TWithAttributes.
	enum --|> #TWithMethods.
	enum --|> #TWithInheritances.
	enum --|> #TWithComments.

	enumValue --|> namedEntity.
	enumValue --|> #TStructuralEntity.
	enumValue --|> #TWithComments.
	enumValue --|> #TEnumValue.
	enumValue withPrecedenceOf: #TEnumValue.

	exception --|> #TException.

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
	localVariable --|> #TCanBeFinal.
	localVariable --|> #TInvocationsReceiver.
	localVariable --|> #TWithComments.

	
	namedEntity --|> #TInvocationsReceiver.
	namedEntity --|> #TWithAnnotationInstances.
	namedEntity --|> #TEntityMetaLevelDependency.
	namedEntity --|> sourcedEntity.

	package --|> containerEntity.
	package --|> #TWithGlobalVariables.
	package --|> #TPackage.
	package --|> #TPackageable.

	parameter --|> namedEntity.
	parameter --|> #TParameter.
	parameter --|> #TCanBeFinal.
	parameter --|> #TWithComments.

	parameterType --|> type.
	parameterType --|> #TParameterType.

	parameterizableClass --|> class.
	parameterizableClass --|> #TWithParameterizedTypes.

	parameterizedType --|> type.
	parameterizedType --|> #TParameterizedType.
	parameterizedType --|> #TWithParameterizedTypeUsers.
	parameterizedType --|> #TWithInheritances.

	primitiveType --|> type.
	primitiveType --|> #TPrimitiveType.

	reference --|> #TReference.
	
	sourcedEntity --|> #TWithFiles.

	thrownException --|> exception.
	thrownException --|> #TThrownException.

	type --|> containerEntity.
	type --|> #TType.
	type --|> #TWithTypeAliases.
	type --|> #TParameterizedTypeUser.
	type --|> #TWithMethods.

	unknownVariable --|> namedEntity.
	unknownVariable --|> #TUnknownVariable.
	unknownVariable --|> #TInvocationsReceiver.
	


]

{ #category : #definition }
FamixJavaGenerator >> defineProperties [
	super defineProperties.
		
	((tCanBeVolatile property: #isVolatile type: #Boolean) 
		comment: 'Entity can be declared volatile').
	((tCanBeTransient property: #isTransient type: #Boolean) 
		comment: 'Entity can be declared transient').
	((tCanBeSynchronized property: #isSynchronized type: #Boolean) 
		comment: 'Entity can be declared synchronized').
]

{ #category : #definition }
FamixJavaGenerator >> defineTraits [

	super defineTraits.
	tCanBeVolatile := builder
		                  newTraitNamed: #TCanBeVolatile
		                  comment: self commentForTCanBeVolatile.
	tCanBeTransient := builder
		                   newTraitNamed: #TCanBeTransient
		                   comment: self commentForTCanBeTransient.
	tCanBeSynchronized := builder
		                      newTraitNamed: #TCanBeSynchronized
		                      comment: self commentForTCanBeSynchronized.

	tJavaClassMetrics := builder newTraitNamed: #TClassMetrics.
	

	
]

{ #category : #definition }
FamixJavaGenerator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
