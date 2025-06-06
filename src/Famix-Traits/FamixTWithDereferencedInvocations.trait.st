"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `dereferencedInvocations` | `FamixTWithDereferencedInvocations` | `referencer` | `FamixTDereferencedInvocation` | List of invocations performed on BehaviouralEntities referenced by this entity|



"
Trait {
	#name : #FamixTWithDereferencedInvocations,
	#instVars : [
		'#dereferencedInvocations => FMMany type: #FamixTDereferencedInvocation opposite: #referencer'
	],
	#category : #'Famix-Traits-DereferencedInvocation'
}

{ #category : #meta }
FamixTWithDereferencedInvocations classSide >> annotation [

	<FMClass: #TWithDereferencedInvocations super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithDereferencedInvocations >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithDereferencedInvocations: self
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> addDereferencedInvocation: aDeferencedInvocation [
	dereferencedInvocations add: aDeferencedInvocation 
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> dereferencedInvocations [
	"Relation named: #dereferencedInvocations type: #FamixTDereferencedInvocation opposite: #referencer"

	<generated>
	<FMComment: 'List of invocations performed on BehaviouralEntities referenced by this entity'>
	<derived>
	^ dereferencedInvocations
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> dereferencedInvocations: anObject [

	<generated>
	dereferencedInvocations value: anObject
]
