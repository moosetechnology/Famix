Trait {
	#name : #FmxTraitsTestGenerateAccessorBTraitB,
	#category : #'Famix-MetamodelBuilder-TestsTraitsResources-B-Traits'
}

{ #category : #meta }
FmxTraitsTestGenerateAccessorBTraitB classSide >> annotation [

	<FMClass: #TraitB super: #Object>
	<package: #'Famix-MetamodelBuilder-TestsTraitsResources-B'>
	<generated>
	^self
]

{ #category : #accessing }
FmxTraitsTestGenerateAccessorBTraitB >> relationToB [
	"Relation named: #relationToB type: #FmxTraitsTestGenerateAccessorATraitA opposite: #relationToB"

	<generated>
	<derived>
	<FMProperty: #relationToB type: #FmxTraitsTestGenerateAccessorATraitA opposite: #relationToB>
	^ self attributeAt: #relationToB ifAbsent: [ nil ]
]

{ #category : #accessing }
FmxTraitsTestGenerateAccessorBTraitB >> relationToB: anObject [

	<generated>
	(self attributeAt: #relationToB ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self relationToB.
		self attributeAt: #relationToB put: anObject.
		otherSide relationToB: nil ]
	ifNotNil: [ 
		self attributeAt: #relationToB put: anObject.
		anObject relationToB: self ]
]
