Extension { #name : #FamixJavaClass }

{ #category : #'*Famix-Java-Visitor' }
FamixJavaClass >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaClass: self
]
