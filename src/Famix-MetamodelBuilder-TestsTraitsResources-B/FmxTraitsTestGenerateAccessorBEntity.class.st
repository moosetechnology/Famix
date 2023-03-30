Class {
	#name : #FmxTraitsTestGenerateAccessorBEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-MetamodelBuilder-TestsTraitsResources-B-Entities'
}

{ #category : #meta }
FmxTraitsTestGenerateAccessorBEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-MetamodelBuilder-TestsTraitsResources-B'>
	<generated>
	^self
]

{ #category : #meta }
FmxTraitsTestGenerateAccessorBEntity class >> metamodel [

	<generated>
	^ FmxTraitsTestGenerateAccessorBModel metamodel
]
