"
An association that is linked to a ParameterConcretization

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Trait {
	#name : #FamixTParametricAssociation,
	#instVars : [
		'#concretizations => FMMany type: #FamixTConcretization opposite: #triggeringAssociation'
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

{ #category : #visitor }
FamixTParametricAssociation >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTParametricAssociation: self
]

{ #category : #adding }
FamixTParametricAssociation >> addConcretization: anObject [
	<generated>
	^ self concretizations add: anObject
]

{ #category : #accessing }
FamixTParametricAssociation >> concretizations [
	"Relation named: #concretizations type: #FamixTConcretization opposite: #triggeringAssociation"

	<generated>
	<FMComment: 'The parameter concretizations associated with this association.'>
	<derived>
	^ concretizations
]

{ #category : #accessing }
FamixTParametricAssociation >> concretizations: anObject [

	<generated>
	concretizations value: anObject
]
