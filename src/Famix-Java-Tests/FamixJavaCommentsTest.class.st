Class {
	#name : #FamixJavaCommentsTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaCommentsTest >> testClassWithComment [

	| javaClass |
	javaClass := FamixJavaClass new.
	FamixJavaComment new commentedEntity: javaClass.
	self assert: javaClass numberOfComments equals: 1
]

{ #category : #tests }
FamixJavaCommentsTest >> testClassWithCommentAndMethodsWithComments [

	| javaClass |
	javaClass := FamixJavaClass new.
	FamixJavaComment new commentedEntity: javaClass.
	FamixJavaComment new commentedEntity: (FamixJavaMethod new
			 parentType: javaClass;
			 yourself).
	FamixJavaComment new commentedEntity: (FamixJavaMethod new
			 parentType: javaClass;
			 yourself).
	self assert: javaClass numberOfComments equals: 1 "Comments of children are not taken into account."
]
