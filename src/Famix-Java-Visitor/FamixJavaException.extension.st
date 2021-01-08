Extension { #name : #FamixJavaException }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaException >> accept: aFamixJavaVisitor [
	<generated>
	^ aFamixJavaVisitor visitException: self
]
