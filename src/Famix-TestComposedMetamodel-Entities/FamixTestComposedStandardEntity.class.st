"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `method` | `FamixTestComposedStandardEntity` | `standardEntity` | `FamixTestComposed1Method` | |



"
Class {
	#name : #FamixTestComposedStandardEntity,
	#superclass : #FamixTestComposedEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedStandardEntity class >> annotation [

	<FMClass: #StandardEntity super: #FamixTestComposedEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTestComposedStandardEntity >> method [
	"Relation named: #method type: #FamixTestComposed1Method opposite: #standardEntity"

	<generated>
	<FMProperty: #method type: #FamixTestComposed1Method opposite: #standardEntity>
	^ self attributeAt: #method ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedStandardEntity >> method: anObject [

	<generated>
	(self attributeAt: #method ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self method.
		self attributeAt: #method put: anObject.
		otherSide standardEntity: nil ]
	ifNotNil: [ 
		self attributeAt: #method put: anObject.
		anObject standardEntity: self ]
]
