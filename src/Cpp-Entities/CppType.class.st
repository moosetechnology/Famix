Class {
	#name : #CppType,
	#superclass : #CppContainerEntity,
	#traits : 'FamixTClass + FamixTHasModifiers + FamixTWithTypes',
	#classTraits : 'FamixTClass classTrait + FamixTHasModifiers classTrait + FamixTWithTypes classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppType class >> annotation [

	<FMClass: #Type super: #CppContainerEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #deprecated }
CppType >> belongsTo [
	^ self parentPackage

]
