Class {
	#name : #FamixInvocationGroup,
	#superclass : #MooseSpecializedGroup,
	#category : #'Famix-Traits-Groups'
}

{ #category : #meta }
FamixInvocationGroup class >> annotation [

	<FMClass: #InvocationGroup super: #MooseSpecializedGroup>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #meta }
FamixInvocationGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
