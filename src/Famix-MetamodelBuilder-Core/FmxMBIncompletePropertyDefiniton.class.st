"
FamixMetamodelBuilderIncompletePropertyDefiniton
"
Class {
	#name : 'FmxMBIncompletePropertyDefiniton',
	#superclass : 'Error',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'accessing' }
FmxMBIncompletePropertyDefiniton >> messageText [

	<ignoreForCoverage>
	^ 'Properties need to be part of a relations or have a primitive type'
]
