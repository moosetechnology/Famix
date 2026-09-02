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
	#name : 'FamixTParametricAssociation',
	#instVars : [
		'#concretizations => FMMany type: #FamixTConcretization opposite: #triggeringAssociation'
	],
	#category : 'Famix-Traits-Parametrics',
	#package : 'Famix-Traits',
	#tag : 'Parametrics'
}

{ #category : 'meta' }
FamixTParametricAssociation classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TParametricAssociation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTParametricAssociation >> addConcretization: anObject [

	<ignoreForCoverage>
	<generated>
	^ self concretizations add: anObject
]

{ #category : 'accessing' }
FamixTParametricAssociation >> concretizations [
	"Relation named: #concretizations type: #FamixTConcretization opposite: #triggeringAssociation"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The parameter concretizations associated with this association.'>
	<derived>
	^ concretizations
]

{ #category : 'accessing' }
FamixTParametricAssociation >> concretizations: anObject [

	<ignoreForCoverage>
	<generated>
	concretizations value: anObject
]

{ #category : 'testing' }
FamixTParametricAssociation >> isParametricAssociation [

	<ignoreForCoverage>
	<generated>
	^ true
]
