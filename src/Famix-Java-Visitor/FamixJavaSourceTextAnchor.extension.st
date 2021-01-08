Extension { #name : #FamixJavaSourceTextAnchor }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaSourceTextAnchor >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitSourceTextAnchor: self
]
