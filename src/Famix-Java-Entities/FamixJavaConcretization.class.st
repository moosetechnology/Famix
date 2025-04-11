"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concreteParameter` | `FamixTConcretization` | `outgoingConcretizations` | `FamixTConcreteType` | Concrete parameter linked to in this relationship. This can be a class or another type parameter.|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericParameter` | `FamixTConcretization` | `concretizations` | `FamixTTypeParameter` | Generic parameter linked to in this relationship.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `triggeringAssociation` | `FamixTConcretization` | `concretizations` | `FamixTParametricAssociation` | The association that triggers this concretization.|



"
Class {
	#name : #FamixJavaConcretization,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTConcretization',
	#classTraits : 'FamixTConcretization classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaConcretization class >> annotation [

	<FMClass: #Concretization super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
