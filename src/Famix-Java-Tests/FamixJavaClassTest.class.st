Class {
	#name : #FamixJavaClassTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaClassTest >> testIsClassSide [
	| famixClass |
	famixClass := FamixJavaClass new. 
	famixClass isClassSide: true.
	self assert: famixClass isClassSide .
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
