Extension { #name : #FamixJavaParameterizedType }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParameterizedType >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParameterizedType: self
]
