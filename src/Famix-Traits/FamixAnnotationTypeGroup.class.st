Class {
	#name : #FamixAnnotationTypeGroup,
	#superclass : #MooseSpecializedGroup,
	#category : #'Famix-Traits-Groups'
}

{ #category : #meta }
FamixAnnotationTypeGroup class >> annotation [

	<FMClass: #AnnotationTypeGroup super: #MooseSpecializedGroup>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #meta }
FamixAnnotationTypeGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]
