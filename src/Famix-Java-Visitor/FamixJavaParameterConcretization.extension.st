Extension { #name : #FamixJavaParameterConcretization }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaParameterConcretization >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitParameterConcretization: self
]
