Class {
	#name : #MQScopeShouldBeSeclectedReturnNotBooleanValueError,
	#superclass : #Error,
	#instVars : [
		'stopStrategy'
	],
	#category : #'Moose-Query-Exceptions'
}

{ #category : #'as yet unclassified' }
MQScopeShouldBeSeclectedReturnNotBooleanValueError class >> stopStrategySignal: aStopStrategy [
	self new
		stopStrategy: aStopStrategy;
		signal
]

{ #category : #accessing }
MQScopeShouldBeSeclectedReturnNotBooleanValueError >> messageText [
	^ String
		streamContents: [ :streamContents | 
			streamContents nextPutAll: 'Your stop strategy: '.
			self stopStrategy storeOn: streamContents.
			streamContents nextPutAll: ' does not return a boolean' ]
]

{ #category : #accessing }
MQScopeShouldBeSeclectedReturnNotBooleanValueError >> stopStrategy [
	^ stopStrategy
]

{ #category : #accessing }
MQScopeShouldBeSeclectedReturnNotBooleanValueError >> stopStrategy: anObject [
	stopStrategy := anObject
]
