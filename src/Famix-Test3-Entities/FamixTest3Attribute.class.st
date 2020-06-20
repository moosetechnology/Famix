Class {
	#name : #FamixTest3Attribute,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTAttribute',
	#classTraits : 'FamixTAttribute classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Attribute class >> annotation [

	<FMClass: #Attribute super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #'moose query' }
FamixTest3Attribute >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryDependencyAssociation newFrom: self to: dt)} ]
]
