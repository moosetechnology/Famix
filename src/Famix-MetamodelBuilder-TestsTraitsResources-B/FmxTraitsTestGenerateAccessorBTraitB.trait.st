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
FmxTraitsTestGenerateAccessorBTraitB >> relationToA [
	"Relation named: #relationToA type: #FmxTraitsTestGenerateAccessorATraitA opposite: #relationToB"

	<generated>
	<derived>
	<FMProperty: #relationToA type: #FmxTraitsTestGenerateAccessorATraitA opposite: #relationToB>
	^ self attributeAt: #relationToA ifAbsent: [ nil ]
]

{ #category : #accessing }
FmxTraitsTestGenerateAccessorBTraitB >> relationToA: anObject [

	<generated>
	(self attributeAt: #relationToA ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self relationToA.
		self attributeAt: #relationToA put: anObject.
		otherSide relationToB: nil ]
	ifNotNil: [ 
		self attributeAt: #relationToA put: anObject.
		anObject relationToB: self ]
]
