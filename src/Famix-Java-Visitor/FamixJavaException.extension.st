Extension { #name : #FamixJavaException }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaException >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitException: self
]
