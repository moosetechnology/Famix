Extension { #name : #FamixJavaCaughtException }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaCaughtException >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitCaughtException: self
]
