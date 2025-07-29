Class {
	#name : 'LANAbstractDestinationAddress',
	#superclass : 'Object',
	#classVars : [
		'MySharedVariable'
	],
	#category : 'Moose-TestResources-LAN',
	#package : 'Moose-TestResources-LAN'
}

{ #category : 'comparing' }
LANAbstractDestinationAddress >> isDestinationFor: aNodeAddress [ 
	 
	^self subclassResponsibility
]
