Extension { #name : 'FamixTestComposed2CustomEntity5' }

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed2CustomEntity5 >> associations [
	"Relation named: #associations type: #FamixTestComposedAssociation opposite: #c25"

	<generated>
	<derived>
	<FMProperty: #associations type: #FamixTestComposedAssociation opposite: #c25>
	<multivalued>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #associations ifAbsentPut: [ FMMultivalueLink on: self opposite: #c25: ]
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed2CustomEntity5 >> associations: anObject [

	<generated>
	<package: #'Famix-TestComposedMetamodel-Entities'>

	self associations value: anObject
]
