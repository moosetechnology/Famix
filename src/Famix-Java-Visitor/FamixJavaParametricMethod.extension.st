Extension { #name : #FamixJavaParametricMethod }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParametricMethod >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParametricMethod: self
]
