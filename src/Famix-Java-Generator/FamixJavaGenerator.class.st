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
		'import',
		'tBounded',
		'tBound',
		'wildcard',
		'parameterConcretization',
		'concretization'
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
FamixJavaGenerator >> commentForTBound [

	^ 'Represents a bound for a lower bounded and upper bounded wildcard.'
]

{ #category : #definition }
FamixJavaGenerator >> commentForTBounded [

	^ 'Represents a bounded wildcard, lower bounded with keyword super or upper bounded with keyword extends.'
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
	primitiveType withTesting.
	reference := builder newClassNamed: #Reference.
	type := builder newClassNamed: #Type.
	unknownVariable := builder newClassNamed: #UnknownVariable.

	parametricClass := builder newClassNamed: #ParametricClass.
	parametricMethod := builder newClassNamed: #ParametricMethod.
	parametricInterface := builder newClassNamed: #ParametricInterface.
	parameterConcretization := builder newClassNamed: #ParameterConcretization.

	concretization := builder newClassNamed: #Concretization.
	wildcard := builder newClassNamed: #Wildcard.
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
	class --|> #TPackageable.

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


	parametricClass --|> class.
	parametricClass --|> #TParametricEntity.

	parametricMethod --|> method.
	parametricMethod --|> #TParametricEntity.

	parametricInterface --|> interface.
	parametricInterface --|> #TParametricEntity.

	parameterType --|> #TGenericParameterType.
	parameterType --|> #TTypedEntity .

	type --|> #TConcreteParameterType.
	type --|> tBound.

	concretization --|> #TConcretization.

	parameterConcretization --|> #TParameterConcretization.

	wildcard --|> type.
	wildcard --|> tBounded.

	inheritance --|> #TInheritance.
	parameterType --|> #TWithInheritances.
	parameterType --|> #TThrowable.
]

{ #category : #definition }
FamixJavaGenerator >> defineProperties [
	super defineProperties.

	((tCanBeVolatile property: #isVolatile type: #Boolean defaultValue: false)
		comment: 'Entity can be declared volatile').
	((tCanBeTransient property: #isTransient type: #Boolean defaultValue: false)
		comment: 'Entity can be declared transient' ).
	((tCanBeSynchronized property: #isSynchronized type: #Boolean defaultValue: false)
		comment: 'Entity can be declared synchronized').
]

{ #category : #definition }
FamixJavaGenerator >> defineRelations [
	super defineRelations.

	((tBounded property: #lowerBound)
			comment: 'Lower bound on wildcard, specified by super keyword.')
		*-
	((tBound property: #lowerBoundedWildcards)
			comment: 'Wildcards lower bounded by this bound.').

	((tBounded property: #upperBound)
			comment: 'Upper bound on wildcard, specified by extends keyword.')
		*-
	((tBound property: #upperBoundedWildcards)
			comment: 'Wildcards upper bounded by this bound.').
]

{ #category : #definition }
FamixJavaGenerator >> defineTraits [
	super defineTraits.

	tCanBeVolatile := builder newTraitNamed: #TCanBeVolatile.
	tCanBeVolatile comment: self commentForTCanBeVolatile.

	tCanBeTransient := builder newTraitNamed: #TCanBeTransient.
	tCanBeTransient comment: self commentForTCanBeTransient.

	tCanBeSynchronized := builder newTraitNamed: #TCanBeSynchronized.
	tCanBeSynchronized comment: self commentForTCanBeSynchronized.

	tWithInterfaces := builder newTraitNamed: #TWithInterfaces.
	tWithInterfaces comment: self commentForTWithInterfaces.

	tJavaClassMetrics := builder newTraitNamed: #TClassMetrics.

	tBounded := builder newTraitNamed: #TBounded comment: self commentForTBounded.
	tBound := builder newTraitNamed: #TBound comment: self commentForTBound.
]

{ #category : #definition }
FamixJavaGenerator >> newBuilder [

	^ super newBuilder
		  withFileImport;
		  yourself
]
