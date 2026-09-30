Class {
	#name : #FmxMBEntityAlreadyExists,
	#superclass : #Error,
	#category : #'Famix-MetamodelBuilder-Core-Exception'
}

{ #category : #accessing }
FmxMBEntityAlreadyExists >> messageText [

	<ignoreForCoverage>

	^ 'Entity of this name already exists in the metamodel'
]
