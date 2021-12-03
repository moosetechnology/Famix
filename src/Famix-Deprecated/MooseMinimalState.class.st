"
Is a kind of NullPattern
"
Class {
	#name : #MooseMinimalState,
	#superclass : #MooseEntityState,
	#classInstVars : [
		'singelton'
	],
	#category : #'Famix-Deprecated'
}

{ #category : #testing }
MooseMinimalState class >> isDeprecated [
	"State and behaviour of MooseEntityState is now directly on MooseObject to save lot of memory."

	^ true
]
