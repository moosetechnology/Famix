Extension { #name : #FamixJavaParameterType }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParameterType >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParameterType: self
]
