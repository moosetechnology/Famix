"
I can be the target of an implementation cf Interface 

## Relations
======================

### Incoming dependencies
- Relation: #implementations Type: #FamixTImplementation Opposite: #interface Comment: Implementation relationships.


"
Trait {
	#name : #FamixTImplementable,
	#instVars : [
		'#implementations => FMMany type: #FamixTImplementation opposite: #interface'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTImplementable classSide >> annotation [

	<FMClass: #TImplementable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
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
