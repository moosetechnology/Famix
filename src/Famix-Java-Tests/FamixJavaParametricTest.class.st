Class {
	#name : #FamixJavaParametricTest,
	#superclass : #TestCase,
	#instVars : [
		'parametricClass1'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaParametricTest >> setUp [
	super setUp.
	
	parametricClass1 := FamixJavaParametricClass named:'ParametricClass1'
	
]

{ #category : #running }
FamixJavaParametricTest >> test1 [
"List<Object> testMethod(List<Object> list)"
| method parametre list |

method := FamixJavaParametricMethod named:'testMethod'.
parametre := FamixJavaParameter named:'list'.
list := FamixJavaParametricClass named:'List'.
list addConcreteParameter: (FamixJavaType named:'Object').
parametre declaredType: list.
method addParameter: parametre.
method declaredType: list.
method addConcreteParameter: list




]

{ #category : #running }
FamixJavaParametricTest >> test2 [

"public <T extends Building> genericMethod(T t)"
| m p return |
m:= FamixJavaParametricMethod named:'genericMethod'.
p := FamixJavaParameter named:'t'.
p declaredType: (FamixJavaParameterType named:'T').
m addParameter: p.
return := FamixJavaParameterType named:'T'.
FamixJavaInheritance new subclass: return ; superclass: (FamixJavaClass named:'Building').
m declaredType: return.
m.




]

{ #category : #running }
FamixJavaParametricTest >> test3 [

"public class ClassA<K, V> {}
	public class ClassB extends classA{String, V}
		private void method (Interger num ,String s, V v){
		}"

| method classA k v classAbis string num s t vparam |
classA := FamixJavaParametricClass named:'ClassA'.
k := FamixJavaParameterType named:'K'.
v := FamixJavaParameterType named:'V'.
classA genericParameters: { k.v }.
classAbis := FamixJavaParametricClass named:'ClassA'.
FamixJavaConcretisation new concreteEntity: classAbis ; genericEntity: classA.
string :=FamixJavaType named:'string'.
FamixJavaParameterConcretisation new concreteParameter: string ; genericParameter: k.

method := FamixJavaParametricMethod named:'method'.
num := FamixJavaParameter named:'num'.
s := FamixJavaParameter named:'s'.
vparam := FamixJavaParameter named:'v'.
num declaredType: (FamixJavaClass named:'Integer').
s declaredType: (FamixJavaClass named:'String').
vparam declaredType: v.
method parameters: { num. s. vparam }.
method addGenericParameter: vparam declaredType .

]

{ #category : #running }
FamixJavaParametricTest >> testConcreteAndGenericParameter [
"classA<V>      --> classB extends classA<String>"
	| parameter1 parameter2 |
	parameter1 := FamixJavaType named: 'String'.
	parameter2 := FamixJavaParameterType named: 'V'.

	parametricClass1 concreteParameters: { parameter1 }.
	parametricClass1 genericParameters: { parameter2 }.
	self
		assertCollection: parametricClass1 concreteParameters
		hasSameElements: { parameter1 }.
	self
		assertCollection: parametricClass1 genericParameters
		hasSameElements: { parameter2 }
]

{ #category : #running }
FamixJavaParametricTest >> testConcretisationEntity [
"List<T> --> classB extends List<String>"
| listT listString |
listT := FamixJavaParametricClass named: 'ListT'.
listString := FamixJavaParametricClass named: 'ListString'.
FamixJavaConcretisation new concreteEntity: listString ; genericEntity: listT .
self assertCollection: (listT concretisations collect:#concreteEntity  )
		hasSameElements: { listString }
]

{ #category : #running }
FamixJavaParametricTest >> testConcretisationParameter [
"classA<parametric> --> classB extends classA<Generic>"
| parameterConcrete parameterGeneric |
parameterConcrete := FamixJavaType named:'parametric'.
parameterGeneric := FamixJavaParameterType named:'Generic'.
FamixJavaParameterConcretisation  new concreteParameter: parameterConcrete; genericParameter: parameterGeneric.

self assertCollection: (parameterGeneric concretisations collect:#concreteParameter ) hasSameElements:{parameterConcrete } 
]

{ #category : #running }
FamixJavaParametricTest >> testInheritanceClass [

| class1 class2 |

class1 := FamixJavaClass named:'Class1'.
class2 := FamixJavaClass named:'Class2'.

parametricClass1  addSubInheritance:  (FamixJavaInheritance new
			 subclass: class1 ;
			 superclass: parametricClass1 ). 
			
class1 addSubInheritance: (FamixJavaInheritance new subclass: class2;
superclass: class1).

self assertCollection: (parametricClass1  subclassHierarchy )
		hasSameElements: {class1. class2} 
]

{ #category : #running }
FamixJavaParametricTest >> testInheritanceParameter [

"<subConcrete extends subGenerique> <subGeneric extends supGeneric>"
| supGeneric subGeneric subConcrete |
supGeneric :=FamixJavaParameterType named:'supGeneric'. 
subGeneric := FamixJavaParameterType named:'subGeneric'.
subConcrete := FamixJavaClass named:'String'.

FamixJavaInheritance new subclass:  subGeneric ; superclass: supGeneric .
self assertCollection: (supGeneric subInheritances collect:#subclass) hasSameElements: { subGeneric  }  .
subConcrete  addSuperInheritance: ( FamixJavaInheritance  new subclass:  subConcrete   ; superclass: supGeneric) .
self assertCollection: (supGeneric subInheritances collect:#subclass) hasSameElements: { subGeneric. subConcrete  }  .
]

{ #category : #running }
FamixJavaParametricTest >> testIsConcreteEntity [


| parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaParameterType  named:'V'.
self assert: parametricClass1 isConcreteEntity.
parametricClass1  concreteParameters: { parameter1 }.
self assert: parametricClass1 isConcreteEntity.
parametricClass1  genericParameters:  { parameter2  }.
self deny: parametricClass1 isConcreteEntity.

]

{ #category : #running }
FamixJavaParametricTest >> testIsGenericEnity [

| listT k |
listT := FamixJavaParametricClass named: 'ListT'.
k := FamixJavaParameterType named:'K'.
self assert: listT isConcreteEntity. 
listT genericParameters: { k }.
listT genericParameters  .
self deny: listT isConcreteEntity. 
self assert: listT isGenericEntity. 
]
