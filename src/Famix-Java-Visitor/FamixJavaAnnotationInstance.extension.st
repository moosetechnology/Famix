Extension { #name : #FamixJavaAnnotationInstance }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaAnnotationInstance >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitAnnotationInstance: self
]
