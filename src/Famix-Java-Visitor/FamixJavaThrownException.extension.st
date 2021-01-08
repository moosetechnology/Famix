Extension { #name : #FamixJavaThrownException }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaThrownException >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitThrownException: self
]
