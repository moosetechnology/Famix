Extension { #name : #FmxTraitsTestGenerateAccessorATraitA }

{ #category : #'*Famix-MetamodelBuilder-TestsTraitsResources-B-accessing' }
FmxTraitsTestGenerateAccessorATraitA >> relationToB [
	"Relation named: #relationToB type: #FmxTraitsTestGenerateAccessorBTraitB opposite: #relationToA"

	<generated>
	<FMProperty: #relationToB type: #FmxTraitsTestGenerateAccessorBTraitB opposite: #relationToA>
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
		otherSide relationToA: nil ]
	ifNotNil: [ 
		self attributeAt: #relationToB put: anObject.
		anObject relationToA: self ]
]
