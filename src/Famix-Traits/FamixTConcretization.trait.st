"
Relation between a concrete type and a generic type parameter.
	This association is always triggered by another association, whose target is a parametric entity, whose generic parameter is the target of this concretization.

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeArgument` | `FamixTConcretization` | `outgoingConcretizations` | `FamixTTypeArgument` | The type argument that concretizes the type parameter|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameter` | `FamixTConcretization` | `concretizations` | `FamixTTypeParameter` | Type parameter linked to in this relationship.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `triggeringAssociation` | `FamixTConcretization` | `concretizations` | `FamixTParametricAssociation` | The association that triggers this concretization.|



"
Trait {
	#name : #FamixTConcretization,
	#instVars : [
		'#triggeringAssociation => FMOne type: #FamixTParametricAssociation opposite: #concretizations',
		'#typeArgument => FMOne type: #FamixTTypeArgument opposite: #outgoingConcretizations',
		'#typeParameter => FMOne type: #FamixTTypeParameter opposite: #concretizations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Parametrics'
}

{ #category : #meta }
FamixTConcretization classSide >> annotation [

	<FMClass: #TConcretization super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTConcretization >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTConcretization: self
]

{ #category : #accessing }
FamixTConcretization >> triggeringAssociation [
	"Relation named: #triggeringAssociation type: #FamixTParametricAssociation opposite: #concretizations"

	<generated>
	<FMComment: 'The association that triggers this concretization.'>
	^ triggeringAssociation
]

{ #category : #accessing }
FamixTConcretization >> triggeringAssociation: anObject [

	<generated>
	triggeringAssociation := anObject
]

{ #category : #accessing }
FamixTConcretization >> typeArgument [
	"Relation named: #typeArgument type: #FamixTTypeArgument opposite: #outgoingConcretizations"

	<generated>
	<FMComment: 'The type argument that concretizes the type parameter'>
	<source>
	^ typeArgument
]

{ #category : #accessing }
FamixTConcretization >> typeArgument: anObject [

	<generated>
	typeArgument := anObject
]

{ #category : #accessing }
FamixTConcretization >> typeParameter [
	"Relation named: #typeParameter type: #FamixTTypeParameter opposite: #concretizations"

	<generated>
	<FMComment: 'Type parameter linked to in this relationship.'>
	<target>
	^ typeParameter
]

{ #category : #accessing }
FamixTConcretization >> typeParameter: anObject [

	<generated>
	typeParameter := anObject
]
