Extension { #name : #FamixJavaGlobalVariable }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaGlobalVariable >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitGlobalVariable: self
]
