"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `c23` | `FamixTestComposedCustomEntity3` | `c3s` | `FamixTestComposed2CustomEntity3` | |
| `customEntity3` | `FamixTestComposedCustomEntity3` | `customEntities3` | `FamixTestComposed1CustomEntity3` | |



"
Class {
	#name : 'FamixTestComposedCustomEntity3',
	#superclass : 'FamixTestComposedEntity',
	#category : 'Famix-TestComposedMetamodel-Entities-Entities',
	#package : 'Famix-TestComposedMetamodel-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTestComposedCustomEntity3 class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CustomEntity3 super: #FamixTestComposedEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTestComposedCustomEntity3 >> c23 [
	"Relation named: #c23 type: #FamixTestComposed2CustomEntity3 opposite: #c3s"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #c23 type: #FamixTestComposed2CustomEntity3 opposite: #c3s>
	^ self attributeAt: #c23 ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixTestComposedCustomEntity3 >> c23: anObject [

	<ignoreForCoverage>
	<generated>
	self attributeAt: #c23 put: (FMMultivalueLink on: self update: #c3s from: self c23 to: anObject).
]

{ #category : 'accessing' }
FamixTestComposedCustomEntity3 >> customEntity3 [
	"Relation named: #customEntity3 type: #FamixTestComposed1CustomEntity3 opposite: #customEntities3"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #customEntity3 type: #FamixTestComposed1CustomEntity3 opposite: #customEntities3>
	^ self attributeAt: #customEntity3 ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixTestComposedCustomEntity3 >> customEntity3: anObject [

	<ignoreForCoverage>
	<generated>
	self attributeAt: #customEntity3 put: (FMMultivalueLink on: self update: #customEntities3 from: self customEntity3 to: anObject).
]
