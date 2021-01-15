Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTAttribute + FamixTCanBeFinal + FamixTWithClassScope',
	#classTraits : 'FamixTAttribute classTrait + FamixTCanBeFinal classTrait + FamixTWithClassScope classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
