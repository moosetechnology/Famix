Extension { #name : #FamixJavaAnnotationTypeAttribute }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaAnnotationTypeAttribute >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitAnnotationTypeAttribute: self
]
