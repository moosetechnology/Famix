Class {
	#name : #FAMIXUnknownVariable,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTUnknownVariable',
	#classTraits : 'FamixTUnknownVariable classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXUnknownVariable class >> annotation [

	<FMClass: #UnknownVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'moose query' }
FAMIXUnknownVariable >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryDependencyAssociation newFrom: self to: dt)} ]
]
