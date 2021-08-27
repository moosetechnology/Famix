Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTCanBeClassSide + FamixJavaTCanBeTransient + FamixJavaTCanBeVolatile + FamixTAttribute + FamixTCanBeFinal + FamixTHasVisibility + FamixTInvocationsReceiver + FamixTWithComments',
	#classTraits : 'FamixJavaTCanBeClassSide classTrait + FamixJavaTCanBeTransient classTrait + FamixJavaTCanBeVolatile classTrait + FamixTAttribute classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTInvocationsReceiver classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
