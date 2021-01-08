Extension { #name : #FamixJavaSourcedEntity }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaSourcedEntity >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitSourcedEntity: self
]
