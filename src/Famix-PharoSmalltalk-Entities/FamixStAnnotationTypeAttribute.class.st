Class {
	#name : #FamixStAnnotationTypeAttribute,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationTypeAttribute class >> annotation [

	<FMClass: #AnnotationTypeAttribute super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'moose query' }
FamixStAnnotationTypeAttribute >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryDependencyAssociation newFrom: self to: dt)} ]
]

{ #category : #accessing }
FamixStAnnotationTypeAttribute >> parentAnnotationType [
	<FMProperty: #parentAnnotationType type: #FamixStAnnotationType> <derived> 
	<FMComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #accessing }
FamixStAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
