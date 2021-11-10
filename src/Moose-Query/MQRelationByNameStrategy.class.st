Class {
	#name : #MQRelationByNameStrategy,
	#superclass : #MQAbstractRelationStrategy,
	#instVars : [
		'name'
	],
	#category : #'Moose-Query-Relations'
}

{ #category : #accessing }
MQRelationByNameStrategy class >> name: aSymbol [

	^ self new
		  name: aSymbol;
		  yourself
]

{ #category : #accessing }
MQRelationByNameStrategy >> name [

	^ name
]

{ #category : #accessing }
MQRelationByNameStrategy >> name: anObject [

	name := anObject
]

{ #category : #selection }
MQRelationByNameStrategy >> selectPropertiesIn: anEntity [

	^ anEntity mooseDescription allRelationProperties select: [ :relation | 
		  relation name = name ]
]
