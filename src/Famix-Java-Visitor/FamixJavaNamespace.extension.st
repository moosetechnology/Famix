Extension { #name : #FamixJavaNamespace }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaNamespace >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitNamespace: self
]
