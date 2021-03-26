Class {
	#name : #FamixStAttribute,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTAttribute + FamixTInvocationsReceiver + FamixTWithClassScope',
	#classTraits : 'FamixTAttribute classTrait + FamixTInvocationsReceiver classTrait + FamixTWithClassScope classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> beSharedVariable [

	self propertyNamed: #sharedVariable put: true 
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> isSharedVariable [
	^ self propertyNamed: #sharedVariable ifNil: [ false ]
]
