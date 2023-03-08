Class {
	#name : #FamixTest6SourcedEntity,
	#superclass : #FamixTest6Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixTest6SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixTest6SourcedEntity
]
