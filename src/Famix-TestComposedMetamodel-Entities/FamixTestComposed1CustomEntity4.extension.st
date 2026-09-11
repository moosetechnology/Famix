Extension { #name : 'FamixTestComposed1CustomEntity4' }

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1CustomEntity4 >> c24s [
	"Relation named: #c24s type: #FamixTestComposed2CustomEntity4 opposite: #c14s"

	<ignoreForCoverage>
	<generated>
	<derived>
	<FMProperty: #c24s type: #FamixTestComposed2CustomEntity4 opposite: #c14s>
	<multivalued>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #c24s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c14s ]
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1CustomEntity4 >> c24s: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-TestComposedMetamodel-Entities'>

	self c24s value: anObject
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1CustomEntity4 >> customEntities4 [
	"Relation named: #customEntities4 type: #FamixTestComposedCustomEntity4 opposite: #customEntities4"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #customEntities4 type: #FamixTestComposedCustomEntity4 opposite: #customEntities4>
	<multivalued>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #customEntities4 ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #customEntities4 ]
]

{ #category : '*Famix-TestComposedMetamodel-Entities' }
FamixTestComposed1CustomEntity4 >> customEntities4: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-TestComposedMetamodel-Entities'>

	self customEntities4 value: anObject
]
