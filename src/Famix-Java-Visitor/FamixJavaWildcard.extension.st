Extension { #name : #FamixJavaWildcard }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaWildcard >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitWildcard: self
]
