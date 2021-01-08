Extension { #name : #FamixJavaInvocation }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaInvocation >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitInvocation: self
]
