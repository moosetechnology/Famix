Class {
	#name : #FamixTest1Method,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Method class >> annotation [

	<FMClass: #Method super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #'moose query' }
FamixTest1Method >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryDependencyAssociation newFrom: self to: dt)} ]
]
