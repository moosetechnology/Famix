"
Relation between a concrete type and a generic type parameter.
	This association is always triggered by another association, whose target is a parametric entity, whose generic parameter is the target of this concretization.

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
| `triggeringAssociation` | `FamixTConcretization` | `concretization` | `FamixTParametricAssociation` | The association that triggers this concretization.|



"
Trait {
	#name : #FamixTConcretization,
	#instVars : [
		'#concreteParameter => FMOne type: #FamixTConcreteType opposite: #outgoingConcretizations',
		'#genericParameter => FMOne type: #FamixTTypeParameter opposite: #concretizations',
		'#triggeringAssociation => FMOne type: #FamixTParametricAssociation opposite: #concretization'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTConcretization classSide >> annotation [

	<FMClass: #TConcretization super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTConcretization >> concreteParameter [
	"Relation named: #concreteParameter type: #FamixTConcreteType opposite: #outgoingConcretizations"

	<generated>
	<FMComment: 'Concrete parameter linked to in this relationship. This can be a class or another type parameter.'>
	<source>
	^ concreteParameter
]

{ #category : #accessing }
FamixTConcretization >> concreteParameter: anObject [

	<generated>
	concreteParameter := anObject
]

{ #category : #accessing }
FamixTConcretization >> genericParameter [
	"Relation named: #genericParameter type: #FamixTTypeParameter opposite: #concretizations"

	<generated>
	<FMComment: 'Generic parameter linked to in this relationship.'>
	<target>
	^ genericParameter
]

{ #category : #accessing }
FamixTConcretization >> genericParameter: anObject [

	<generated>
	genericParameter := anObject
]

{ #category : #accessing }
FamixTConcretization >> triggeringAssociation [
	"Relation named: #triggeringAssociation type: #FamixTParametricAssociation opposite: #concretization"

	<generated>
	<FMComment: 'The association that triggers this concretization.'>
	^ triggeringAssociation
]

{ #category : #accessing }
FamixTConcretization >> triggeringAssociation: anObject [

	<generated>
	triggeringAssociation := anObject
]
