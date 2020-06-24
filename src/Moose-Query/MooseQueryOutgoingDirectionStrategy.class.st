"
Description
--------------------

I am a strategy managing the behavior of the Moose Queries depending on directions in the case where the query require the outgoing associations.
"
Class {
	#name : #MooseQueryOutgoingDirectionStrategy,
	#superclass : #MooseQueryAbstractDirectionStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MooseQueryOutgoingDirectionStrategy class >> determinatingSymbol [
	^ #out
]

{ #category : #converting }
MooseQueryOutgoingDirectionStrategy class >> ensureAssociation: anObject with: anEntity [
	^ anObject asAssociationFrom: anEntity
]

{ #category : #accessing }
MooseQueryOutgoingDirectionStrategy class >> entityFor: anEntity [
	^ anEntity target
]

{ #category : #accessing }
MooseQueryOutgoingDirectionStrategy class >> msePropertiesOf: anEntity [
	^ anEntity outgoingMSEProperties
]

{ #category : #accessing }
MooseQueryOutgoingDirectionStrategy class >> queryResultOn: anEntity with: aCollection [
	^ anEntity createOutgoingQueryResultWith: aCollection
]
