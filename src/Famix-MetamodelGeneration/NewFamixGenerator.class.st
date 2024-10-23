"
| g |
g := FamixGenerator new.
g generateWithoutCleaning.
FamixCompatibilityGenerator resetMetamodel. 

"
Class {
	#name : #NewFamixGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'tAccess',
		'tAccessible',
		'tAnnotationInstance',
		'tAnnotationInstanceAttribute',
		'tAnnotationType',
		'tAnnotationTypeAttribute',
		'tAssociation',
		'tAttribute',
		'tComment',
		'tCompilationUnit',
		'tDereferencedInvocation',
		'tEnumValue',
		'tException',
		'tFile',
		'tFileAnchor',
		'tFunction',
		'tGlobalVariable',
		'tHeader',
		'tImplicitVariable',
		'tInheritance',
		'tInvocable',
		'tInvocation',
		'tInvocationsReceiver',
		'tLocalVariable',
		'tMethod',
		'tModule',
		'tNamespace',
		'tPackage',
		'tPackageable',
		'tParameter',
		'tPreprocessorDefine',
		'tPreprocessorIfdef',
		'tReference',
		'tReferenceable',
		'tSourceAnchor',
		'tSourceEntity',
		'tSourceLanguage',
		'tStructuralEntity',
		'tTemplate',
		'tTemplateUser',
		'tTrait',
		'tTraitUsage',
		'tType',
		'tTypeAlias',
		'tWithAccesses',
		'tWithAnnotationInstances',
		'tWithAnnotationTypes',
		'tWithAttributes',
		'tWithComments',
		'tWithDereferencedInvocations',
		'tWithEnumValues',
		'tWithExceptions',
		'tWithFiles',
		'tWithFunctions',
		'tWithImplicitVariables',
		'tWithInheritances',
		'tWithInvocations',
		'tWithLocalVariables',
		'tWithMethods',
		'tDefinedInModule',
		'tWithParameters',
		'tWithReferences',
		'tWithTemplates',
		'tWithTypeAliases',
		'tWithTypes',
		'tClass',
		'tFolder',
		'tFileSystemEntity',
		'tFileNavigation',
		'tIndexedFileNavigation',
		'tLCOMMetrics',
		'tWithClasses',
		'tTraitUser',
		'tWithStatements',
		'tMultipleFileAnchor',
		'tCohesionCouplingMetrics',
		'tWithTraits',
		'tWithFileIncludes',
		'tTypedEntity',
		'tHasSignature',
		'tWithGlobalVariables',
		'tHasModifiers',
		'tHasImmediateSource',
		'tNamedEntity',
		'tTypeGroup',
		'tClassGroup',
		'tPrimitiveType',
		'tUnknownVariable',
		'tRelativeSourceAnchor',
		'tEnum',
		'tHasVisibility',
		'tClassWithVisibility',
		'tCanBeFinal',
		'tCanBeAbstract',
		'tClassMetrics',
		'tMethodMetrics',
		'tHasKind',
		'tWithSourceLanguages',
		'tWithCompilationUnits',
		'tWithHeaders',
		'tCanBeClassSide',
		'tImplementable',
		'tCanImplement',
		'tImplementation',
		'tImportable',
		'tImport',
		'tWithImports',
		'tParametricEntity',
		'tConcreteParameterType',
		'tGenericParameterType',
		'tThrowable',
		'tConcretization',
		'tParameterConcretization',
		'tThrowableCatch',
		'tThrowableDeclaration',
		'tThrowableThrown',
		'tFileInclusion',
		'tAlias',
		'tTypedDeclaration',
		'tConcreteParameterization',
		'tGenericParameterization'
	],
	#category : #'Famix-MetamodelGeneration'
}

{ #category : #accessing }
NewFamixGenerator class >> packageName [

	^ #'Sandbox'
]

{ #category : #initialization }
NewFamixGenerator class >> prefix [

	^ #Sandbox
]

{ #category : #comments }
NewFamixGenerator >> commentForTAccess [

	^ 'FamixTAccess represents an access to a variable by a behavioural entity (for example, a function or a method). 

For example if the method foo accesses the instance variable x, there is an access with the following information:
	(i) From: aFamixTMethod (foo)
	(ii) To: aFamixTAttribute (x)
	
aFamixTMethod (foo) can be accessed using the message accessor (and from)
aFamixTAttribute (x) can be accessed using the message variable (and to). 

Furthermore it can be tagged as read or write using isWrite: aBoolean.

For each access in the source code, there is one famix access created even if it is from the same behavioral entity towards the same variable.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTAccessible [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTAnnotationInstance [

	^ 'AnnotationInstance is an instance of an AnnotationType. It links an AnnotationType to an actual entity.

For example, the following is an annotation instance in Smalltalk.
<primitive: ''primAnyBitFromTo'' module:''LargeIntegers''>.

And the following is an AnnotationInstance in Java:
@Test(timeout = 500)

Instance Variables:
	annotatedEntity	<FamixTEntity>
	annotationType		<FamixTAnnotationType>'
]

{ #category : #comments }
NewFamixGenerator >> commentForTAnnotationInstanceAttribute [

	^ 'This models the actual value of an attribute in an AnnotationInstance.

In the following AnnotationInstance of Java, timeout is an annotation instance attribute :
@Test(timeout = 500)

Instance Variables:
	parentAnnotationInstance	<FamixTAnnotationInstance>
	annotationTypeAttribute	<FamixTAnnotationTypeAttribute>
	value	<Object>'
]

{ #category : #comments }
NewFamixGenerator >> commentForTAnnotationType [

	^ 'FamixTAnnotationType represents the type of an annotation. In some languages, Java and C#, an annotation as an explicit type. An AnnotationType can have a container in which it resides.

Instance Variables:
	instances	<(FMMultivalueLink of: FamixTAnnotationInstance)>
	container	<FamixTContainerEntity>'
]

{ #category : #comments }
NewFamixGenerator >> commentForTAnnotationTypeAttribute [

	^ 'This models the attribute defined in a Java AnnotationType. In Java, annotation type attributes have specific syntax and use.

For example, in Java the following AnnotationType has four AnnotationTypeAttributes (id, synopsis, engineer and date are attributes).

public @interface MyAnno {
    int    id();
    String synopsis(); 
    String engineer() default "[unassigned]"; 
    String date()    default "[unimplemented]";
}

When using an annotation, an annotation instance is created that points back to the annotation type. The annotation instance has attributes that are annontation instance attributes and point back to their annotation type attributes.

Instance Variables:
	parentAnnotationType	<FamixTAnnotationType>
	annotationAttributeInstances	<(FMMultivalueLink of: FamixTAnnotationInstanceAttribute)>'
]

{ #category : #comments }
NewFamixGenerator >> commentForTAssociation [

	^ 'FamixTAssociation is an abstract superclass for relationships between Famix named entities. It defines a polymorphic API refined by subclasses: essentially from, to, next and previous.

From and To properties are abstract at this level, but specific implementations can have multiple ends and properties. 
For example, FamixTInheritance has:
	(i) From mapped to the subclass;
	(ii) To mapped to the superclass.
	
To adapt your code to MooseQuery, you have also to add the <source> and <target> pragmas in the selectors definition for each class inheriting FamixTAssociation

Next and Previous properties provide an order of the appearence of these associations in code. The order is calculated within a particular relationship for example, method invocation order within a calling method (from).
For example in java, the following code
 method a() { b(); c(); }
will produce two invocation associations first from method a to method b, and second from method a to method c. These associations are bound together and can be navigated with previous and next.



'
]

{ #category : #comments }
NewFamixGenerator >> commentForTAttribute [

	^ 'FamixTAttribute represents a field of a class. It is an attribute of the parent type.
'
]

{ #category : #comments }
NewFamixGenerator >> commentForTCanImplement [

^'I can be the source of an implementation (cf a class implementing an Interface)'
	

	
]

{ #category : #comments }
NewFamixGenerator >> commentForTCaughtException [

	^ 'This is an exception that is explicitly handled by a method. For example, in Java it is an exception that appears in a catch statement.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTClass [

	^ 'FamixTClass represents an entity which can build new instances. A FamixTClass is a FamixTType, therefore it is involved in super/sub types relationships (depending on the language) and it holds attributes, methods.

FamixT does not model explicitly interfaces, but a FamixTClass can represent a Java interface by setting the isInterface property.

A class is typically scoped in a namespace. To model nested or anonymous classes, extractors can set the container of classes to classes or methods, respectively.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTComment [

	^ 'FamixTComment represents one instance of a comment (in the sense of programming language comments) for any Famix sourced entity. The commented sourced entity is called the container in the FamixT model.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTCompilationUnit [

	^ 'I represent a compilation unit file. Typically a .c or .cpp file'
]

{ #category : #comments }
NewFamixGenerator >> commentForTConcreteParameterType [

	^ 'FamixTConcreteParameterType represents the concretePamameters of an FamixTParametricEntity. it can be a class or a ParameterType that has one FamixTParameterConcretization'
]

{ #category : #comments }
NewFamixGenerator >> commentForTConcretization [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTDeclaredException [

	^ 'This is an exception explicitly declared as being thrown by a method.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTDefinedInModule [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTDereferencedInvocation [

	^ 'Represents an invocation which function is contained in a pointer.

The function itself is typically unknown (referenced by the pointer).

It has a referencer which is the pointer variable'
]

{ #category : #comments }
NewFamixGenerator >> commentForTEnum [

	^ 'This models an enum.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	values	<(MultivalueLink of: FamixTEnumValue)>'
]

{ #category : #comments }
NewFamixGenerator >> commentForTEnumValue [

	^ 'It models the values defined in an FamixTEnum. These are attributes of enums with default values.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	parentEnum	<(MultivalueLink of: FamixTEnum)>'
]

{ #category : #comments }
NewFamixGenerator >> commentForTException [

	^ 'This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FamixTException is a normal FamixTClass.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTFile [

	^ 'It represents a file in the file system.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTFileAnchor [

	^ 'This offers a source anchor that connects a sourced entity to a file through a relative path stored in the fileName. In addition, the source can be further specified with a startLine and an endLine number in the file.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTFileInclude [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTFileNavigation [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTFolder [

	^ 'It represents a folder in the file system. It can contain other files or folders.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTFunction [

	^ 'FamixTFunction represents a behavioural entity in a procedural language.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTGenericParameterType [

	^ 'FamixTGenericParameterType represents generic parameters in an FamixJavaParametricEntity. This is an FamixJavaParameterType'
]

{ #category : #comments }
NewFamixGenerator >> commentForTGlobalVariable [

	^ 'FamixTGlobalVariable represents a global variable in the source code.
'
]

{ #category : #comments }
NewFamixGenerator >> commentForTHasImmediateSource [

	^ 'An immediate source is the source code of the entity stored directly into its sourceAnchor instead of accessing it (for example in a file) through its sourceAnchor'
]

{ #category : #comments }
NewFamixGenerator >> commentForTHasKind [

	^ 'This is an indicator that a method is a setter, getter, constant, or constructor'
]

{ #category : #comments }
NewFamixGenerator >> commentForTHasSignature [

	^ 'The signature of any behavioural entity'
]

{ #category : #comments }
NewFamixGenerator >> commentForTHeader [

	^ 'I represent a header file. Typically a .h or .hpp'
]

{ #category : #comments }
NewFamixGenerator >> commentForTImplementable [

^'I can be the target of an implementation cf Interface '
	

	
]

{ #category : #comments }
NewFamixGenerator >> commentForTImplicitVariable [

	^ 'FamixTImplicitVariable represents a variable defined by the compiler in a context, such as self, super, thisContext.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTIndexedFileNavigation [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTInheritance [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTInvocable [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTInvocation [

	^ 'FamixTInvocation represents the invocation of a message (signature) on a receiver by a behavioural entity. 
FamixTInvocation has:
   (i)  sender: the behavioral entity that sends the message;
   (ii) receiver: the structural entity (variable) that receives the message;
   (iii) candidates: the list of potential behavioral entities that are actually being invoked. This is particularly useful for dynamic languages.

In an invocation, From is the sender of the message and To is the list of candidates. For each invocation in the source code, there is one famix invocation created even if it is from the same behavioral entity towards the same variable and the same message. For example in smalltalk, the following code
anObject aSelector.
will produce one invocation association from current method to a variable anObject with candidate aSelector. The list of candidates will also contain all the methods defining a similar signature as aSelector. 
'
]

{ #category : #comments }
NewFamixGenerator >> commentForTInvocationsReceiver [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTLocalVariable [

	^ 'FamixTLocalVariable represents a local variable in the scope of a behavioural entity.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTMethod [

	^ 'FamixTMethod represents a behaviour in an object-oriented language.

A FamixTMethod is always contained in a parentType.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTModule [

	^ 'FamixTModule represents a that basically provides a simple scoping abstraction for a .C/.CPP/.H files.
'
]

{ #category : #comments }
NewFamixGenerator >> commentForTNamed [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTNamespace [

	^ 'FamixTNamespace represents a namespace from the source language. Namespaces have semantic meaning in the language so they influence the unique name of the entity.

A namespace denotes an entity that has meaning from a language point of view. For example, in C++, there exist a concept with the same name that has no other responsibility beside providing a lexical scope for the contained classes and funcions.

When an entity is placed inside a namespace, the fully qualified name (mooseName) is affected.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTPackage [

	^ 'FamixTPackage represents a package in the source language, meaning that it provides a means to group entities without any baring on lexical scoping. 

Java extractors map Java packages to FamixTNamespaces. They can also mirror the same information in terms of FamixTPackage instances.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTPackageable [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTParameter [
	^ 'A Parameter represents one parameter in a behavioral (method, function, lamdba...) declaration.
	
For example in the following code we have two Parameters. One named "a" and another named "b". Both of them have "int" as declared type.

```java
// method with two parameters
int addNumbers(int a, int b) {
  // code
}
```
'
]

{ #category : #comments }
NewFamixGenerator >> commentForTParameterConcretization [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTParameterType [
	^ 'ParameterType represents the symbolic type used in parameterizable classes. This is a FamixTType.

Example:
public class AClass<A,B,C> {
...
}

Where AClass is a ParameterizableClass. A, B and C are ParameterType of AClass.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTParametricEntity [

	^ 'FamixTParametricEntity represents a type with parameters. It can be an parametricClass, parametricMethod, parametricInterface.
Example:

...
public Map<String,Collection> anAttribute;
...

Where Map<String,Collection> is the FamixTParametricEntity of anAttribute. String and Collection are concrete parameters. Map is the parametricClass.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTPreprocessorDefine [

	^ 'Represent a preprocessor #define statement

Knows the name of the macro defined'
]

{ #category : #comments }
NewFamixGenerator >> commentForTPreprocessorIfdef [

	^ 'Represent a preprocessor #ifdef/#ifndef statement

Knows the name of the macro tested and whether it is "negated" (#ifndef) or not (#ifdef)'
]

{ #category : #comments }
NewFamixGenerator >> commentForTReference [

	^ 'A FamixTReference entity is created whenever one manipulates a class name as a variable. For example:
(i) if the class is passed as a parameter to a method, or
(ii) if a static method is invoked on a class.

For example, in the following Java code
method a()
{B bObject = new B();  B.aStaticMethod(); }
There is only one reference which is created when the static method aStaticMethod is invoked on class variable B. In the declaration of B objects, the class B is the type of variable b but not a FamixTReference. And instantiation new B() is an invocation of the default constructor, and not a FamixTReference.


Note that FamixTReference was defined between two FamixTContainerEntity entities. So, it used to represent dependencies between container entities that are computed from the dependencies of contained entities. For example, references between two packages can be computed from dependencies between classes of the packages.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTReferenceable [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTRelativeSourceAnchor [

	^ 'Description
--------------------

I am a source anchor storing the sources by pointing another source anchor and defining a subpart of this source as my sourced.

I point another source anchor and define a start and end position in the source text of this source anchor as my anchor.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	endPos:					<anInteger>				Position of the last character of my source in the source text of the relative anchor.
	relatedAnchor:			<aSourceAnchor>			The anchor I''ll get my relative sources from.
	startPos:					<anInteger>				Position of the first character of my source in the source text of the relative anchor.
'
]

{ #category : #comments }
NewFamixGenerator >> commentForTSourceAnchor [

	^ 'FamixTSourceAnchor is an abstract class representing a pointer to a source. The source can be identified in multiple ways as specified by the subclasses.  The famix entity that this class is a source pointer for, is accessible via element property.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTSourceEntity [
	^ 'FamixTSourcedEntity models any fact in a program source and it is the superclass (root class) of all source code entities and their relationships. It is a FamixTEntity and it can hold comments, a source anchor and a source language.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTSourceLanguage [

	^ 'FamixTSourceLanguage represents the programming language in which an entity is written. It is used for dispatching entity actions for specific languages. For example, formatting a source text will be performed according to the language. A project may have multiple languages. 

A source language has a name and entities that are written in this language. 
One can create a default source language for a project by not associating any entities to it. In this case, all entities that do not have specific source langauge, belong to the default source language. One can attach entities to a sourceLanguage using addSourceEntity:.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTStructuralEntity [
	^ 'FamixTStructuralEntity is the abstract superclass for basic data structure in the source code. A structural entity has a declaredType that points to the type of the variable.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTSub [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTSuper [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTTemplate [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTTemplateUser [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTThrowable [

^ 'TThrowable represents all types of possible exceptions.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTThrownException [

	^ 'This is an exception explicitly thrown by a method.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTTrait [

	^ 'FamixTTrait models a trait as it can be found in Pharo or PHP.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTType [

	^ 'FamixTType is a generic class representing a type. It has several specializations for specific kinds of types, the typical one being FamixTClass.
A type is defined in a container (instance of FamixTContainer). 
The container is typically a namespace (instance of FamixTNamespace), but may also be a class (in the case of nested classes), or a method (in the case of anonymous classes).

A type can have multiple subtypes or supertypes. These are modelled by means of FamixTInheritance instances.'
]

{ #category : #comments }
NewFamixGenerator >> commentForTTypeAlias [

	^ 'This entity models a typedef in C.

Instance Variables:
	aliasedType	<ProtoObject | PseudoContext>'
]

{ #category : #comments }
NewFamixGenerator >> commentForTTypedAnnotationInstance [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTTypedAnnotationInstanceAttribute [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTTypedStructure [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithAccesses [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithAnnotationInstanceAttributes [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithAnnotationInstances [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithAnnotationTypes [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithAttributes [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithCaughtExceptions [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithClasses [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithComments [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithCompilationUnit [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithDeclaredExceptions [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithDereferencedInvocations [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithEnumValues [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithExceptions [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithFileIncludes [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithFiles [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithFunctions [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithGlobalVariables [

	^ 'A container having Global variables'
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithHeader [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithImplicitVariables [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithInheritances [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithInvocations [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithLocalVariables [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithMethods [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithPackages [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithParameters [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithReferences [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithSourceLanguage [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithTemplates [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithThrownExceptions [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithTraits [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithTypeAliases [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithTypedStructures [

	^ ''
]

{ #category : #comments }
NewFamixGenerator >> commentForTWithTypes [

	^ ''
]

{ #category : #definition }
NewFamixGenerator >> defineHierarchy [
	super defineHierarchy.

	"ASSOCIATIONS"
	tAssociation --|> #TAssociationMetaLevelDependency.
	tAssociation --|> tSourceEntity.

	tAlias --|> tAssociation.

	tAccess --|> tAssociation.

	tConcreteParameterization --|> tAssociation.

	tDefinedInModule --|> tAssociation.

	tImplementation --|> tAssociation.

	tFileInclusion --|> tAssociation.

	tGenericParameterization --|> tAssociation.

	tInheritance --|> tAssociation.

	tImport --|> tAssociation.

	tInvocation --|> tAssociation.
	tInvocation --|> tHasSignature.

	tReference --|> tAssociation.

	tTraitUsage --|> tAssociation.

	tConcretization --|> tAssociation.
	tParameterConcretization --|> tAssociation.

	tThrowableCatch --|> tAssociation.
	tThrowableDeclaration --|> tAssociation.
	tThrowableThrown --|> tAssociation.



	tAttribute --|> tStructuralEntity.

	tEnumValue --|> tStructuralEntity.

	tAnnotationInstance --|> #TEntityMetaLevelDependency.

	tAnnotationInstanceAttribute --|> #TEntityMetaLevelDependency.

	tAnnotationTypeAttribute --|> tAttribute.

	tCohesionCouplingMetrics --|> tPackage.

	tClass --|> tWithMethods.
	tClass --|> tWithInheritances.
	tClass --|> tWithAttributes.
	tClass inheritsFromTrait: tType without: { #queryStaticIncomingAssociations. #queryStaticOutgoingAssociations }.
	tClass --|> tInvocationsReceiver.
	tClass --|> tWithComments.

	tClassWithVisibility --|> tClass.
	tClassWithVisibility --|> tHasVisibility.

	tClassGroup --|> tTypeGroup.
	
	tComment  --|> #TEntityMetaLevelDependency.

	tCompilationUnit --|> tFile.

	tDereferencedInvocation --|> tInvocation.

	tEnum --|> tWithEnumValues.
	tEnum --|> tType.

	tException --|> tClass.

	tFile --|> tFileSystemEntity.

	tFileNavigation --|> tFileAnchor.

	tFolder --|> tFileSystemEntity.

	tFunction --|> tNamedEntity.
	tFunction --|> tWithParameters.
	tFunction --|> tHasSignature.
	tFunction --|> tTypedEntity.
	tFunction --|> tWithStatements.
	tFunction --|> tWithLocalVariables.
	tFunction --|> tInvocable.
	tFunction --|> #TEntityMetaLevelDependency.

	tGlobalVariable --|> tStructuralEntity.

	tHasImmediateSource --|> tSourceAnchor.

	tHeader --|> tFile.

	tIndexedFileNavigation --|> tFileAnchor.

	tImplicitVariable --|> tStructuralEntity.

	tLocalVariable --|> tStructuralEntity.

	tMethod --|> tWithParameters.
	tMethod --|> tInvocable.
	tMethod --|> tWithStatements.
	tMethod --|> tWithLocalVariables.
	tMethod --|> tWithImplicitVariables.
	tMethod --|> tHasSignature.
	tMethod --|> tTypedEntity.
	tMethod --|> tNamedEntity.
	tMethod --|> #TEntityMetaLevelDependency.

	tMethod --|> tMethodMetrics.

	tMultipleFileAnchor --|> tSourceAnchor.

	tNamespace --|> tNamedEntity.
	tNamespace --|> #TEntityMetaLevelDependency.
	tNamespace --|> tSourceEntity.

	tPackage --|> tNamedEntity.
	tPackage --|> #TEntityMetaLevelDependency.
	tPackage --|> tSourceEntity.

	tParameter --|> tStructuralEntity.

	tPrimitiveType --|> tType.

	tRelativeSourceAnchor --|> tSourceAnchor.

	tStructuralEntity --|> tNamedEntity.
	tStructuralEntity --|> #TEntityMetaLevelDependency.
	tStructuralEntity --|> tSourceEntity.
	tStructuralEntity --|> tAccessible.
	tStructuralEntity --|> tTypedEntity.

	"tSourceEntity --|> tWithSourceLanguage."
	"tSourceEntity --|> tWithComments."

	tType --|> tReferenceable.
	tType --|> tNamedEntity.
	tType --|> #TEntityMetaLevelDependency.
	tType --|> tSourceEntity.

	tUnknownVariable --|> tStructuralEntity.

	tWithClasses --|> tWithTypes.

	tWithStatements --|> tWithAccesses.
	tWithStatements --|> tWithInvocations.
	tWithStatements --|> tSourceEntity.
	tWithStatements --|> tWithReferences.

	tConcreteParameterType --|> tType.
	tGenericParameterType --|> tType.

	tException --|> tThrowable.
]

{ #category : #definition }
NewFamixGenerator >> defineProperties [

	super defineProperties.

	(tCanBeAbstract
		 property: #isAbstract
		 type: #Boolean
		 defaultValue: false) comment: 'Entity can be declared abstract'.
	(tCanBeFinal property: #isFinal type: #Boolean defaultValue: false)
		comment: 'Entity can be declared final'.
	(tCanBeClassSide
		 property: #isClassSide
		 type: #Boolean
		 defaultValue: false) comment:
		'Entity can be declared class side i.e. static'.

	(tFileAnchor property: #correspondingFile type: #FamixTFile)
		comment: 'File associated to this source anchor'.
	(tFileAnchor property: #encoding type: #String) comment:
		'A string representing the encoding of a file'.
	(tFileAnchor property: #fileName type: #String) comment:
		'Name of the source file'.

	(tAccess property: #isWrite type: #Boolean defaultValue: false)
		comment: 'Write access'.

	(tAnnotationInstanceAttribute property: #value type: #String)
		comment: 'Actual value of the attribute used in an annotation'.

	(tNamedEntity property: #name type: #String) comment:
		'Basic name of the entity, not full reference.'.

	(tHasModifiers property: #modifiers type: #String)
		comment: 'Generic container for language dependent modifiers.';
		multivalued.
	(tHasVisibility property: #visibility type: #String) comment:
		'Visibility of the entity'.

	(tHasKind property: #kind type: #String) comment:
		'Tag indicating a setter, getter, constant, constructor method'.

	(tHasSignature property: #signature type: #String) comment:
		'Signature of the message being sent'.

	(tComment property: #content type: #String) comment:
		'Content of the comment as a String'.

	(tSourceEntity property: #isStub type: #Boolean defaultValue: false)
		comment:
		'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'.

	(tFileNavigation property: #startLine type: #Number) comment:
		'Number of the start line'.
	(tFileNavigation property: #endLine type: #Number) comment:
		'Number of the end line'.
	(tFileNavigation property: #startColumn type: #Number) comment:
		'Number of the start column'.
	(tFileNavigation property: #endColumn type: #Number) comment:
		'Number of the end column'.

	(tIndexedFileNavigation property: #startPos type: #Number) comment:
		'Start position in the source'.
	(tIndexedFileNavigation property: #endPos type: #Number) comment:
		'Stop position in the source'.

	(tHasImmediateSource property: #source type: #String) comment:
		'Actual source code of the source entity'.

	(tMultipleFileAnchor property: #fileAnchors type: #FamixTFileAnchor)
		comment: 'All source code definition files';
		multivalued.

	(tRelativeSourceAnchor
		 property: #relatedAnchor
		 type: #FamixTSourceAnchor) comment:
		'Source anchor to which I am relative.'.
	(tRelativeSourceAnchor property: #startPos type: #Number) comment:
		'Start position in the source'.
	(tRelativeSourceAnchor property: #endPos type: #Number) comment:
		'Stop position in the source'.
]

{ #category : #definition }
NewFamixGenerator >> defineRelations [

	"ASSOCIATION: Access"
	tAccess 
		source: #accessor *- ((tWithAccesses property: #accesses)
									comment: 'Accesses to variables made by this behaviour.')
		target: #variable *- ((tAccessible property: #incomingAccesses)
									comment: 'All Famix accesses pointing to this structural entity').

	"((tAccess property: #accessor)
			comment: 'Behavioural entity making the access to the variable. from-side of the association';
			source)
		*-
	((tWithAccesses property: #accesses)
			comment: 'Accesses to variables made by this behaviour.').

	((tAccess property: #variable)
			comment: 'Variable accessed. to-side of the association';
			target)
		*-
	((tAccessible property: #incomingAccesses)
			comment: 'All Famix accesses pointing to this structural entity')."

	"-----"
	"NEW ANNOTATIONS:
	 - TAnnotationInstance is an association between TWithAnnotationInstance and TAnnotationType
	   source: TWithAnnotationInstance ; target: TAnnotationType
	   - merge TTypedAnnotationInstance into TAnnotationInstance
	   - merge TWithAnnotationInstanceAttribute into TAnnotationInstance
	 - merge TTypedAnnotationInstanceAttribute into TAnnotationInstanceAttribute
	 - TAnnotationTypeAttribute to TAnnotationInstanceAttribute is still a simple relation (?)
	"

	"ASSOCIATION: tAnnotationInstance"
	tAnnotationInstance
		source: #annotatedEntity *- ((tWithAnnotationInstances property: #annotationInstances)
											comment: 'This property corresponds to the set of annotations associated to the entity')
		target: #annotationType *- ((tAnnotationInstance property: #annotationType)
											comment: 'Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type)').

	"((tAnnotationInstance property: #annotatedEntity)
			comment: 'The NamedEntity on which the annotation occurs.' ;
			source)
		*-
	((tWithAnnotationInstances property: #annotationInstances)
			comment: 'This property corresponds to the set of annotations associated to the entity').

	((tAnnotationType property: #instances)
			comment: 'Annotations of this type')
		-*
	((tAnnotationInstance property: #annotationType)
			comment: 'Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). ';
			target)."

	"-----"
	((tAnnotationInstanceAttribute property: #parentAnnotationInstance)
			comment: 'The instance of the annotation in which the attribute is used.';
			container)
		*-
	((tAnnotationInstance property: #attributes)
			comment: 'This corresponds to the actual values of the attributes in an AnnotationInstance').

	"-----"
	"RELATION ? ASSOCIATION ?"
	((tAnnotationTypeAttribute property: #annotationAttributeInstances)
			comment: 'A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances')
		-*
	((tAnnotationInstanceAttribute property: #annotationTypeAttribute)
			comment: 'This corresponds to the type of the attribute in an AnnotationInstance').

	"-----"
	"CONTAINER"
	((tAnnotationType property: #annotationTypesContainer)
			comment: 'Container in which an AnnotationType may reside';
			container	)
		*-
	((tWithAnnotationTypes property: #definedAnnotationTypes)
			comment: 'The AnnotationTypes declared in this container').

	"-----"
	"CONTAINER"
	((tAttribute property: #parentType)
			comment: 'Type declaring the attribute. belongsTo implementation';
			container)
		*-
	((tWithAttributes property: #attributes)
			comment: 'List of attributes declared by this type.').


	"-----"
	"ASSOCIATIONS: catches"
	tThrowableCatch
		source: #catchingEntity *- ((tWithExceptions property: #throwablesCaught)
											comment: 'The throwables (like exceptions) caught by this entity')
		target: #caughtException *- (tThrowable property: #caughtBy).

	"(tThrowable property: #caughtBy)
		-*
	((tThrowableCatch property: #caughtException)
		 target).

	((tThrowableCatch property: #catchingEntity)
		 source)		
		*-
	((tWithExceptions property: #throwableCatched)
			comment: 'The throwable (like exceptions) caught by this entity')."

	"-----"
	"ASSOCIATIONS: ExceptionDeclaration"
	tThrowableDeclaration 
		source: #declaringEntity *- ((tWithExceptions property: #thrownsDeclared)
											comment: 'The throwables (like exceptions) declared thrown by this entity')
		target: #entitydeclared *- (tThrowable property: #thrownDeclarations).

	"((tThrowable property: #thrownDeclarations))
		-*
	((tThrowableDeclared property: #declaredException)
		 target).

	((tThrowableDeclared property: #declaringEntity)
		 source)		
		*-
	((tWithExceptions property: #declaredThrowns)
			comment: 'The throwables (like exceptions) declared thrown by this entity')."

	"-----"
	"ASSOCIATIONS: throws"
	tThrowableThrown
		source: #throwingEntity *- ((tWithExceptions property: #thrownExceptions)
											comment: 'The throwables (like exceptions) thrown by this entity')
		target: #throwedEntity *- (tThrowable property: #thrownBy).

	"((tThrowable property: #throwingEntities))
		*-*
	((tWithExceptions property: #thrownExceptions)
			comment: 'The exceptions thrown by the method')."

	"-----"
	"CONTAINER"
	((tComment property: #commentedEntity)
			comment: 'Source code commented by the comment';
			container)
		*-
	((tWithComments property: #comments)
			comment: 'List of comments for the entity').

	"-----"
	"CONTAINER"
	((tCompilationUnit property: #compilationUnitOwner)
			comment: 'The compilation unit that defines this module';
			container)
		-
	((tWithCompilationUnits property: #compilationUnit)).

	"-----"
	"ASSOCIATIONS: inherit from Invocation ?"
	"((tDereferencedInvocation property: #referencer)
			comment: 'Structural entity that references the BehaviouralEntity invoked')
		*-
	((tWithDereferencedInvocations property: #dereferencedInvocations)
			comment: 'List of invocations performed on BehaviouralEntities referenced by this entity')."

	"-----"
	"CONTAINER"
	((tEnumValue property: #parentEnum)
			comment: 'The Enum declaring this value. It offers the implementation of belongsTo';
			container)
		*-
	((tWithEnumValues property: #enumValues)).

	"-----"
	"CONTAINER"
	((tFolder property: #childrenFileSystemEntities)
			comment: 'List of entities contained in this folder.')
		-*
	((tFileSystemEntity property: #parentFolder)
		comment: 'Folder entity containing this file.';
		container).

	"-----"
	"ASSOCIATIONS: FileDeclarations ???"
	"CONTAINER ???"

	"((tFile property: #entities)
			comment: 'List of entities defined in the file')
		*-*
	((tWithFiles property: #containerFiles)
			comment: 'List of files containing the entity')."

	"-----"
	"ASSOCIATIONS: tFileInclude"
	tFileInclusion
		source: #includingFile *- ((tWithFileIncludes property: #filesIncluded)
											comment: 'The other files included in this entity.')
		target: #includedFile *- ((tWithFileIncludes property: #includedBy)
											comment: 'The other files that include this file.').
	"((tFileInclude property: #source)
			comment: 'The file that is including')
		*-
	((tWithFileIncludes property: #outgoingIncludeRelations)
			comment: 'The include entities that have this file as a source.').

	((tFileInclude property: #target)
			comment: 'The file that is included')
		*-
	((tWithFileIncludes property: #incomingIncludeRelations)
			comment: 'The include entities that have this file as a target.')."

	"-----"
	"CONTAINER"
	((tFunction property: #functionOwner)
			comment: 'The container defining the function. The function is placed in a container, because certain languages can nest functions in functions.';
			container)
		*-
	((tWithFunctions property: #functions)
			comment: 'Functions defined in the container, if any.').

	"-----"
	"CONTAINER"
	((tGlobalVariable property: #parentScope)
			comment: 'Scope declaring the global variable. belongsTo implementation';
			container)
		*-
	((tWithGlobalVariables property: #globalVariables)
			comment: 'Global variables defined in the scope, if any.').

	"-----"
	"CONTAINER"
	((tHeader property: #headerOwner)
		container )
		-
	((tWithHeaders property: #header)
		comment: 'The header file that defines this module').

	"-----"
	"CONTAINER"
	((tImplicitVariable property: #parentBehaviouralEntity)
			comment: 'The behaviour containing this implicit variable. belongsTo implementation';
			container)
		*-
	((tWithImplicitVariables property: #implicitVariables)
			comment: 'Implicit variables used locally by this behaviour.').

	"-----"
	"ASSOCIATION: Invocation"
	tInvocation
		source: #sender *- ((tWithInvocations property: #outgoingInvocations)
								comment: 'Outgoing invocations sent by this behaviour.')
		target: #candidates *-* ((tInvocable property: #incomingInvocations)
										comment: 'Incoming invocations from other behaviours computed by the candidate operator').

	"((tInvocable property: #incomingInvocations)
			comment: 'Incoming invocations from other behaviours computed by the candidate operator.')
		*-*
	((tInvocation property: #candidates)
			comment: 'List of candidate behavioural entities for receiving the invocation';
			target).

	((tInvocation property: #sender)
			comment: 'Behavioural entity making the call. from-side of the association';
			source)
		*-
	((tWithInvocations property: #outgoingInvocations)
			comment: 'Outgoing invocations sent by this behaviour.')."

	((tInvocation property: #receiver)
			comment: 'Named entity (variable, class...) receiving the invocation. to-side of the association')
		*-
	((tInvocationsReceiver property: #receivingInvocations)
			comment: 'List of invocations performed on this entity (considered as the receiver)').

	"-----"
	"ASSOCIATION: TImport"
	tImport
		source: #importingEntity *- (tWithImports property: #importedBy)
		target: #importedEntity *- ((tImportable property: #importedIn)
											comment: 'List of imports of this entity').

	"((tWithImports property: #outgoingImports)
			comment: '')
		-*
	((tImport property: #importingEntity)
			comment: 'Importing entity';
			source).

	((tImport property: #importedEntity)
			comment: 'Imported entity';
			target )
		*-
	((tImportable property: #incomingImports)
			comment: 'List of imports of this entity')."

	"-----"
	"CONTAINER"
	((tLocalVariable property: #parentBehaviouralEntity)
			comment: 'Behavioural entity declaring this local variable. belongsTo implementation';
			container)
		*-
	((tWithLocalVariables property: #localVariables)
			comment: 'Variables locally defined by this behaviour.').

	"-----"
	"CONTAINER"
	((tMethod property: #parentType)
			comment: 'Type declaring the method. It provides the implementation for belongsTo.';
			container)
		*-
	((tWithMethods property: #methods)
			comment: 'Methods declared by this type.').

	"-----"
	"CONTAINER"
	((tModule property: #moduleEntities))
		-*
	((tDefinedInModule property: #parentModule)
			comment: 'Module that contains the definition of this entity';
			container).

	"-----"
	"CONTAINER"
	((tPackage property: #childEntities))
		-*
	((tPackageable property: #parentPackage)
		comment: 'Package containing the entity in the code structure (if applicable)';
		container).

	"-----"
	"CONTAINER"
	((tParameter property: #parentBehaviouralEntity)
			comment: 'Behavioural entity containing this parameter. belongsTo implementation';
			container)
		*-
	((tWithParameters property: #parameters)
			comment: 'List of formal parameters declared by this behaviour.').

	"-----"
	"ASSOCIATION: TReference"
	tReference
		source: #referencer *- ((tWithReferences property: #outgoingReferences)
									comment: 'References from this entity to other entities.')
		target: #referredType *- ((tReferenceable property: #incomingReferences)
										comment: 'References to this entity by other entities.').

	"((tReference property: #referencer)
			comment: 'Source entity making the reference. from-side of the association';
			source)
		*-
	((tWithReferences property: #outgoingReferences)
			comment: 'References from this entity to other entities.').

	((tReference property: #referredType)
			comment: 'Target entity referenced. to-side of the association';
			target)
		*-
	((tReferenceable property: #incomingReferences)
			comment: 'References to this entity by other entities.')."

	"-----"
	"CONTAINER ???"
	((tSourceAnchor property: #element)
			comment: 'Enable the accessibility to the famix entity that this class is a source pointer for') "this relation was a container in the old FamixT"
		-
	((tSourceEntity property: #sourceAnchor)
			comment: 'SourceAnchor entity linking to the original source code for this entity').

	"-----"
	"REMOVE ???"
	((tSourceLanguage property: #sourcedEntities)
			comment: 'References to the entities saying explicitly that are written in this language.')
		-*
	((tWithSourceLanguages property: #declaredSourceLanguage)
			comment: 'The declared SourceLanguage for the source code of this entity').

	"-----"
	"ASSOCIATION: TInheritance"
	tInheritance
		source: #subclass *- ((tWithInheritances property: #superInheritances)
									comment: 'Superinheritance relationships, i.e. known superclasses of this type.')
		target: #superclass *- ((tWithInheritances property: #subInheritances)
									comment: 'Subinheritance relationships, i.e. known subclasses of this type.').

	"((tInheritance property: #subclass)
			comment: 'Subclass linked to in this relationship. from-side of the association';
			source)
		*-
	((tWithInheritances property: #superInheritances)
			comment: 'Superinheritance relationships, i.e. known superclasses of this type.').

	((tInheritance property: #superclass)
			comment: 'Superclass linked to in this relationship. to-side of the association';
			target)
		*-
	((tWithInheritances property: #subInheritances)
			comment: 'Subinheritance relationships, i.e. known subclasses of this type.')."

	"-----"
	"REMOVE
	 ASSOCIATION: template ???"

	"((tTemplate property: #templateOwner)
		container)
		*-
	((tWithTemplates property: #templates)).

	((tTemplate property: #templateUsers))
		-*
	((tTemplateUser property: #template))."

	"-----"
	"CONTAINER"
	((tTrait property: #traitOwner)
		container )
		*-
	((tWithTraits property: #traits)).

	"-----"
	"ASSOCIATION: TraitUsage"
	tTraitUsage
		source: #trait *- (tTrait property: #incomingTraitUsages)
		target: #user *- (tTraitUser property: #outgoingTraitUsages).

	"((tTrait property: #incomingTraitUsages))
		-*
	((tTraitUsage property: #trait)
		source).

	(tTraitUser property: #outgoingTraitUsages)
		-*
	((tTraitUsage property: #user)
		target)."

	"-----"
	"CONTAINER"
	((tType property: #typeContainer)
			comment: 'Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).';
			container)
		*-
	((tWithTypes property: #types)
		comment: 'Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.').

	"-----"
	"ASSOCIATION: tTypeAlias"
	tAlias
		source: #alias *- ((tTypeAlias property: #originalType)
								comment: 'Points to the actual type.')
		target: #aliasedType - ((tWithTypeAliases property: #typeAliases)
									comment: 'Aliases made on this type').

	"((tTypeAlias property: #aliasedType)
			comment: 'Points to the actual type.')
		*-
	((tWithTypeAliases property: #typeAliases)
			comment: 'Aliases')."

	"-----"
	"ASSOCIATION: DeclaredType"
	tTypedDeclaration
		source: #declaredEntity - ((tTypedEntity property: #declaredType)
											comment: 'Declaredtype of the entity')
		target: #type *- ((tType property: #typedEntities)
								comment: 'Entities that have this type as declaredType').

	"((tTypedEntity property: #declaredType)
			comment: 'Type of the entity, if any')
		*-
	((tType property: #typedEntities)
			comment: 'Entities that have this type as declaredType')."

	"-----"
	"ASSOCIATION: TImplementation"
	tImplementation
		source: #implementingClass *- ((tCanImplement property: #interfaceImplementations)
												comment: 'Implementation relationships')
		target: #interface *- ((tImplementable property: #implementations)
									comment: 'Implementation relationships.').

	"((tImplementation property: #implementingClass)
			comment: 'Class linked to in this relationship. from-side of the association';
			source)
		*-
	((tCanImplement property: #interfaceImplementations)
			comment: 'Implementation relationships').

	((tImplementation property: #interface)
			comment: 'Interface linked to in this relationship. to-side of the association';
			target)
		*-
	((tImplementable property: #implementations)
			comment: 'Implementation relationships.')."

	"-----"
	"Simple relation between 2 ASSOCIATIONs"
	(tConcretization property: #parameterConcretizations)
		*-*
	(tParameterConcretization property: #concretizations).

	"-----"
	"ASSOCIATION"
	tGenericParameterization
		source: #genericEntity *- ((tParametricEntity property: #genericParameters)
											comment: 'List of parameters for this generic entity')
		target: #parameter *- ((tConcreteParameterType property: #genericEntities)
										comment: 'The generic in which this parameter appears').

	"((tGenericParameterType property: #genericEntities)
			comment: 'The generic entities that use me.')
		*-*
	((tParametricEntity property: #genericParameters)
			comment: 'List of generic parameters.')."

	"-----"
	"ASSOCIATION"
	tConcreteParameterization
		source: #genericEntity *- ((tParametricEntity property: #concreteParameters)
											comment: 'List of concrete parameters for this generic entity')
		target: #parameter *- ((tConcreteParameterType property: #concreteEntities)
										comment: 'The generic in which this concrete parameter appears').

	"((tConcreteParameterType property: #concreteEntities)
			comment: 'The concrete entities that use me.')
		*-*
	((tParametricEntity property: #concreteParameters)
			comment: 'List of concrete parameters.')."

	"-----"
	"ASSOCIATION: ParameterConcretization"
	tParameterConcretization
		source: #concreteParameter *- ((tConcreteParameterType property: #generics)
												comment: 'Generic relationships, i.e. known genericParameter of this type.')
		target: #genericParameter *- ((tGenericParameterType property: #concretizations)
												comment: 'Concretization relationships, i.e. known concretizations of this type.').

	"((tParameterConcretization property: #genericParameter)
			comment: 'Generic parameter linked to in this relationship. from-side of the association';
			source)
		*-
	((tGenericParameterType property: #concretizations)
			comment: 'Concretization relationships, i.e. known concretizations of this type.').

	((tParameterConcretization property: #concreteParameter)
			comment: 'Concrete parameter linked to in this relationship. to-side of the association';
			target)
		*-
	((tConcreteParameterType property: #generics)
			comment: 'Generic relationships, i.e. known genericParameter of this type.')."

	"-----"
	"ASSOCIATION: Concretization"
	tConcretization
		source: #concreteEntity - ((tParametricEntity property: #genericization)
											comment: 'Generic entity relationship, i.e. the association to the generic entity of this type.')
		target: #genericEntity *- ((tParametricEntity property: #concretizations)
											comment: 'Concretization relationships, i.e. the associations of known concrete entities of this type.').

	"((tConcretization property: #genericEntity)
			comment: 'Generic entity linked to in this relationship. from-side of the association';
			source)
		*-
	((tParametricEntity property: #concretizations)
			comment: 'Concretization relationships, i.e. the associations of known concrete entities of this type.').

	((tConcretization property: #concreteEntity)
			comment: 'Concrete entity linked to in this relationship. to-side of the association';
			target)
		-
	((tParametricEntity property: #genericization)
			comment: 'Generic entity relationship, i.e. the association to the generic entity of this type.')."

]

{ #category : #definition }
NewFamixGenerator >> defineTraits [
	super defineTraits.

	tAlias := builder newTraitNamed: #TAlias.

	tAccess := builder newTraitNamed: #TAccess.
	tAccess comment: self commentForTAccess.
	tAccess withTesting.

	tAccessible := builder newTraitNamed: #TAccessible.
	tAccessible comment: self commentForTAccessible.

	tAnnotationInstance := builder newTraitNamed: #TAnnotationInstance.
	tAnnotationInstance comment: self commentForTAnnotationInstance.
	tAnnotationInstance withGroup.

	tAnnotationInstanceAttribute := builder newTraitNamed: #TAnnotationInstanceAttribute.
	tAnnotationInstanceAttribute comment: self commentForTAnnotationInstanceAttribute.

	tAnnotationType := builder newTraitNamed: #TAnnotationType.
	tAnnotationType comment: self commentForTAnnotationType.
	tAnnotationType withGroup.

	tAnnotationTypeAttribute := builder newTraitNamed: #TAnnotationTypeAttribute.
	tAnnotationTypeAttribute comment: self commentForTAnnotationTypeAttribute.

	tAssociation := builder newTraitNamed: #TAssociation.
	tAssociation comment: self commentForTAssociation.
	tAssociation withTesting.

	tAttribute := builder newTraitNamed: #TAttribute.
	tAttribute comment: self commentForTAttribute.
	tAttribute withTesting.

	tCanBeAbstract := builder newTraitNamed: #TCanBeAbstract.
	tCanBeFinal := builder newTraitNamed: #TCanBeFinal.
	tCanBeClassSide := builder newTraitNamed: #TCanBeClassSide.

	tClass := builder newTraitNamed: #TClass.
	tClass comment: self commentForTClass.
	tClass withTesting.

	tClassMetrics := builder newTraitNamed: #TClassMetrics.

	tClassGroup := tClass withGroup.

	tClassWithVisibility := builder newTraitNamed: #TClassWithVisibility.

	tComment := builder newTraitNamed: #TComment.
	tComment comment: self commentForTComment.

	tCompilationUnit := builder newTraitNamed: #TCompilationUnit.
	tCompilationUnit comment: self commentForTCompilationUnit.

	tConcreteParameterization  := (builder newTraitNamed: #TConcreteParameterization)
		comment: 'An association between a generic type and concrete parameter types it uses'.

	tDereferencedInvocation := builder newTraitNamed: #TDereferencedInvocation.
	tDereferencedInvocation comment: self commentForTDereferencedInvocation.

	tEnumValue := builder newTraitNamed: #TEnumValue.
	tEnumValue comment: self commentForTEnumValue.
	tEnumValue withTesting.

	tEnum := builder newTraitNamed: #TEnum.
	tEnum comment: self commentForTEnum.

	tException := builder newTraitNamed: #TException.
	tException comment: self commentForTException.
	tException withTesting.

	tFile := builder newTraitNamed: #TFile.
	tFile comment: self commentForTFile.
	tFile withGroup.

	tFolder := builder newTraitNamed: #TFolder.
	tFolder comment: self commentForTFolder.
	tFolder withGroup.

	tFileSystemEntity := builder newTraitNamed: #TFileSystemEntity.

	tFileAnchor := builder newTraitNamed: #TFileAnchor.
	tFileAnchor comment: self commentForTFileAnchor.
	tFileAnchor withTesting.

	tFileNavigation := builder newTraitNamed: #TFileNavigation.
	tFileNavigation comment: self commentForTFileNavigation.

	tGenericParameterization   := (builder newTraitNamed: #TGenericParameterization)
		comment: 'An association between a generic type and parameter types it defines'.

	tIndexedFileNavigation := builder newTraitNamed: #TIndexedFileNavigation.
	tIndexedFileNavigation comment: self commentForTIndexedFileNavigation.

	tFileInclusion := builder newTraitNamed: #TFileInclusion.
	tFileInclusion comment: self commentForTFileInclude.

	tFunction := builder newTraitNamed: #TFunction.
	tFunction comment: self commentForTFunction.
	tFunction withTesting.

	tGlobalVariable := builder newTraitNamed: #TGlobalVariable.
	tGlobalVariable comment: self commentForTGlobalVariable.
	tGlobalVariable withGroup.
	tGlobalVariable withTesting.

	tHasImmediateSource := builder newTraitNamed: #THasImmediateSource.
	tHasImmediateSource comment: self commentForTHasImmediateSource.

	tHasKind := builder newTraitNamed: #THasKind.
	tHasKind comment: self commentForTHasKind.

	tHasModifiers := builder newTraitNamed: #THasModifiers.

	tHasSignature := builder newTraitNamed: #THasSignature.
	tHasSignature comment: self commentForTHasSignature.

	tHasVisibility := builder newTraitNamed: #THasVisibility.

	tHeader := builder newTraitNamed: #THeader.
	tHeader comment: self commentForTHeader.

	tImplicitVariable := builder newTraitNamed: #TImplicitVariable.
	tImplicitVariable comment: self commentForTImplicitVariable.
	tImplicitVariable withTesting.

	tImport := builder newTraitNamed: #TImport.
	tImportable := builder newTraitNamed: #TImportable.

	tInheritance := builder newTraitNamed: #TInheritance.
	tInheritance comment: self commentForTInheritance.
	tInheritance withTesting.

	tInvocable := builder newTraitNamed: #TInvocable.
	tInvocable comment: self commentForTInvocable.

	tInvocation := builder newTraitNamed: #TInvocation.
	tInvocation comment: self commentForTInvocation.
	tInvocation withTesting.
	tInvocation withGroup.

	tInvocationsReceiver := builder newTraitNamed: #TInvocationsReceiver.
	tInvocationsReceiver comment: self commentForTInvocationsReceiver.

	tLocalVariable := builder newTraitNamed: #TLocalVariable.
	tLocalVariable comment: self commentForTLocalVariable.
	tLocalVariable withTesting.

	tMethod := builder newTraitNamed: #TMethod.
	tMethod comment: self commentForTMethod.
	tMethod withTesting.
	tMethod withGroup.

	tMethodMetrics := builder newTraitNamed: #TMethodMetrics.

	tModule := builder newTraitNamed: #TModule.
	tModule comment: self commentForTModule.
	tModule withTesting.

	tNamedEntity := builder newTraitNamed: #TNamedEntity.
	tNamedEntity comment: self commentForTNamed.

	tNamespace := builder newTraitNamed: #TNamespace.
	tNamespace comment: self commentForTNamespace.
	tNamespace withTesting.
	tNamespace withGroup.

	tPackage := builder newTraitNamed: #TPackage.
	tPackage comment: self commentForTPackage.
	tPackage withTesting.
	tPackage withGroup.

	tPackageable := builder newTraitNamed: #TPackageable.
	tPackageable comment: self commentForTPackageable.

	tParameter := builder newTraitNamed: #TParameter.
	tParameter comment: self commentForTParameter.

	tPreprocessorDefine := builder newTraitNamed: #TPreprocessorDefine.
	tPreprocessorDefine comment: self commentForTPreprocessorDefine.

	tPreprocessorIfdef := builder newTraitNamed: #TPreprocessorIfdef.
	tPreprocessorIfdef comment: self commentForTPreprocessorIfdef.

	tPrimitiveType := builder newTraitNamed: #TPrimitiveType.
	tPrimitiveType withTesting.

	tReference := builder newTraitNamed: #TReference.
	tReference comment: self commentForTReference.
	tReference withTesting.

	tReferenceable := builder newTraitNamed: #TReferenceable.
	tReferenceable comment: self commentForTReferenceable.

	tRelativeSourceAnchor := builder newTraitNamed: #TRelativeSourceAnchor.
	tRelativeSourceAnchor comment: self commentForTRelativeSourceAnchor.

	tSourceAnchor := builder newTraitNamed: #TSourceAnchor.
	tSourceAnchor comment: self commentForTSourceAnchor.

	tSourceEntity := builder newTraitNamed: #TSourceEntity.
	tSourceEntity comment: self commentForTSourceEntity.

	tSourceLanguage := builder newTraitNamed: #TSourceLanguage.
	tSourceLanguage comment: self commentForTSourceLanguage.

	tStructuralEntity := builder newTraitNamed: #TStructuralEntity.
	tStructuralEntity comment: self commentForTStructuralEntity.
	tStructuralEntity withTesting.

	tTemplate := builder newTraitNamed: #TTemplate.
	tTemplate comment: self commentForTTemplate.

	tTemplateUser := builder newTraitNamed: #TTemplateUser.
	tTemplateUser comment: self commentForTTemplateUser.

	tTrait := builder newTraitNamed: #TTrait.
	tTrait comment: self commentForTTrait.

	tTraitUsage := builder newTraitNamed: #TTraitUsage.

	tTraitUser := builder newTraitNamed: #TTraitUser.

	tType := builder newTraitNamed: #TType.
	tType comment: self commentForTType.
	tType withTesting.
	tTypeGroup := tType withGroup.

	tTypeAlias := builder newTraitNamed: #TTypeAlias.
	tTypeAlias comment: self commentForTTypeAlias.

	tTypedEntity := builder newTraitNamed: #TTypedEntity.
	tTypedEntity comment: self commentForTTypedStructure.

	tUnknownVariable := builder newTraitNamed: #TUnknownVariable.

	tWithAccesses := builder newTraitNamed: #TWithAccesses.
	tWithAccesses comment: self commentForTWithAccesses.

	tWithAnnotationInstances := builder newTraitNamed: #TWithAnnotationInstances.
	tWithAnnotationInstances comment: self commentForTWithAnnotationInstances.

	tWithAnnotationTypes := builder newTraitNamed: #TWithAnnotationTypes.
	tWithAnnotationTypes comment: self commentForTWithAnnotationTypes.

	tWithAttributes := builder newTraitNamed: #TWithAttributes.
	tWithAttributes comment: self commentForTWithAttributes.

	tWithClasses := builder newTraitNamed: #TWithClasses.
	tWithClasses comment: self commentForTWithClasses.

	tWithComments := builder newTraitNamed: #TWithComments.
	tWithComments comment: self commentForTWithComments.

	tWithCompilationUnits := builder newTraitNamed: #TWithCompilationUnits.
	tWithCompilationUnits comment: self commentForTWithCompilationUnit.

	tWithDereferencedInvocations := builder newTraitNamed: #TWithDereferencedInvocations.
	tWithDereferencedInvocations comment: self commentForTWithDereferencedInvocations.

	tWithEnumValues := builder newTraitNamed: #TWithEnumValues.
	tWithEnumValues comment: self commentForTWithEnumValues.

	tWithExceptions := builder newTraitNamed: #TWithExceptions.
	tWithExceptions comment: self commentForTWithExceptions.

	tWithFileIncludes := builder newTraitNamed: #TWithFileIncludes.
	tWithFileIncludes comment: self commentForTWithFileIncludes.

	tWithFiles := builder newTraitNamed: #TWithFiles.
	tWithFiles comment: self commentForTWithFiles.

	tWithFunctions := builder newTraitNamed: #TWithFunctions.
	tWithFunctions comment: self commentForTWithFunctions.

	tWithGlobalVariables := builder newTraitNamed: #TWithGlobalVariables.
	tWithGlobalVariables comment: self commentForTWithGlobalVariables.

	tWithHeaders := builder newTraitNamed: #TWithHeaders.
	tWithHeaders comment: self commentForTWithHeader.

	tWithImplicitVariables := builder newTraitNamed: #TWithImplicitVariables.
	tWithImplicitVariables comment: self commentForTWithImplicitVariables.

	tWithImports := builder newTraitNamed: #TWithImports.

	tWithInheritances := builder newTraitNamed: #TWithInheritances.
	tWithInheritances comment: self commentForTWithInheritances.

	tWithInvocations := builder newTraitNamed: #TWithInvocations.
	tWithInvocations comment: self commentForTWithInvocations.

	tWithLocalVariables := builder newTraitNamed: #TWithLocalVariables.
	tWithLocalVariables comment: self commentForTWithLocalVariables.

	tWithMethods := builder newTraitNamed: #TWithMethods.
	tWithMethods comment: self commentForTWithMethods.

	tDefinedInModule := builder newTraitNamed: #TDefinedInModule.
	tDefinedInModule comment: self commentForTDefinedInModule.

	tWithParameters := builder newTraitNamed: #TWithParameters.
	tWithParameters comment: self commentForTWithParameters.

	tWithReferences := builder newTraitNamed: #TWithReferences.
	tWithReferences comment: self commentForTWithReferences.

	tWithSourceLanguages := builder newTraitNamed: #TWithSourceLanguages.
	tWithSourceLanguages comment: self commentForTWithSourceLanguage.

	tWithTemplates := builder newTraitNamed: #TWithTemplates.
	tWithTemplates comment: self commentForTWithTemplates.

	tWithTraits := builder newTraitNamed: #TWithTraits.
	tWithTraits comment: self commentForTWithTraits.

	tWithTypeAliases := builder newTraitNamed: #TWithTypeAliases.
	tWithTypeAliases comment: self commentForTWithTypeAliases.

	tWithTypes := builder newTraitNamed: #TWithTypes.
	tWithTypes comment: self commentForTWithTypes.

	tWithStatements := builder newTraitNamed: #TWithStatements.
	tWithStatements testingSelector: #isBehavioural.

	tMultipleFileAnchor := builder newTraitNamed: #TMultipleFileAnchor.

	tCohesionCouplingMetrics := builder newTraitNamed: #TCohesionCouplingMetrics.

	tLCOMMetrics := builder newTraitNamed: #TLCOMMetrics.

	tImplementable := builder newTraitNamed: #TImplementable.
	tImplementable comment: self commentForTImplementable.

	tCanImplement := builder newTraitNamed: #TCanImplement.
	tCanImplement comment: self commentForTCanImplement.

	tImplementation := builder newTraitNamed: #TImplementation.

	tParametricEntity := builder newTraitNamed: #TParametricEntity.
	tParametricEntity comment: self commentForTParametricEntity.
	tParametricEntity withTesting.

	tConcreteParameterType := builder newTraitNamed: #TConcreteParameterType.
	tConcreteParameterType comment: self commentForTConcreteParameterType.

	tGenericParameterType := builder newTraitNamed: #TGenericParameterType.
	tGenericParameterType comment: self commentForTGenericParameterType.

	tConcretization := builder newTraitNamed: #TConcretization.
	tConcretization comment: self commentForTConcretization.

	tParameterConcretization := builder newTraitNamed: #TParameterConcretization.
	tParameterConcretization comment: self commentForTParameterConcretization.

	tThrowable := builder newTraitNamed: #TThrowable.
	tThrowable comment: self commentForTThrowable.

	tThrowableCatch := (builder newTraitNamed: #TThrowableCatch)
		comment: 'Association between a Throwable (like an exception) and an entity catching it'.

	tThrowableDeclaration := (builder newTraitNamed: #TThrowableDeclaration)
		comment: 'Association between a Throwable (like an exception) and an entity declaring to throw it'.

	tThrowableThrown := (builder newTraitNamed: #TThrowableThrown)
		comment: 'Association between a Throwable (like an exception) and an entity throwing it'.


	tTypedDeclaration := (builder newTraitNamed: #TTypedDeclaration)
		comment: 'Association between a typed entity and its type'.

]
