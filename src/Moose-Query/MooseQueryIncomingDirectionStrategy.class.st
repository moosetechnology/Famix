"
Description
--------------------

I am a strategy managing the behavior of the Moose Queries depending on directions in the case where the query require the incomings associations.
"
Class {
	#name : #MooseQueryIncomingDirectionStrategy,
	#superclass : #MooseQueryAbstractDirectionStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> determinatingSymbol [
	^ #in
]

{ #category : #converting }
MooseQueryIncomingDirectionStrategy class >> ensureAssociation: anObject with: anEntity [
	^ anObject asAssociationTo: anEntity
]

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> msePropertiesOf: anEntity [
	^ anEntity incomingMSEProperties
]

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> queryResultOn: anEntity with: aCollection [
	^ anEntity createIncomingQueryResultWith: aCollection
]

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> symbolToCollectEntities [
	"I should return a Symbol to collect entities. For example an Incoming direction will have #from as symbol to collect entities."

	^ #source
]
