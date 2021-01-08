Extension { #name : #FamixJavaMethod }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaMethod >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitMethod: self
]
