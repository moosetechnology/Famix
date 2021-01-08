Extension { #name : #FamixJavaComment }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaComment >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitComment: self
]
