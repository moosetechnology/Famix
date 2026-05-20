Extension { #name : 'MooseObject' }

{ #category : '*Famix-Visitor-Generation' }
MooseObject >> accept: aVisitor [

	^ aVisitor perform: ('visit' , self class name , ':') asSymbol with: self
]
