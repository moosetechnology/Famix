Class {
	#name : #FamixJavaEnum,
	#superclass : #FamixJavaType,
	#traits : 'FamixTEnum',
	#classTraits : 'FamixTEnum classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnum class >> annotation [

	<FMClass: #Enum super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixJavaEnum >> incomingTypeDeclarations [  
	^ self typedEntities collect: [ :var | MooseQueryDependencyAssociation newFrom: var to: self ]
]

{ #category : #accessing }
FamixJavaEnum >> values [
	^ self enumValues
]

{ #category : #accessing }
FamixJavaEnum >> values: anObject [
	self enumValues: anObject
]
