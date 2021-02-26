Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTAttribute + FamixTCanBeFinal + FamixTHasVisibility + FamixTInvocationsReceiver + FamixTWithClassScope',
	#classTraits : 'FamixTAttribute classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTInvocationsReceiver classTrait + FamixTWithClassScope classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
