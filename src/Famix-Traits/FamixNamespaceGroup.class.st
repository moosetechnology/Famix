Class {
	#name : #FamixNamespaceGroup,
	#superclass : #MooseSpecializedGroup,
	#category : #'Famix-Traits-Groups'
}

{ #category : #meta }
FamixNamespaceGroup class >> annotation [

	<FMClass: #NamespaceGroup super: #MooseSpecializedGroup>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #meta }
FamixNamespaceGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
