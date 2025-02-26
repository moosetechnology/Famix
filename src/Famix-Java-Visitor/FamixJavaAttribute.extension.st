Extension { #name : #FamixJavaAttribute }

{ #category : #'*Famix-Java-Visitor' }
FamixJavaAttribute >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaAttribute: self
]
