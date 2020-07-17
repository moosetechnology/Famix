Extension { #name : #FamixTestComposed2CustomEntity1 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c1 [
	"Relation named: #c1 type: #FamixTestComposedCustomEntity1 opposite: #c21"

	<generated>
	<derived>
	<FMProperty: #c1 type: #FamixTestComposedCustomEntity1 opposite: #c21>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #c1 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c11 [
	"Relation named: #c11 type: #FamixTestComposed1CustomEntity1 opposite: #c21"

	<generated>
	<derived>
	<FMProperty: #c11 type: #FamixTestComposed1CustomEntity1 opposite: #c21>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self attributeAt: #c11 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c11: anObject [

	<generated>
	(self attributeAt: #c11 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self c11.
		self attributeAt: #c11 put: anObject.
		otherSide c21: nil ]
	ifNotNil: [ 
		self attributeAt: #c11 put: anObject.
		anObject c21: self ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c1: anObject [

	<generated>
	(self attributeAt: #c1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self c1.
		self attributeAt: #c1 put: anObject.
		otherSide c21: nil ]
	ifNotNil: [ 
		self attributeAt: #c1 put: anObject.
		anObject c21: self ]
]
