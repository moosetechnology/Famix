Class {
	#name : #FamixFileGroup,
	#superclass : #MooseSpecializedGroup,
	#category : #'Famix-Traits-Groups'
}

{ #category : #meta }
FamixFileGroup class >> annotation [

	<FMClass: #FileGroup super: #MooseSpecializedGroup>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #meta }
FamixFileGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
