Extension { #name : #FamixJavaType }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaType >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitType: self
]
