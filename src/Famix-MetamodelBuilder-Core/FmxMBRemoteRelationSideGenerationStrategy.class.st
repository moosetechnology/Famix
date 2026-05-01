Class {
	#name : 'FmxMBRemoteRelationSideGenerationStrategy',
	#superclass : 'FmxMBNonRemoteRelationSideGenerationStrategy',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'accessing' }
FmxMBRemoteRelationSideGenerationStrategy >> protocolFor: aRelation [

	^ '*' , aRelation builder parentBuilderPackageName
]
