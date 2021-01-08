Extension { #name : #FamixJavaAccess }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaAccess >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitAccess: self
]
