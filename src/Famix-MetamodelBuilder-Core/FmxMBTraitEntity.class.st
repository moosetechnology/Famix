Class {
	#name : #FmxMBTraitEntity,
	#superclass : #FmxMBTrait,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBTraitEntity >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitTraitEntity: self
]

{ #category : #testing }
FmxMBTraitEntity >> isTraitEntity [

	^ true
]
