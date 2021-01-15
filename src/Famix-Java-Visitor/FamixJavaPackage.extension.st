Extension { #name : #FamixJavaPackage }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaPackage >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitPackage: self
]
