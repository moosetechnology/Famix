Extension { #name : #FamixJavaLocalVariable }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaLocalVariable >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitLocalVariable: self
]
