Class {
	#name : #FamixJavaParametricTest,
	#superclass : #TestCase,
	#instVars : [
		'parametricClass'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaParametricTest >> setUp [

	super setUp.

	parametricClass := FamixJavaParametricClass named: 'ParametricClass'
]

{ #category : #running }
FamixJavaParametricTest >> test1 [
	"List<Object> testMethod(List<Object> list)"

	| method parametre list |
	method := FamixJavaParametricMethod named: 'testMethod'.
	parametre := FamixJavaParameter named: 'list'.
	list := FamixJavaParametricClass named: 'List'.
	list addConcreteParameter: (FamixJavaType named: 'Object').
	parametre declaredType: list.
	method addParameter: parametre.
	method declaredType: list.
	method addConcreteParameter: list
]

{ #category : #running }
FamixJavaParametricTest >> test2 [
	"public <T extends Building> genericMethod(T t)"

	| m p return |
	m := FamixJavaParametricMethod named: 'genericMethod'.
	p := FamixJavaParameter named: 't'.
	p declaredType: (FamixJavaParameterType named: 'T').
	m addParameter: p.
	return := FamixJavaParameterType named: 'T'.
	FamixJavaInheritance new
		subclass: return;
		superclass: (FamixJavaClass named: 'Building').
	m declaredType: return
]

{ #category : #running }
FamixJavaParametricTest >> test3 [
	"class ClassA<K, V> {}
	class ClassB extends ClassA<String, V> {
		private void method(Integer num, String s, V v) {}
	}"

	| classA k v string |
	(classA := FamixJavaParametricClass named: 'ClassA')
		genericParameters: {
				(k := FamixJavaParameterType named: 'K').
				(v := FamixJavaParameterType named: 'V') }.

	FamixJavaConcretization new
		concreteEntity: (FamixJavaParametricClass named: 'ClassA');
		genericEntity: classA.

	FamixJavaParameterConcretization new
		concreteParameter: (string := FamixJavaClass named: 'string');
		genericParameter: k.

	(FamixJavaParametricMethod named: 'method')
		parameters: {
				((FamixJavaParameter named: 'num') declaredType:
						 (FamixJavaClass named: 'Integer')).
				((FamixJavaParameter named: 's') declaredType: string).
				((FamixJavaParameter named: 'v') declaredType: v) };
		addGenericParameter: v
]

{ #category : #running }
FamixJavaParametricTest >> testConcreteAndGenericParameter [
	"classA<V> --> classB extends classA<String>"

	| parameter1 parameter2 |
	parameter1 := FamixJavaType named: 'String'.
	parameter2 := FamixJavaParameterType named: 'V'.

	parametricClass concreteParameters: { parameter1 }.
	parametricClass genericParameters: { parameter2 }.
	self
		assertCollection: parametricClass concreteParameters
		hasSameElements: { parameter1 }.
	self
		assertCollection: parametricClass genericParameters
		hasSameElements: { parameter2 }
]

{ #category : #running }
FamixJavaParametricTest >> testConcretizationEntity [
	"List<T> --> classB extends List<String>"

	| listT listString |
	listT := FamixJavaParametricClass named: 'ListT'.
	listString := FamixJavaParametricClass named: 'ListString'.
	FamixJavaConcretization new
		concreteEntity: listString;
		genericEntity: listT.
	self
		assertCollection: (listT concretizations collect: #concreteEntity)
		hasSameElements: { listString }
]

{ #category : #running }
FamixJavaParametricTest >> testConcretizationParameter [
	"classA<parametric> --> classB extends classA<Generic>"

	| parameterConcrete parameterGeneric |
	parameterConcrete := FamixJavaType named: 'parametric'.
	parameterGeneric := FamixJavaParameterType named: 'Generic'.
	FamixJavaParameterConcretization new
		concreteParameter: parameterConcrete;
		genericParameter: parameterGeneric.
	self
		assertCollection:
		(parameterGeneric concretizations collect: #concreteParameter)
		hasSameElements: { parameterConcrete }
]

{ #category : #running }
FamixJavaParametricTest >> testInheritanceClass [

	| class1 class2 |
	class1 := FamixJavaClass named: 'Class1'.
	class2 := FamixJavaClass named: 'Class2'.

	parametricClass addSubInheritance: (FamixJavaInheritance new
			 subclass: class1;
			 superclass: parametricClass).

	class1 addSubInheritance: (FamixJavaInheritance new
			 subclass: class2;
			 superclass: class1).

	self
		assertCollection: parametricClass subclassHierarchy
		hasSameElements: {
				class1.
				class2 }
]

{ #category : #running }
FamixJavaParametricTest >> testInheritanceParameter [
	"<subConcrete extends subGenerique> <subGeneric extends supGeneric>"

	| supGeneric subGeneric subConcrete |
	supGeneric := FamixJavaParameterType named: 'supGeneric'.
	subGeneric := FamixJavaParameterType named: 'subGeneric'.
	subConcrete := FamixJavaClass named: 'String'.

	FamixJavaInheritance new
		subclass: subGeneric;
		superclass: supGeneric.
	self
		assertCollection: (supGeneric subInheritances collect: #subclass)
		hasSameElements: { subGeneric }.
	subConcrete addSuperInheritance: (FamixJavaInheritance new
			 subclass: subConcrete;
			 superclass: supGeneric).
	self
		assertCollection: (supGeneric subInheritances collect: #subclass)
		hasSameElements: {
				subGeneric.
				subConcrete }
]

{ #category : #running }
FamixJavaParametricTest >> testIsConcreteEntity [

	self assert: parametricClass isGenericEntity.

	FamixJavaConcretization new
		genericEntity: FamixJavaParametricClass new;
		concreteEntity: parametricClass.
	self deny: parametricClass isGenericEntity
]

{ #category : #running }
FamixJavaParametricTest >> testUsesGenerics [

	| parameter1 parameter2 |
	parameter1 := FamixJavaType named: 'String'.
	parameter2 := FamixJavaParameterType named: 'V'.
	self deny: parametricClass usesGenerics.

	parametricClass addConcreteParameter: parameter1.
	self deny: parametricClass usesGenerics.

	parametricClass addGenericParameter: parameter2.
	self assert: parametricClass usesGenerics.

	"a concrete parameter can still be generic"
	parametricClass genericParameters: {  }.
	parametricClass addConcreteParameter: parameter2.
	self assert: parametricClass usesGenerics
]
