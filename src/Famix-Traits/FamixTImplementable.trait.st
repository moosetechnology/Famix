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
	#name : 'FamixTImplementable',
	#instVars : [
		'#implementations => FMMany type: #FamixTImplementation opposite: #interface'
	],
	#category : 'Famix-Traits-Implementation',
	#package : 'Famix-Traits',
	#tag : 'Implementation'
}

{ #category : 'meta' }
FamixTImplementable classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TImplementable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTImplementable >> addImplementation: anObject [

	<ignoreForCoverage>
	<generated>
	^ self implementations add: anObject
]

{ #category : 'accessing' }
FamixTImplementable >> implementations [
	"Relation named: #implementations type: #FamixTImplementation opposite: #interface"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Implementation relationships.'>
	<derived>
	^ implementations
]

{ #category : 'accessing' }
FamixTImplementable >> implementations: anObject [

	<ignoreForCoverage>
	<generated>
	implementations value: anObject
]

{ #category : 'accessing' }
FamixTImplementable >> implementors [

	^ self implementations collect: #implementingClass
]
