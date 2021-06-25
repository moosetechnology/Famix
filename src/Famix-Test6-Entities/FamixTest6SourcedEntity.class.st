Class {
	#name : #FamixTest6SourcedEntity,
	#superclass : #FamixTest6Entity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^self
]

{ #category : #initialization }
FamixTest6SourcedEntity >> initialize [

super initialize.

"Default value initialization"

]
