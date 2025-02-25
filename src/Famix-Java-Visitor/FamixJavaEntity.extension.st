Extension { #name : #FamixJavaEntity }

{ #category : #'*Famix-Java-Visitor-visiting' }
FamixJavaEntity >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaEntity: self
]
