Extension { #name : #FamixJavaContainerEntity }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaContainerEntity >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitContainerEntity: self
]
