Extension { #name : #FamixJavaReference }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaReference >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitReference: self
]
