"
I can be the source of an implementation (cf a class implementing an Interface)

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `interfaceImplementations` | `FamixTCanImplement` | `implementingClass` | `FamixTImplementation` | Implementation relationships|



"
Trait {
	#name : #FamixTCanImplement,
	#instVars : [
		'#interfaceImplementations => FMMany type: #FamixTImplementation opposite: #implementingClass'
	],
	#category : #'Famix-Traits-Implementation'
}

{ #category : #meta }
FamixTCanImplement classSide >> annotation [

	<FMClass: #TCanImplement super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTCanImplement >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTCanImplement: self
]

{ #category : #adding }
FamixTCanImplement >> addInterfaceImplementation: anObject [
	<generated>
	^ self interfaceImplementations add: anObject
]

{ #category : #accessing }
FamixTCanImplement >> directImplementedInterfaces [

	^ self interfaceImplementations collect: [ :implementation |
		  implementation interface ]
]

{ #category : #accessing }
FamixTCanImplement >> interfaceImplementations [
	"Relation named: #interfaceImplementations type: #FamixTImplementation opposite: #implementingClass"

	<generated>
	<FMComment: 'Implementation relationships'>
	<derived>
	^ interfaceImplementations
]

{ #category : #accessing }
FamixTCanImplement >> interfaceImplementations: anObject [

	<generated>
	interfaceImplementations value: anObject
]
