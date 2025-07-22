Class {
	#name : 'MooseAllUsingOnClass',
	#superclass : 'Error',
	#category : 'Moose-Core-Exception',
	#package : 'Moose-Core',
	#tag : 'Exception'
}

{ #category : 'private' }
MooseAllUsingOnClass >> messageText [
	^ 'Use #allWithSubTypesOf: or #allWithType: with Class'
]
