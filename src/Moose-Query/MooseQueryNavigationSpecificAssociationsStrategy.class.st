Class {
	#name : #MooseQueryNavigationSpecificAssociationsStrategy,
	#superclass : #MooseQueryNavigationAbstractAssociationSelectionStrategy,
	#instVars : [
		'association'
	],
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MooseQueryNavigationSpecificAssociationsStrategy class >> association: aClass [
	^ self new
		association: aClass;
		yourself
]

{ #category : #accessing }
MooseQueryNavigationSpecificAssociationsStrategy >> association [
	^ association
]

{ #category : #accessing }
MooseQueryNavigationSpecificAssociationsStrategy >> association: anObject [
	association := anObject
]
