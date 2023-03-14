Class {
	#name : #FamixStComment,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStComment class >> annotation [

	<FMClass: #Comment super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixStComment >> belongsTo [

	^ self commentedEntity
]
