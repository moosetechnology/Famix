Extension { #name : #FamixJavaConcretization }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaConcretization >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitConcretization: self
]
