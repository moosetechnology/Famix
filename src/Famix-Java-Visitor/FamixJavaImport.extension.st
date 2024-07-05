Extension { #name : #FamixJavaImport }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaImport >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitImport: self
]
