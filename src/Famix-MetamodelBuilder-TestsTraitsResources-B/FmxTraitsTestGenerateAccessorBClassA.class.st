Class {
	#name : #FmxTraitsTestGenerateAccessorBClassA,
	#superclass : #FmxTraitsTestGenerateAccessorBEntity,
	#traits : 'FmxTraitsTestGenerateAccessorATraitA',
	#classTraits : 'FmxTraitsTestGenerateAccessorATraitA classTrait',
	#category : #'Famix-MetamodelBuilder-TestsTraitsResources-B-Entities'
}

{ #category : #meta }
FmxTraitsTestGenerateAccessorBClassA class >> annotation [

	<FMClass: #ClassA super: #FmxTraitsTestGenerateAccessorBEntity>
	<package: #'Famix-MetamodelBuilder-TestsTraitsResources-B'>
	<generated>
	^self
]
