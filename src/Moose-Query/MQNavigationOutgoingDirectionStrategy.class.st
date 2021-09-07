"
Description
--------------------

I am a strategy managing the behavior of the Moose Queries depending on directions in the case where the query require the outgoing associations.
"
Class {
	#name : #MQNavigationOutgoingDirectionStrategy,
	#superclass : #MQNavigationDirectionStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MQNavigationOutgoingDirectionStrategy class >> determinatingSymbol [
	^ #out
]

{ #category : #converting }
MQNavigationOutgoingDirectionStrategy class >> ensureAssociation: anObject with: anEntity [
	^ anObject asAssociationFrom: anEntity
]

{ #category : #accessing }
MQNavigationOutgoingDirectionStrategy class >> entityFor: anAssociation [
	^ anAssociation target
]

{ #category : #accessing }
MQNavigationOutgoingDirectionStrategy class >> msePropertiesOf: anEntity [
	^ anEntity outgoingMSEProperties
]

{ #category : #accessing }
MQNavigationOutgoingDirectionStrategy class >> queryResultClass [
	^ MooseOutgoingQueryResult
]
