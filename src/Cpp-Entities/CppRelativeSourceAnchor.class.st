Class {
	#name : #CppRelativeSourceAnchor,
	#superclass : #CppEntity,
	#traits : 'FamixTRelativeSourceAnchor',
	#classTraits : 'FamixTRelativeSourceAnchor classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppRelativeSourceAnchor class >> annotation [

	<FMClass: #RelativeSourceAnchor super: #CppEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #testing }
CppRelativeSourceAnchor >> startBeforeFileAnchor: aTFileAnchor [
	(self startLine isNil or: [ aTFileAnchor startLine isNil ]) ifTrue: [ ^ false ].
		
	^ aTFileAnchor startLine >= self startLine

]
