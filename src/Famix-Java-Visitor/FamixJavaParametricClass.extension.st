Extension { #name : #FamixJavaParametricClass }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParametricClass >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParametricClass: self
]
