Extension { #name : #FamixJavaFile }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaFile >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitFile: self
]
