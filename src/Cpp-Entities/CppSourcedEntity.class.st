Class {
	#name : #CppSourcedEntity,
	#superclass : #CppEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #CppEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]
