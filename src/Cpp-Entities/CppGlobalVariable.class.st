Class {
	#name : #CppGlobalVariable,
	#superclass : #CppNamedEntity,
	#traits : 'FamixTGlobalVariable',
	#classTraits : 'FamixTGlobalVariable classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppGlobalVariable class >> annotation [

	<FMClass: #GlobalVariable super: #CppNamedEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]
