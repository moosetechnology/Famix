Extension { #name : #FamixJavaDeclaredException }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaDeclaredException >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitDeclaredException: self
]
