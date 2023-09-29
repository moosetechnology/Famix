Extension { #name : #FamixTestComposed1Method }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1Method >> standardEntity [
	"Relation named: #standardEntity type: #FamixTestComposedStandardEntity opposite: #method"

	<generated>
	<derived>
	<FMProperty: #standardEntity type: #FamixTestComposedStandardEntity opposite: #method>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #standardEntity ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1Method >> standardEntity: anObject [

	<generated>
	(self attributeAt: #standardEntity ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self standardEntity.
		self attributeAt: #standardEntity put: anObject.
		otherSide method: nil ]
	ifNotNil: [ 
		self attributeAt: #standardEntity put: anObject.
		anObject method: self ]
]
