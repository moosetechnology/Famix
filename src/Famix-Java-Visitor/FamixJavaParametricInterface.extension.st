Extension { #name : #FamixJavaParametricInterface }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParametricInterface >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParametricInterface: self
]
