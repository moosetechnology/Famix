Extension { #name : #FamixJavaInterface }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaInterface >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitInterface: self
]
