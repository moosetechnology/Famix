Class {
	#name : 'FmxMBTraitEntity',
	#superclass : 'FmxMBTrait',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'generating' }
FmxMBTraitEntity >> generate [

	super generate.

	self
		generateAddToCollection;
		generateTestingMethods
]
