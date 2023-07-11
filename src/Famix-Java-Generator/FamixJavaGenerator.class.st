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
		'concretisation',
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
		'parameterConcretisation',
		'parameterType',
		'parametricClass',
		'parametricInterface',
		'parametricMethod',
		'primitiveType',
		'reference',
		'type',
		'unknownVariable',
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
		'import'
	],
	#classInstVars : [
		'builder'
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
	containerEntity := builder newAbstractClassNamed: #ContainerEntity.
	enum := builder newClassNamed: #Enum.
	enumValue := builder newClassNamed: #EnumValue.
	exception := builder newClassNamed: #Exception.
	implicitVariable := builder newClassNamed: #ImplicitVariable.
	import := builder newClassNamed: #Import.
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.
	inheritance := builder newClassNamed: #Inheritance.
	invocation := builder newClassNamed: #Invocation.
	localVariable := builder newClassNamed: #LocalVariable.
	method := builder newClassNamed: #Method.
	package := builder newClassNamed: #Package.
	parameter := builder newClassNamed: #Parameter.
	parameterType := builder newClassNamed: #ParameterType.
	primitiveType := builder newClassNamed: #PrimitiveType.
	reference := builder newClassNamed: #Reference.
	type := builder newClassNamed: #Type.
	unknownVariable := builder newClassNamed: #UnknownVariable.
	primitiveType withTesting.
	
	
	parametricClass   := builder newClassNamed: #ParametricClass.
	parametricMethod  := builder newClassNamed: #ParametricMethod.
	parametricInterface := builder newClassNamed: #ParametricInterface.
	parameterConcretisation := builder newClassNamed: #ParameterConcretisation.
	
	concretisation := builder newClassNamed: #Concretisation.
	
	
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
	method --|> #TImportable.

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
	class --|> #TWithImports.
	class --|> #TImportable.
		
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
	interface --|> #TWithImports.
	interface --|> #TImportable.
	
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
	enum --|> #TWithImports.
	enum --|> #TImportable.

	enumValue --|> namedEntity.
	enumValue --|> #TWithComments.
	enumValue --|> #TEnumValue.

	exception --|> class.
	exception --|> #TException.
	exception --|> #TWithAnnotationInstances.
	exception --|> #THasVisibility.
	exception --|> #TCanImplement.
	exception --|> #TWithTypes.
	
	implicitVariable --|> namedEntity.
	implicitVariable --|> #TImplicitVariable.
	implicitVariable --|> #TInvocationsReceiver.

	import --|> #TImport.
	
	inheritance --|> #TInheritance.

	invocation --|> #TInvocation.

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
	package --|> #TImportable.

	parameter --|> namedEntity.
	parameter --|> #TParameter.
	parameter --|> #TCanBeFinal.
	parameter --|> #TWithComments.

	parameterType --|> type.

	primitiveType --|> type.
	primitiveType --|> #TPrimitiveType.

	reference --|> #TReference.

	type --|> containerEntity.
	type --|> #TWithMethods.

	unknownVariable --|> namedEntity.
	unknownVariable --|> #TUnknownVariable.
	unknownVariable --|> #TInvocationsReceiver.
	
		
	parametricClass  --|> class.
	parametricClass  --|> #TParametricEntity.
	
	parametricMethod  --|> method.
	parametricMethod  --|> #TParametricEntity.
	
	parametricInterface --|> interface.
	parametricInterface --|> #TParametricEntity.
	
	parameterType --|> #TGenericParameterType.
	parameterType --|> #TTypedEntity .
	
	type --|> #TConcreteParameterType.
	
	concretisation --|> #TConcretisation.
	
	parameterConcretisation --|> #TParameterConcretisation.
	
	inheritance --|> #TInheritance.
	parameterType --|> #TWithInheritances.
	parameterType --|> #TThrowable.
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
		  withFileImport;
		  yourself
]
