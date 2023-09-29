Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTCanBeTransient + FamixJavaTCanBeVolatile + FamixTAttribute + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTInvocationsReceiver + FamixTWithComments',
	#classTraits : 'FamixJavaTCanBeTransient classTrait + FamixJavaTCanBeVolatile classTrait + FamixTAttribute classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTInvocationsReceiver classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
