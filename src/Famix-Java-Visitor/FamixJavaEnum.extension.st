Extension { #name : #FamixJavaEnum }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaEnum >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitEnum: self
]
