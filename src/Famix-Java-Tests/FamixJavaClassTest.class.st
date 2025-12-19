Class {
	#name : 'FamixJavaClassTest',
	#superclass : 'TestCase',
	#category : 'Famix-Java-Tests',
	#package : 'Famix-Java-Tests'
}

{ #category : 'tests' }
FamixJavaClassTest >> testAllImplementedInterfaces [

	| interface supInt1 supInt2 clazz |
	
	interface := FamixJavaInterface new.
	supInt1 := FamixJavaInterface new.
	supInt2 := FamixJavaInterface new.
	FamixJavaInheritance new
		subclass: interface ;
		superclass: supInt1.
	FamixJavaInheritance new
		subclass: interface ;
		superclass: supInt2.
	clazz := FamixJavaClass new.
	FamixJavaImplementation new
		implementingClass: clazz ;
		interface: interface.

	self assertCollection: clazz allImplementedInterfaces hasSameElements: { interface . supInt1 . supInt2 }
	
]

{ #category : 'tests' }
FamixJavaClassTest >> testAllImplementedInterfacesHierarchy [

	| interface1 supInt1 interface2 clazz superClass |
	
	interface1 := FamixJavaInterface new.
	supInt1 := FamixJavaInterface new.
	interface2 := FamixJavaInterface new.
	FamixJavaInheritance new
		subclass: interface1 ;
		superclass: supInt1.
	
	clazz := FamixJavaClass new.
	superClass := FamixJavaClass new.
	FamixJavaInheritance new
		subclass: clazz ;
		superclass: superClass.
	FamixJavaImplementation new
		implementingClass: clazz ;
		interface: interface1.
	FamixJavaImplementation new
		implementingClass: superClass ;
		interface: interface2.

	self assertCollection: clazz allImplementedInterfacesHierarchy hasSameElements: { interface1 . supInt1 . interface2 }
	
]

{ #category : 'tests' }
FamixJavaClassTest >> testInheritanceAnnotationType [
	| testAnnotation testAnnotationSub inheritance |
	testAnnotation := FamixJavaAnnotationType new name: 'Test'.
	testAnnotationSub := FamixJavaAnnotationType new name: 'SubTest'.
	inheritance := FamixJavaInheritance new subclass: testAnnotationSub; superclass: testAnnotation.
	self assertCollection: testAnnotation subInheritances hasSameElements: { inheritance } .
	self assertCollection: testAnnotation superInheritances hasSameElements: {  } .
	self assertCollection: testAnnotationSub subInheritances hasSameElements: {  } .
	self assertCollection: testAnnotationSub superInheritances hasSameElements: { inheritance } .
	self assert: testAnnotationSub superclass equals: testAnnotation.
]

{ #category : 'tests' }
FamixJavaClassTest >> testInheritsFromTestCase [
	| famixClass class1 testcase inh1 inh2 |
	famixClass := FamixJavaClass new.
	class1 := FamixJavaClass new.
	testcase := FamixJavaClass named: 'TestCase'.
	inh1 := FamixJavaInheritance new superclass: testcase ; subclass: class1.
	inh2 := FamixJavaInheritance new superclass: class1 ; subclass: famixClass .
	self assert: class1 inheritsFromTestCase.
	self assert: famixClass inheritsFromTestCase.
]

{ #category : 'tests' }
FamixJavaClassTest >> testIsClassSide [
	| famixClass |
	famixClass := FamixJavaClass new. 
	famixClass isClassSide: true.
	self assert: famixClass isClassSide
]

{ #category : 'tests' }
FamixJavaClassTest >> testIsJUnit40TestCase [
	| testAnnotation testAnnotationInstance famixClass famixMethod |
	testAnnotation := FamixJavaAnnotationType new name: 'Test'.
	testAnnotationInstance := FamixJavaAnnotationInstance new annotationType: testAnnotation.
	famixClass := FamixJavaClass new.
	famixMethod := FamixJavaMethod new name: 'someMethodAnnotated'.
	famixClass addMethod: famixMethod.
	famixMethod annotationInstances add: testAnnotationInstance.
	self assert: famixClass isJUnit4TestCase
]

{ #category : 'tests' }
FamixJavaClassTest >> testNumberOfConstructorMethods [

	| m1 c1 model |
	model := FamixJavaModel new.
	c1 := FamixJavaClass named: 'Class1' model: model.
	m1 := FamixJavaMethod named: 'method1' model: model.
	m1 parentType: c1.
	
	m1 isConstructor: true.
	self assert: c1 numberOfConstructorMethods equals: 1.
	c1 numberOfConstructorMethods: 100.
	self assert: c1 numberOfConstructorMethods equals: 100.

]
