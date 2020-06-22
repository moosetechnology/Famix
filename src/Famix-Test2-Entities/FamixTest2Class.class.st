Class {
	#name : #FamixTest2Class,
	#superclass : #FamixTest2NamedEntity,
	#traits : 'FamixTClass',
	#classTraits : 'FamixTClass classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Class class >> annotation [

	<FMClass: #Class super: #FamixTest2NamedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixTest2Class >> incomingTypeDeclarations [  
	^ self typedEntities collect: [ :var | MooseQueryDependencyAssociation newFrom: var to: self ]
]
