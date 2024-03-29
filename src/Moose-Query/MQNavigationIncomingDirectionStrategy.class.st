"
Description
--------------------

I am a strategy managing the behavior of the Moose Queries depending on directions in the case where the query require the incomings associations.
"
Class {
	#name : #MQNavigationIncomingDirectionStrategy,
	#superclass : #MQNavigationDirectionStrategy,
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MQNavigationIncomingDirectionStrategy class >> determinatingSymbol [
	^ #in
]

{ #category : #accessing }
MQNavigationIncomingDirectionStrategy class >> entityFor: anAssociation [
	^ anAssociation source
]

{ #category : #accessing }
MQNavigationIncomingDirectionStrategy class >> msePropertiesOf: anEntity [
	^ anEntity incomingMSEProperties
]

{ #category : #accessing }
MQNavigationIncomingDirectionStrategy class >> queryResultClass [
	^ MooseIncomingQueryResult
]
