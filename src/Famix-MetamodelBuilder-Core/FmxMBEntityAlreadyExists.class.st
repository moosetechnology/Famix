Class {
	#name : 'FmxMBEntityAlreadyExists',
	#superclass : 'Error',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'accessing' }
FmxMBEntityAlreadyExists >> messageText [

	<ignoreForCoverage>

	^ 'Entity of this name already exists in the metamodel'
]
