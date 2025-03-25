Trait {
	#name : #FamixJavaVisitor,
	#traits : 'FamixJavaTVisitor',
	#classTraits : 'FamixJavaTVisitor classTrait',
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixJavaVisitor classSide >> annotation [

	
]

{ #category : #testing }
FamixJavaVisitor classSide >> isDeprecated [
	"Use FamixJavaTVisitor directly. 
	
	This class should be removed in Moose 13"

	^ true
]
