Class {
	#name : #FamixJavaVisitor,
	#superclass : #Object,
	#traits : 'FamixJavaTVisitor',
	#classTraits : 'FamixJavaTVisitor classTrait',
	#category : #'Famix-Java-Visitor'
}

{ #category : #testing }
FamixJavaVisitor class >> isDeprecated [
	"Use FamixJavaTVisitor directly. 
	
	This class should be removed in Moose 13"

	^ true
]
