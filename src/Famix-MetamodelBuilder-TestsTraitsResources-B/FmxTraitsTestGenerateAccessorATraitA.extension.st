Extension { #name : #FmxTraitsTestGenerateAccessorATraitA }

{ #category : #'*Famix-MetamodelBuilder-TestsTraitsResources-B-accessing' }
FmxTraitsTestGenerateAccessorATraitA >> relationToB [
	"Relation named: #relationToB type: #FmxTraitsTestGenerateAccessorBTraitB opposite: #relationToB"

	<generated>
	<FMProperty: #relationToB type: #FmxTraitsTestGenerateAccessorBTraitB opposite: #relationToB>
	<package: #'Famix-MetamodelBuilder-TestsTraitsResources-B'>
	^ self attributeAt: #relationToB ifAbsent: [ nil ]
]

{ #category : #'*Famix-MetamodelBuilder-TestsTraitsResources-B-accessing' }
FmxTraitsTestGenerateAccessorATraitA >> relationToB: anObject [

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
