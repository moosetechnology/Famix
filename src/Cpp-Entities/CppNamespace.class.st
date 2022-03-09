Class {
	#name : #CppNamespace,
	#superclass : #CppContainerEntity,
	#traits : 'FamixTNamespace + FamixTWithClasses + FamixTWithFunctions + FamixTWithGlobalVariables',
	#classTraits : 'FamixTNamespace classTrait + FamixTWithClasses classTrait + FamixTWithFunctions classTrait + FamixTWithGlobalVariables classTrait',
	#instVars : [
		'#parentScope => FMOne type: #CppNamespace opposite: #childScopes',
		'#childScopes => FMMany type: #CppNamespace opposite: #parentScope'
	],
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppNamespace class >> annotation [

	<FMClass: #Namespace super: #CppContainerEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #adding }
CppNamespace >> addChildScope: anObject [
	<generated>
	^ self childScopes add: anObject
]

{ #category : #accessing }
CppNamespace >> childScopes [
	"Relation named: #childScopes type: #CppNamespace opposite: #parentScope"

	<generated>
	<FMComment: 'Child scopes embedded in this scope, if any.'>
	<derived>
	^ childScopes
]

{ #category : #accessing }
CppNamespace >> childScopes: anObject [

	<generated>
	childScopes value: anObject
]

{ #category : #accessing }
CppNamespace >> parentScope [
	"Relation named: #parentScope type: #CppNamespace opposite: #childScopes"

	<generated>
	<FMComment: 'Parent scope embedding this scope, if any.'>
	<container>
	^ parentScope
]

{ #category : #accessing }
CppNamespace >> parentScope: anObject [

	<generated>
	parentScope := anObject
]

{ #category : #navigation }
CppNamespace >> parentScopeGroup [
	<generated>
	<navigation: 'ParentScope'>
	^ MooseSpecializedGroup with: self parentScope
]
