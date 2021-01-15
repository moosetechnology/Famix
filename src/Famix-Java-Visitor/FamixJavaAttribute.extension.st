Extension { #name : #FamixJavaAttribute }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaAttribute >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitAttribute: self
]
