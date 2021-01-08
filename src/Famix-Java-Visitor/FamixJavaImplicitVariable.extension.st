Extension { #name : #FamixJavaImplicitVariable }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaImplicitVariable >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitImplicitVariable: self
]
