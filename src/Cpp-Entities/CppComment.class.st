Class {
	#name : #CppComment,
	#superclass : #CppSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppComment class >> annotation [

	<FMClass: #Comment super: #CppSourcedEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]
