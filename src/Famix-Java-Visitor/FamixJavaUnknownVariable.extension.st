Extension { #name : #FamixJavaUnknownVariable }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaUnknownVariable >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitUnknownVariable: self
]
