Extension { #name : #FamixJavaPrimitiveType }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaPrimitiveType >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitPrimitiveType: self
]
