Extension { #name : 'FamixTestComposed2CustomEntity4' }

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed2CustomEntity4 >> c14s [
	"Relation named: #c14s type: #FamixTestComposed1CustomEntity4 opposite: #c24s"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #c14s type: #FamixTestComposed1CustomEntity4 opposite: #c24s>
	<multivalued>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #c14s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c24s ]
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed2CustomEntity4 >> c14s: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-TestComposedMetamodel-Entities'>

	self c14s value: anObject
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed2CustomEntity4 >> c4s [
	"Relation named: #c4s type: #FamixTestComposedCustomEntity4 opposite: #c24s"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #c4s type: #FamixTestComposedCustomEntity4 opposite: #c24s>
	<multivalued>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #c4s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c24s ]
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed2CustomEntity4 >> c4s: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-TestComposedMetamodel-Entities'>

	self c4s value: anObject
]
