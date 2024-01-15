"
## Relations
======================

### Other
- Relation: #customEntities4 Type: #FamixTestComposed1CustomEntity4 Opposite: #customEntities4
- Relation: #c24s Type: #FamixTestComposed2CustomEntity4 Opposite: #c4s


"
Class {
	#name : #FamixTestComposedCustomEntity4,
	#superclass : #FamixTestComposedEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedCustomEntity4 class >> annotation [

	<FMClass: #CustomEntity4 super: #FamixTestComposedEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTestComposedCustomEntity4 >> addC24: anObject [
	<generated>
	^ self c24s add: anObject
]

{ #category : #adding }
FamixTestComposedCustomEntity4 >> addCustomEntities4: anObject [
	<generated>
	^ self customEntities4 add: anObject
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> c24s [
	"Relation named: #c24s type: #FamixTestComposed2CustomEntity4 opposite: #c4s"

	<generated>
	<derived>
	<FMProperty: #c24s type: #FamixTestComposed2CustomEntity4 opposite: #c4s>
	^ self attributeAt: #c24s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c4s ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> c24s: anObject [

	<generated>
	self c24s value: anObject
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> customEntities4 [
	"Relation named: #customEntities4 type: #FamixTestComposed1CustomEntity4 opposite: #customEntities4"

	<generated>
	<derived>
	<FMProperty: #customEntities4 type: #FamixTestComposed1CustomEntity4 opposite: #customEntities4>
	^ self attributeAt: #customEntities4 ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #customEntities4 ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> customEntities4: anObject [

	<generated>
	self customEntities4 value: anObject
]
