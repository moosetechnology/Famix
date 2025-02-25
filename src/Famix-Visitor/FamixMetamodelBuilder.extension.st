Extension { #name : #FamixMetamodelBuilder }

{ #category : #'*Famix-Visitor' }
FamixMetamodelBuilder >> withVisitor [

	| visitorBuilder |
	visitorBuilder := FamixVisitorBuilder new.

	self addExtensionBuilder: visitorBuilder.

	visitorBuilder configuration packageName:
		generator packageNameForVisitor
]
