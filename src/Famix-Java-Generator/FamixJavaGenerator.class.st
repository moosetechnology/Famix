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
		'concretization',
		'variable'
	],
	#classInstVars : [
		'builder'
	],
	#category : #'Famix-Java-Generator'
}

{ #category : #'additional tools' }
FamixJavaGenerator class >> metamodelToolGenerators [

	^ { FamixVisitorGenerator }
]

{ #category : #accessing }
FamixJavaGenerator class >> packageName [

	^ #'Famix-Java-Entities'
]

{ #category : #accessing }
FamixJavaGenerator class >> packageNameForVisitor [

	^ #'Famix-Java-Visitor'
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

	access := self newClassNamed: #Access.
	annotationInstance := self newClassNamed: #AnnotationInstance.
	annotationInstanceAttribute := self newClassNamed: #AnnotationInstanceAttribute.
	annotationType := self newClassNamed: #AnnotationType.
	annotationTypeAttribute := self newClassNamed: #AnnotationTypeAttribute.
	attribute := self newClassNamed: #Attribute.
	class := self newClassNamed: #Class.
	interface := self newClassNamed: #Interface.
	interface withTesting.
	implementation := self newClassNamed: #Implementation.
	containerEntity := self newAbstractClassNamed: #ContainerEntity.
	enum := self newClassNamed: #Enum.
	enumValue := self newClassNamed: #EnumValue.
	exception := self newClassNamed: #Exception.
	implicitVariable := self newClassNamed: #ImplicitVariable.
	import := self newClassNamed: #Import.
	indexedFileAnchor := self newClassNamed: #IndexedFileAnchor.
	inheritance := self newClassNamed: #Inheritance.
	invocation := self newClassNamed: #Invocation.
	localVariable := self newClassNamed: #LocalVariable.
	method := self newClassNamed: #Method.
	package := self newClassNamed: #Package.
	parameter := self newClassNamed: #Parameter.
	typeParameter := self newClassNamed: #TypeParameter.
	primitiveType := self newClassNamed: #PrimitiveType.
	primitiveType withTesting.
	reference := self newClassNamed: #Reference.
	type := self newClassNamed: #Type.
	entityTyping := self newClassNamed: #EntityTyping.
	variable := self newAbstractClassNamed: #Variable.
	unknownVariable := self newClassNamed: #UnknownVariable.

	parametricClass := self newClassNamed: #ParametricClass.
	parametricMethod := self newClassNamed: #ParametricMethod.
	parametricInterface := self newClassNamed: #ParametricInterface.
	parametricInheritance := self newClassNamed: #ParametricInheritance.
	parametricImplementation := self newClassNamed: #ParametricImplementation.
	parametricInvocation := self newClassNamed: #ParametricInvocation.
	parametricEntityTyping := self newClassNamed: #ParametricEntityTyping.
	concretization := self newClassNamed: #Concretization.
	wildcard := self newClassNamed: #Wildcard.
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
	annotationType --|> #TConcreteType.

	annotationTypeAttribute --|> variable.
	annotationTypeAttribute --|> #TAnnotationTypeAttribute.
	annotationTypeAttribute --|> #TTypedAnnotationInstanceAttribute.
	annotationTypeAttribute --|> #TWithComments.

	attribute --|> variable.
	attribute --|> #TAttribute.
	attribute --|> #TCanBeFinal.
	attribute --|> #THasVisibility.
	attribute --|> tCanBeVolatile.
	attribute --|> tCanBeTransient.
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
	class --|> #TConcreteType.

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
	interface --|> #TConcreteType.

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
	enum --|> #TConcreteType.

	enumValue --|> variable.
	enumValue --|> #TWithComments.
	enumValue --|> #TEnumValue.

	exception --|> class.
	exception --|> #TException.
	exception --|> #TWithAnnotationInstances.
	exception --|> #THasVisibility.
	exception --|> #TCanImplement.
	exception --|> #TWithTypes.

	implicitVariable --|> variable.
	implicitVariable --|> #TImplicitVariable.

	import --|> #TImport.

	inheritance --|> #TInheritance.

	invocation --|> #TInvocation.
	
	variable --|> namedEntity.
	variable --|> #TInvocationsReceiver. 

	localVariable --|> variable.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TCanBeFinal.
	localVariable --|> #TWithComments.

	namedEntity --|> #TWithAnnotationInstances.
	namedEntity --|> #TEntityMetaLevelDependency.
	namedEntity --|> sourcedEntity.

	package --|> containerEntity.
	package --|> #TPackage.
	package --|> #TPackageable.
	package --|> #TWithComments.
	package --|> #TImportable.

	parameter --|> variable.
	parameter --|> #TParameter.
	parameter --|> #TCanBeFinal.
	parameter --|> #TWithComments.

	primitiveType --|> type.
	primitiveType --|> #TPrimitiveType.

	reference --|> #TReference.

	type --|> #TType.
	type --|> containerEntity.
	type --|> #TWithMethods.
	type --|> tBound.

	entityTyping --|> #TEntityTyping.

	unknownVariable --|> variable.
	unknownVariable --|> #TUnknownVariable.

	parametricClass --|> class.
	parametricClass --|> #TParametricEntity.
	parametricMethod --|> method.
	parametricMethod --|> #TParametricEntity.
	parametricInterface --|> interface.
	parametricInterface --|> #TParametricEntity.
	
	parametricInheritance --|> inheritance.
	parametricInheritance --|> #TParametricAssociation.
	parametricImplementation --|> implementation.
	parametricImplementation --|> #TParametricAssociation.
	parametricInvocation --|> invocation.
	parametricInvocation --|> #TParametricAssociation.
	parametricEntityTyping --|> entityTyping.
	parametricEntityTyping --|> #TParametricAssociation.

	concretization --|> #TConcretization.

	typeParameter --|> type.
	typeParameter --|> #TTypeParameter.
	typeParameter --|> tBounded.
	typeParameter --|> #TConcreteType.
	typeParameter --|> #TThrowable.

	wildcard --|> type.
	wildcard --|> tBounded.
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

	((tBounded property: #lowerBound) comment:
		 'Lower bound on wildcard, specified by super keyword.')
	*- ((tBound property: #lowerBoundedWildcards) comment:
			 'Wildcards lower bounded by this bound.').

	((tBounded property: #upperBound) comment:
		 'Upper bound on wildcard, specified by extends keyword.')
	*- ((tBound property: #upperBoundedWildcards) comment:
			 'Wildcards upper bounded by this bound.')
]

{ #category : #definition }
FamixJavaGenerator >> defineTraits [
	super defineTraits.

	tCanBeVolatile := self newTraitNamed: #TCanBeVolatile.
	tCanBeVolatile comment: self commentForTCanBeVolatile.

	tCanBeTransient := self newTraitNamed: #TCanBeTransient.
	tCanBeTransient comment: self commentForTCanBeTransient.

	tCanBeSynchronized := self newTraitNamed: #TCanBeSynchronized.
	tCanBeSynchronized comment: self commentForTCanBeSynchronized.

	tWithInterfaces := self newTraitNamed: #TWithInterfaces.
	tWithInterfaces comment: self commentForTWithInterfaces.

	tJavaClassMetrics := self newTraitNamed: #TClassMetrics.

	tBounded := self newTraitNamed: #TBounded comment: self commentForTBounded.
	tBound := self newTraitNamed: #TBound comment: self commentForTBound.
]

{ #category : #definition }
FamixJavaGenerator >> newBuilder [

	^ super newBuilder
		  withFileImport;
		  yourself
]
