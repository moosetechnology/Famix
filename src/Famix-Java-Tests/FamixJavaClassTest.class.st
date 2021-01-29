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
	self assert: testAnnotationSub superclass equals: testAnnotation.
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
