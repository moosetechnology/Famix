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
		'class',
		'containerEntity',
		'enum',
		'enumValue',
		'exception',
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
		'type',
		'unknownVariable',
		'parameterizedType',
		'indexedFileAnchor',
		'tCanBeVolatile',
		'tCanBeTransient',
		'tCanBeSynchronized',
		'tJavaClassMetrics',
		'interface',
		'implementation',
		'tImplementable',
		'tCanImplement',
		'tWithInterfaces',
		'parameterizableInterface',
		'parameterizableException'
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
FamixJavaGenerator >> commentForTWithInterfaces [

^ 'I can contain interfaces (Packages, Methods, Classes...)'

	
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
	class := builder newClassNamed: #Class.
	interface := builder newClassNamed: #Interface.
	interface withTesting.
	implementation := builder newClassNamed: #Implementation.
	containerEntity := builder newClassNamed: #ContainerEntity.
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	exception := builder newClassNamed: #Exception.
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
	parameterizableException := builder newClassNamed: #ParameterizableException.
	parameterizableInterface := builder newClassNamed: #ParameterizableInterface.
	parameterizedType := builder newClassNamed: #ParameterizedType.
	primitiveType := builder newClassNamed: #PrimitiveType.
	reference := builder newClassNamed: #Reference.
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
	annotationType --|> #TImplementable.

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
	
	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	method --|> containerEntity.
	method --|> #TMethod.
	method --|> #TWithExceptions.
	method --|> #TCanBeAbstract.
	method --|> #TCanBeFinal.
	method --|> #THasVisibility.
	method --|> #THasKind.
	method --|> #TWithComments.
	method --|> tCanBeSynchronized.
	method --|> #TCanBeClassSide.

	class --|> type.
	class --|> #TClass.
	class --|> #TLCOMMetrics.
	class --|> #TCanBeAbstract.
	class --|> #TCanBeFinal.
	class --|> #THasVisibility.
	class --|> #TCanBeClassSide. 
	class --|> #TClassMetrics.
	class --|> tJavaClassMetrics.	
	class --|> #TCanImplement.
	
	interface --|> type.
	interface --|> #TPackageable.
	interface --|> #TWithMethods.
	interface --|> #TWithInheritances.
	interface --|> #TWithAttributes.
	interface --|> #TInvocationsReceiver.
	interface --|> #TCanBeFinal.
	interface --|> #THasVisibility.
	interface --|> #TCanBeClassSide. 
	interface --|> #TWithComments.
	interface --|> #TImplementable.
	
	implementation --|> #TImplementation.

	containerEntity --|> namedEntity.
	containerEntity --|> tWithInterfaces.
	containerEntity --|> #TWithClasses.
	containerEntity --|> #TWithAnnotationTypes.
	
	tWithInterfaces --|> #TWithTypes.

	enum --|> type.
	enum --|> #TEnum.
	enum --|> #THasVisibility.
	enum --|> #TWithAttributes.
	enum --|> #TWithMethods.
	enum --|> #TWithInheritances.
	enum --|> #TWithComments.

	enumValue --|> namedEntity.
	enumValue --|> #TWithComments.
	enumValue --|> #TEnumValue.

	exception --|> #TException.
	exception --|> #TWithAnnotationInstances.
	exception --|> #THasVisibility.
	exception --|> #TCanImplement.
	exception --|> #TWithTypes.
	
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
	package --|> #TPackage.
	package --|> #TPackageable.
	package --|> #TWithComments.

	parameter --|> namedEntity.
	parameter --|> #TParameter.
	parameter --|> #TCanBeFinal.
	parameter --|> #TWithComments.

	parameterType --|> type.
	parameterType --|> #TParameterType.

	parameterizableClass --|> class.
	parameterizableClass --|> #TWithParameterizedTypes.
	
	parameterizableException --|> exception.
	parameterizableException --|> #TWithParameterizedTypes.
	
	parameterizableInterface --|> interface.
	parameterizableInterface --|> #TWithParameterizedTypes.

	parameterizedType --|> type.
	parameterizedType --|> #TParameterizedType.
	parameterizedType --|> #TWithParameterizedTypeUsers.
	parameterizedType --|> #TWithInheritances.
	parameterizedType --|> #TCanImplement.
	parameterizedType --|> #TImplementable.

	primitiveType --|> type.
	primitiveType --|> #TPrimitiveType.

	reference --|> #TReference.
	
	sourcedEntity --|> #TWithFiles.

	type --|> containerEntity.
	type --|> #TType.
	type --|> #TParameterizedTypeUser.

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
FamixJavaGenerator >> defineRelations [ 

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
	

		
	tWithInterfaces := builder newTraitNamed: #TWithInterfaces.
	tWithInterfaces comment: self commentForTWithInterfaces.

	tJavaClassMetrics := builder newTraitNamed: #TClassMetrics.
	

	
]

{ #category : #definition }
FamixJavaGenerator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
