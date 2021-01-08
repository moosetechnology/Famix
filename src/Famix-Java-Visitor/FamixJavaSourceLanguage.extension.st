Extension { #name : #FamixJavaSourceLanguage }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaSourceLanguage >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitSourceLanguage: self
]
