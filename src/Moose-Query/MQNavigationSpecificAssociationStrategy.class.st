"
Description
--------------------

I am a stategy (Strategy Design Pattern) used in Navigation queries to define that we should select only one kind of associations.

This could be managed via a MooseQUeryNavigationMultipleAssociationsStrategy but for performance reasons we dedicate a class to it.

"
Class {
	#name : #MQNavigationSpecificAssociationStrategy,
	#superclass : #MQNavigationAssociationSelectionStrategy,
	#instVars : [
		'association'
	],
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MQNavigationSpecificAssociationStrategy class >> association: aClass [
	^ self new
		association: aClass;
		yourself
]

{ #category : #accessing }
MQNavigationSpecificAssociationStrategy >> association [
	^ association
]

{ #category : #accessing }
MQNavigationSpecificAssociationStrategy >> association: anObject [
	association := anObject
]

{ #category : #enumerating }
MQNavigationSpecificAssociationStrategy >> selectAssociationsIn: aCollection [
	^ aCollection select: [ :each | each isOfType: association ]
]
