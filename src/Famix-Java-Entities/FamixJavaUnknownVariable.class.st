Class {
	#name : #FamixJavaUnknownVariable,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTUnknownVariable',
	#classTraits : 'FamixTUnknownVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownVariable class >> annotation [

	<FMClass: #UnknownVariable super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'moose query' }
FamixJavaUnknownVariable >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryDependencyAssociation newFrom: self to: dt)} ]
]
