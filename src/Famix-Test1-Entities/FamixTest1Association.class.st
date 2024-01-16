"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `next` | `FamixTAssociation` | `previous` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixTest1Association,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Association class >> annotation [

	<FMClass: #Association super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]

{ #category : #converting }
FamixTest1Association >> source [
	^ nil
]

{ #category : #metrics }
FamixTest1Association >> target [
	^ nil
]
