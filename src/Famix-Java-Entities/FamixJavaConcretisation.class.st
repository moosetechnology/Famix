"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
| `genericEntity` | `FamixTConcretisation` | `concretisations` | `FamixTParametricEntity` | genericEntity linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
| `concreteEntity` | `FamixTConcretisation` | `genericEntity` | `FamixTParametricEntity` | concreteEntity linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `parameterConcretisations` | `FamixTConcretisation` | `concretisations` | `FamixTParameterConcretisation` | |
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixJavaConcretisation,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTConcretisation',
	#classTraits : 'FamixTConcretisation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaConcretisation class >> annotation [

	<FMClass: #Concretisation super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
