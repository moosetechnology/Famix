Class {
	#name : #CppPackage,
	#superclass : #CppContainerEntity,
	#traits : 'FamixTPackage + FamixTPackageable + FamixTWithFunctions',
	#classTraits : 'FamixTPackage classTrait + FamixTPackageable classTrait + FamixTWithFunctions classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppPackage class >> annotation [

	<FMClass: #Package super: #CppContainerEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]
