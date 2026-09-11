Extension { #name : 'FamixTestComposed1Method' }

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1Method >> standardEntity [
	"Relation named: #standardEntity type: #FamixTestComposedStandardEntity opposite: #method"

	<ignoreForCoverage>
	<generated>
	<derived>
	<FMProperty: #standardEntity type: #FamixTestComposedStandardEntity opposite: #method>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #standardEntity ifAbsent: [ nil ]
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1Method >> standardEntity: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-TestComposedMetamodel-Entities'>

	(self attributeAt: #standardEntity ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self standardEntity.
		self attributeAt: #standardEntity put: anObject.
		otherSide method: nil ]
	ifNotNil: [ 
		self attributeAt: #standardEntity put: anObject.
		anObject method: self ]
]
