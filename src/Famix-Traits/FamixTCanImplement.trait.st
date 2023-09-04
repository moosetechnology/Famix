"
I can be the source of an implementation (cf a class implementing an Interface)
"
Trait {
	#name : #FamixTCanImplement,
	#instVars : [
		'#interfaceImplementations => FMMany type: #FamixTImplementation opposite: #implementingClass'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTCanImplement classSide >> annotation [

	<FMClass: #TCanImplement super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTCanImplement >> addInterfaceImplementation: anObject [
	<generated>
	^ self interfaceImplementations add: anObject
]

{ #category : #accessing }
FamixTCanImplement >> allImplementedInterfacesHierarchy [

	| allImplementedInterfaces |
	allImplementedInterfaces := OrderedCollection new.

	self withAllImplementedInterfacesHierarchyDo: [ :interface |
		allImplementedInterfaces add: interface ].

	^ allImplementedInterfaces
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

{ #category : #enumerating }
FamixTCanImplement >> withAllImplementedInterfacesHierarchyDo: aBlock [

	self directImplementedInterfaces do: [ :directInterface |
		directInterface withSuperclassesDo: aBlock ]
]
