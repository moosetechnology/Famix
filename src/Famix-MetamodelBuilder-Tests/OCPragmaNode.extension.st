Extension { #name : #OCPragmaNode }

{ #category : #'*Famix-MetamodelBuilder-Tests' }
OCPragmaNode >> removeFromTree [
	self parent removePragma: self
]
