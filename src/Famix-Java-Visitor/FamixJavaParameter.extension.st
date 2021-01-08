Extension { #name : #FamixJavaParameter }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParameter >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParameter: self
]
