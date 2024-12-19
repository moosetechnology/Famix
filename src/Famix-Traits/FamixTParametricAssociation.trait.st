"
An association that is linked to a ParameterConcretization

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretization` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Trait {
	#name : #FamixTParametricAssociation,
	#instVars : [
		'#concretization => FMMany type: #FamixTConcretization opposite: #triggeringAssociation'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTParametricAssociation classSide >> annotation [

	<FMClass: #TParametricAssociation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTParametricAssociation >> addConcretization: anObject [
	<generated>
	^ self concretization add: anObject
]

{ #category : #accessing }
FamixTParametricAssociation >> concretization [
	"Relation named: #concretization type: #FamixTConcretization opposite: #triggeringAssociation"

	<generated>
	<FMComment: 'The parameter concretizations associated with this association.'>
	<derived>
	^ concretization
]

{ #category : #accessing }
FamixTParametricAssociation >> concretization: anObject [

	<generated>
	concretization value: anObject
]
