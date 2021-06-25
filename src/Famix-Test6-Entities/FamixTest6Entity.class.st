Class {
	#name : #FamixTest6Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest6Entity class >> metamodel [

	<generated>
	^ FamixTest6Model metamodel
]

{ #category : #initialization }
FamixTest6Entity >> initialize [

super initialize.

"Default value initialization"

]
