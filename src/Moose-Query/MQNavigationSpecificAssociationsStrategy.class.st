"
Description
--------------------

I am a stategy (Strategy Design Pattern) used in Navigation queries to define that we should select only one kind of associations.

This could be managed via a MooseQUeryNavigationMultipleAssociationsStrategy but for performance reasons we dedicate a class to it.

"
Class {
	#name : #MQNavigationSpecificAssociationsStrategy,
	#superclass : #MQNavigationAssociationSelectionStrategy,
	#instVars : [
		'associations'
	],
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MQNavigationSpecificAssociationsStrategy class >> associations: aCollection [
	^ self new
		associations: aCollection;
		yourself
]

{ #category : #accessing }
MQNavigationSpecificAssociationsStrategy >> associations [
	^ associations
]

{ #category : #accessing }
MQNavigationSpecificAssociationsStrategy >> associations: anObject [
	associations := anObject
]

{ #category : #enumerating }
MQNavigationSpecificAssociationsStrategy >> selectAssociationsIn: aCollection [
	^ aCollection select: [ :each | associations anySatisfy: [ :association | each isOfType: association ] ]
]

{ #category : #printing }
MQNavigationSpecificAssociationsStrategy >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' associations: { '.
	associations do: [ :asso | asso storeOn: aStream ] separatedBy: [ aStream nextPutAll: ' . ' ].
	aStream nextPutAll: '})'
]
