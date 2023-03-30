Class {
	#name : #FamixJavaClassTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
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

{ #category : #tests }
FamixJavaClassTest >> testIsClassSide [
	| famixClass |
	famixClass := FamixJavaClass new. 
	famixClass isClassSide: true.
	self assert: famixClass isClassSide
]

{ #category : #tests }
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

{ #category : #tests }
FamixJavaClassTest >> testNumberOfAccessorMethods [

	| model c1 m1 |
	model := FamixJavaModel new.
	c1 := FamixJavaClass named: 'Class1' model: model.
	m1 := FamixJavaMethod named: 'method1' model: model.
	m1 parentType: c1.
	m1 beGetter.

	self assert: c1 numberOfAccessorMethods equals: 1.
	c1 numberOfAccessorMethods: 100.
	self assert: c1 numberOfAccessorMethods equals: 100
]

{ #category : #tests }
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
