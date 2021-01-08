Extension { #name : #FamixJavaComment }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaComment >> accept: aFamixJavaVisitor [
	<generated>
	^ aFamixJavaVisitor visitComment: self
]
