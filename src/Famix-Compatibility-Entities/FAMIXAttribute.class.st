Class {
	#name : #FAMIXAttribute,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FAMIXTCanBeTransient + FAMIXTCanBeVolatile + FamixTAttribute + FamixTHasClassScope',
	#classTraits : 'FAMIXTCanBeTransient classTrait + FAMIXTCanBeVolatile classTrait + FamixTAttribute classTrait + FamixTHasClassScope classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAttribute class >> annotation [

	<FMClass: #Attribute super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Smalltalk' }
FAMIXAttribute >> beInstanceVariable [

	self propertyNamed: #sharedVariable put: false 
]

{ #category : #'Famix-Smalltalk' }
FAMIXAttribute >> beSharedVariable [

	self propertyNamed: #sharedVariable put: true 
]

{ #category : #initialization }
FAMIXAttribute >> initialize [
	super initialize.
	isVolatile := false.
	isTransient := false
]

{ #category : #'Famix-Smalltalk' }
FAMIXAttribute >> isSharedVariable [

	"^ self propertyNamed: #sharedVariable ifAbsent: [false] "
	^ self propertyNamed: #sharedVariable ifNil: [false]
]
