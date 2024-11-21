"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericParameter` | `FamixTParameterConcretization` | `concretizations` | `FamixTGenericParameterType` | Generic parameter linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concreteParameter` | `FamixTParameterConcretization` | `generics` | `FamixTConcreteParameterType` | Concrete parameter linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParameterConcretization` | `parameterConcretizations` | `FamixTConcretization` | |
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : #FamixJavaParameterConcretization,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTParameterConcretization',
	#classTraits : 'FamixTParameterConcretization classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterConcretization class >> annotation [

	<FMClass: #ParameterConcretization super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
