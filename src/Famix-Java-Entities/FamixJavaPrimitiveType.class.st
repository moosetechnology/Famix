Class {
	#name : #FamixJavaPrimitiveType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTPrimitiveType',
	#classTraits : 'FamixTPrimitiveType classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaPrimitiveType class >> annotation [

	<FMClass: #PrimitiveType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixJavaPrimitiveType >> incomingTypeDeclarations [  
	^ self typedEntities collect: [ :var | MooseQueryDependencyAssociation newFrom: var to: self ]
]

{ #category : #testing }
FamixJavaPrimitiveType >> isPrimitiveType [

	<generated>
	^ true
]
