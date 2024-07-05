"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `c25` | `FamixTestComposedAssociation` | `associations` | `FamixTestComposed2CustomEntity5` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `c15` | `FamixTestComposedAssociation` | `associations` | `FamixTestComposed1CustomEntity5` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixTestComposedAssociation,
	#superclass : #FamixTestComposedStandardEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedAssociation class >> annotation [

	<FMClass: #Association super: #FamixTestComposedStandardEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTestComposedAssociation >> c15 [
	"Relation named: #c15 type: #FamixTestComposed1CustomEntity5 opposite: #associations"

	<generated>
	<target>
	<FMProperty: #c15 type: #FamixTestComposed1CustomEntity5 opposite: #associations>
	^ self attributeAt: #c15 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedAssociation >> c15: anObject [

	<generated>
	self attributeAt: #c15 put: (FMMultivalueLink on: self update: #associations from: self c15 to: anObject).
]

{ #category : #accessing }
FamixTestComposedAssociation >> c25 [
	"Relation named: #c25 type: #FamixTestComposed2CustomEntity5 opposite: #associations"

	<generated>
	<source>
	<FMProperty: #c25 type: #FamixTestComposed2CustomEntity5 opposite: #associations>
	^ self attributeAt: #c25 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedAssociation >> c25: anObject [

	<generated>
	self attributeAt: #c25 put: (FMMultivalueLink on: self update: #associations from: self c25 to: anObject).
]

{ #category : #accessing }
FamixTestComposedAssociation >> source [
	^ self c25
]

{ #category : #accessing }
FamixTestComposedAssociation >> source: aSource [
	^ self c25: aSource
]

{ #category : #accessing }
FamixTestComposedAssociation >> target [
	^ self c15
]

{ #category : #accessing }
FamixTestComposedAssociation >> target: aTarget [
	^ self c15: aTarget
]
