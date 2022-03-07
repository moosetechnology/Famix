Class {
	#name : #CppBlock,
	#superclass : #CppBehaviouralEntity,
	#instVars : [
		'#parentBlock => FMOne type: #CppBehaviouralEntity opposite: #innerBlocks'
	],
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppBlock class >> annotation [

	<FMClass: #Block super: #CppBehaviouralEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #testing }
CppBlock >> isCPPSBlock [

	<generated>
	^ true
]

{ #category : #accessing }
CppBlock >> parentBlock [
	"Relation named: #parentBlock type: #CppBehaviouralEntity opposite: #innerBlocks"

	<generated>
	<FMComment: '"Block" containing this block. belongsTo implementation'>
	^ parentBlock
]

{ #category : #accessing }
CppBlock >> parentBlock: anObject [

	<generated>
	parentBlock := anObject
]
