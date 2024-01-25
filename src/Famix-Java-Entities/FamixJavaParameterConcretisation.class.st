"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
| `genericParameter` | `FamixTParameterConcretisation` | `concretisations` | `FamixTGenericParameterType` | genericParameter linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
| `concreteParameter` | `FamixTParameterConcretisation` | `generics` | `FamixTConcreteParameterType` | concreteParameter linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `concretisations` | `FamixTParameterConcretisation` | `parameterConcretisations` | `FamixTConcretisation` | |
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixJavaParameterConcretisation,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTParameterConcretisation',
	#classTraits : 'FamixTParameterConcretisation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterConcretisation class >> annotation [

	<FMClass: #ParameterConcretisation super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
