Class {
	#name : #FAMIXEnum,
	#superclass : #FAMIXType,
	#traits : 'FamixTEnum',
	#classTraits : 'FamixTEnum classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXEnum class >> annotation [

	<FMClass: #Enum super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXEnum >> values [
	^ self enumValues
]

{ #category : #accessing }
FAMIXEnum >> values: anObject [
	self enumValues: anObject
]
