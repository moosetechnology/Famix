Extension { #name : #FamixJavaException }

{ #category : #'*Famix-Java-Visitor-visiting' }
FamixJavaException >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaException: self
]
