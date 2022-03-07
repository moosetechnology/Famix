Class {
	#name : #CppFileAnchor,
	#superclass : #CppSourceAnchor,
	#traits : 'FamixTFileNavigation',
	#classTraits : 'FamixTFileNavigation classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppFileAnchor class >> annotation [

	<FMClass: #FileAnchor super: #CppSourceAnchor>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #adding }
CppFileAnchor >> addFileAnchorWithPath: aPath [
	^ CppMultipleFileAnchor new
		mooseModel: self mooseModel;
		addSourceAnchor: self;
		addFileAnchorWithPath: aPath;
		yourself
]
