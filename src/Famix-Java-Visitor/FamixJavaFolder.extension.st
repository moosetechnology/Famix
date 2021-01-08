Extension { #name : #FamixJavaFolder }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaFolder >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitFolder: self
]
