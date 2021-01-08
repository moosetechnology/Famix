Extension { #name : #FamixJavaClass }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaClass >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitClass: self
]
