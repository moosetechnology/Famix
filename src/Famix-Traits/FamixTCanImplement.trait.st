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
	#name : 'FamixTCanImplement',
	#instVars : [
		'#interfaceImplementations => FMMany type: #FamixTImplementation opposite: #implementingClass'
	],
	#category : 'Famix-Traits-Implementation',
	#package : 'Famix-Traits',
	#tag : 'Implementation'
}

{ #category : 'meta' }
FamixTCanImplement classSide >> annotation [

	<FMClass: #TCanImplement super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTCanImplement >> addInterfaceImplementation: anObject [
	<generated>
	^ self interfaceImplementations add: anObject
]

{ #category : 'enumerating' }
FamixTCanImplement >> allImplementedInterfaces [
	"runs aBlock on all implemented interfaces and the interfaces they inherit"

	| implementedInterfaces |
	implementedInterfaces := OrderedCollection new.

	self allImplementedInterfacesDo: [ :interface | implementedInterfaces add: interface ].

	^implementedInterfaces 
]

{ #category : 'enumerating' }
FamixTCanImplement >> allImplementedInterfacesDo: aBlock [
	"runs aBlock on all implemented interfaces and the interfaces they inherit"

	self interfaceImplementations do: [ :implementation |
			aBlock value: implementation interface.
			implementation interface allSuperclassesDo: aBlock ]
]

{ #category : 'accessing' }
FamixTCanImplement >> directImplementedInterfaces [

	^ self interfaceImplementations collect: [ :implementation |
		  implementation interface ]
]

{ #category : 'accessing' }
FamixTCanImplement >> interfaceImplementations [
	"Relation named: #interfaceImplementations type: #FamixTImplementation opposite: #implementingClass"

	<generated>
	<FMComment: 'Implementation relationships'>
	<derived>
	^ interfaceImplementations
]

{ #category : 'accessing' }
FamixTCanImplement >> interfaceImplementations: anObject [

	<generated>
	interfaceImplementations value: anObject
]
