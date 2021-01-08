Extension { #name : #FamixJavaClass }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaClass >> accept: aFamixJavaVisitor [
	<generated>
	^ aFamixJavaVisitor visitClass: self
]
