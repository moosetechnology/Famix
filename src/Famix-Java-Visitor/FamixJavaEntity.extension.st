Extension { #name : #FamixJavaEntity }

{ #category : #'*Famix-Java-Visitor' }
FamixJavaEntity >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaEntity: self
]
