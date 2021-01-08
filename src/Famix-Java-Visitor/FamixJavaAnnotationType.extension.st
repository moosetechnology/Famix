Extension { #name : #FamixJavaAnnotationType }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaAnnotationType >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitAnnotationType: self
]
