Class {
	#name : #FAMIXComment,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXComment class >> annotation [

	<FMClass: #Comment super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #converting }
FAMIXComment >> asFAMIXComment [
	^ self
]

{ #category : #'Famix-Implementation' }
FAMIXComment >> belongsTo [
	
	^ self container
]
