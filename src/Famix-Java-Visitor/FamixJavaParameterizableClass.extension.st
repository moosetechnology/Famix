Extension { #name : #FamixJavaParameterizableClass }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParameterizableClass >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParameterizableClass: self
]
