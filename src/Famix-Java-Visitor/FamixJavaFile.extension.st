Extension { #name : #FamixJavaFile }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaFile >> accept: aFamixJavaVisitor [
	<generated>
	^ aFamixJavaVisitor visitFile: self
]
