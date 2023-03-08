Class {
	#name : #FamixJavaSourceAnchor,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixJavaSourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixJavaSourceAnchor
]
