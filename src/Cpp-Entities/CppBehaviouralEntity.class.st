Class {
	#name : #CppBehaviouralEntity,
	#superclass : #CppContainerEntity,
	#traits : 'FamixTInvocable + FamixTWithAccesses + FamixTWithInvocations + FamixTWithStatements',
	#classTraits : 'FamixTInvocable classTrait + FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithStatements classTrait',
	#instVars : [
		'#innerBlocks => FMMany type: #CppBlock opposite: #parentBlock'
	],
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppBehaviouralEntity class >> annotation [

	<FMClass: #BehaviouralEntity super: #CppContainerEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #adding }
CppBehaviouralEntity >> addInnerBlock: anObject [
	<generated>
	^ self innerBlocks add: anObject
]

{ #category : #accessing }
CppBehaviouralEntity >> innerBlocks [
	"Relation named: #innerBlocks type: #CppBlock opposite: #parentBlock"

	<generated>
	<FMComment: 'Blocks declared in this behavioural'>
	<derived>
	^ innerBlocks
]

{ #category : #accessing }
CppBehaviouralEntity >> innerBlocks: anObject [

	<generated>
	innerBlocks value: anObject
]
