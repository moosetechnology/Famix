Class {
	#name : 'FmxMBRemoteRelationSideGenerationStrategy',
	#superclass : 'FmxMBNonRemoteRelationSideGenerationStrategy',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'generation' }
FmxMBRemoteRelationSideGenerationStrategy >> compileMethod: methodSource for: aRelationSide in: aClassOrTrait [

	aRelationSide addMethod: methodSource in: aClassOrTrait name protocol: '*' , self relationSide builder parentBuilderPackageName
]
