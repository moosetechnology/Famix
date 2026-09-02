Extension { #name : 'FamixTestComposed1CustomEntity5' }

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1CustomEntity5 >> associations [
	"Relation named: #associations type: #FamixTestComposedAssociation opposite: #c15"

	<ignoreForCoverage>
	<generated>
	<derived>
	<FMProperty: #associations type: #FamixTestComposedAssociation opposite: #c15>
	<multivalued>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #associations ifAbsentPut: [ FMMultivalueLink on: self opposite: #c15: ]
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1CustomEntity5 >> associations: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-TestComposedMetamodel-Entities'>

	self associations value: anObject
]
