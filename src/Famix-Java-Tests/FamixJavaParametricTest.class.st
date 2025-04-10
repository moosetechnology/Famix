Class {
	#name : #FamixJavaParametricTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'stringClass',
		'listTypeParameter',
		'genericListClass'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaParametricTest >> setUp [

	super setUp.
	model := FamixJavaModel new.

	stringClass := model newClassNamed: 'String'.

	listTypeParameter := model newTypeParameter
		                     name: 'E';
		                     yourself.
	genericListClass := model newParametricClass
		                    name: 'List';
		                    addTypeParameter: listTypeParameter
]

{ #category : #running }
FamixJavaParametricTest >> test1 [
	"public List<String> testMethod(List<String> list)"

	| method parameter |
	method := model newParametricMethod
		          name: 'testMethod';
		          yourself.

	method typing: (model newParametricEntityTyping
			 declaredType: genericListClass;
			 addConcretization: (model newConcretization
					  genericParameter: listTypeParameter;
					  concreteParameter: stringClass;
					  yourself);
			 yourself).

	parameter := model newParameterNamed: 'list'.
	method addParameter: parameter.

	parameter typing: (model newParametricEntityTyping
			 declaredType: genericListClass;
			 addConcretization: (model newConcretization
					  genericParameter: listTypeParameter;
					  concreteParameter: stringClass;
					  yourself);
			 yourself)
]

{ #category : #running }
FamixJavaParametricTest >> test2 [
	"public <B extends Building> void genericMethod(B b)"

	| method parameter typeParameter |
	method := model newMethod
		     name: 'genericMethod';
		     yourself.

	typeParameter := model newTypeParameter
		                 name: 'B';
		                 upperBound:
			                 (model newClassNamed: 'Building') yourself.

	parameter := model newParameterNamed: 'b'.
	method addParameter: parameter.

	parameter typing: (model newEntityTyping
			 declaredType: typeParameter;
			 yourself)
]

{ #category : #running }
FamixJavaParametricTest >> test3 [
	"
public class ClassA<K, V> {}

public class ClassB<V> extends ClassA<String, V> {

		private void method(String s, V v) {}

}"

	| classA k vFromClassA classB vFromClassB method |
	"ClassA"
	classA := model newParametricClass
		          name: 'ClassA';
		          yourself.
	k := model newTypeParameter
		     name: 'K';
		     yourself.
	vFromClassA := model newTypeParameter
		               name: 'V';
		               yourself.
	classA typeParameters: {
			k.
			vFromClassA }.

	"ClassB"
	classB := model newParametricClass
		          name: 'ClassB';
		          yourself.
	vFromClassB := model newTypeParameter
		               name: 'V';
		               yourself.
	classB addTypeParameter: vFromClassB.

	"Inheritance"
	model newParametricInheritance
		superclass: classB;
		subclass: classB;
		addConcretization: (model newConcretization
				 genericParameter: k;
				 concreteParameter: stringClass);
		addConcretization: (model newConcretization
				 genericParameter: vFromClassA;
				 concreteParameter: vFromClassB).

	"Method"
	method := model newMethodNamed: 'method'.
	method addParameter: ((model newParameterNamed: 's') typing:
			 (model newEntityTyping declaredType: stringClass)).
	method addParameter: ((model newParameterNamed: 'v') typing:
			 (model newEntityTyping declaredType: vFromClassB))
]

{ #category : #running }
FamixJavaParametricTest >> testConcreteAndGenericParameter [
	"
public ClassA<V>

public ClassB extends classA<String>"

	| classA classB v |
	"ClassA"
	classA := model newParametricClass name: 'ClassA'.
	v := model newTypeParameter
		     name: 'V';
		     yourself.
	classA addTypeParameter: v.

	"ClassB"
	classB := model newClassNamed: 'ClassB'.

	"Inheritance"
	model newParametricInheritance
		subclass: classB;
		superclass: classA;
		addConcretization: (model newConcretization
				 concreteParameter: stringClass;
				 genericParameter: v).

	self assertCollection: classA typeParameters hasSameElements: { v }.
	self deny: classB isParametricEntity
]

{ #category : #running }
FamixJavaParametricTest >> testConcretizationEntity [
	"classB extends List<String>"

	| genericList classB e |
	genericList := model newParametricClass
		               name: 'ListT';
		               yourself.

	classB := model newClassNamed: 'ClassB'.

	e := model newTypeParameter
		     name: 'E';
		     genericEntity: genericList;
		     yourself.

	model newParametricInheritance
		superclass: genericList;
		subclass: classB;
		addConcretization: (model newConcretization
				 genericParameter: e;
				 concreteParameter: stringClass).

	self
		assertCollection: genericList typeParameters
		hasSameElements: { e }.
	self
		assertCollection: (e concretizations collect: #concreteParameter)
		hasSameElements: { stringClass }
]

{ #category : #running }
FamixJavaParametricTest >> testConcretizationParameter [
	"
public classA<E>

public classB extends classA<String>"

	| classA e classB |
	"ClassA"
	classA := model newParametricClass
		          name: 'ClassA';
		          yourself.
	e := model newTypeParameter
		     name: 'E';
		     genericEntity: classA;
		     yourself.

	"ClassB"
	classB := model newClassNamed: 'ClassB'.

	"Inheritance"
	model newParametricInheritance
		superclass: classA;
		subclass: classB;
		addConcretization: (model newConcretization
				 genericParameter: e;
				 concreteParameter: stringClass;
				 yourself).
	self
		assertCollection: (e concretizations collect: #concreteParameter)
		hasSameElements: { stringClass }
]
