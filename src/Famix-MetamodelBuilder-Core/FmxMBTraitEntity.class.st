Class {
	#name : 'FmxMBTraitEntity',
	#superclass : 'FmxMBTrait',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBTraitEntity >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitTraitEntity: self
]
