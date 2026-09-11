"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|



"
Trait {
	#name : 'FamixTWithReferences',
	#instVars : [
		'#outgoingReferences => FMMany type: #FamixTReference opposite: #referencer'
	],
	#category : 'Famix-Traits-Reference',
	#package : 'Famix-Traits',
	#tag : 'Reference'
}

{ #category : 'meta' }
FamixTWithReferences classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithReferences super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTWithReferences >> addOutgoingReference: aReference [ 
	outgoingReferences add: aReference
]

{ #category : 'accessing' }
FamixTWithReferences >> outgoingReferences [
	"Relation named: #outgoingReferences type: #FamixTReference opposite: #referencer"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'References from this entity to other entities.'>
	<derived>
	^ outgoingReferences
]

{ #category : 'accessing' }
FamixTWithReferences >> outgoingReferences: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingReferences value: anObject
]
