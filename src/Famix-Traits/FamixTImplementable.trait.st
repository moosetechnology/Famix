"
I can be the target of an implementation cf Interface 

## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implementations` | `FamixTImplementable` | `interface` | `FamixTImplementation` | Implementation relationships.|



"
Trait {
	#name : #FamixTImplementable,
	#instVars : [
		'#implementations => FMMany type: #FamixTImplementation opposite: #interface'
	],
	#category : #'Famix-Traits-Implementation'
}

{ #category : #meta }
FamixTImplementable classSide >> annotation [

	<FMClass: #TImplementable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTImplementable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTImplementable: self
]

{ #category : #adding }
FamixTImplementable >> addImplementation: anObject [
	<generated>
	^ self implementations add: anObject
]

{ #category : #accessing }
FamixTImplementable >> implementations [
	"Relation named: #implementations type: #FamixTImplementation opposite: #interface"

	<generated>
	<FMComment: 'Implementation relationships.'>
	<derived>
	^ implementations
]

{ #category : #accessing }
FamixTImplementable >> implementations: anObject [

	<generated>
	implementations value: anObject
]
