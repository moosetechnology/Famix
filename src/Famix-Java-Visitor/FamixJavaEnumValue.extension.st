Extension { #name : #FamixJavaEnumValue }

{ #category : #'*Famix-Java-Visitor-generated' }
FamixJavaEnumValue >> accept: aFamixJavaVisitor [
	^ aFamixJavaVisitor visitEnumValue: self
]
