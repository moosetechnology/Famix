Class {
	#name : 'FamixTest3TypeGroup',
	#superclass : 'MooseSpecializedGroup',
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3TypeGroup class >> annotation [

	<FMClass: #TypeGroup super: #MooseSpecializedGroup>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]

{ #category : 'meta' }
FamixTest3TypeGroup class >> metamodel [

	<generated>
	^ FamixTest3Model metamodel
]
