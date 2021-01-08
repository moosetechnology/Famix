Extension { #name : #FamixJavaEntity }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaEntity >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitEntity: self
]
