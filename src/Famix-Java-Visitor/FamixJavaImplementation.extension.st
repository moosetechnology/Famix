Extension { #name : #FamixJavaImplementation }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaImplementation >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitImplementation: self
]
