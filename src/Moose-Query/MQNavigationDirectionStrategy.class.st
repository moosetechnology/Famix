"
Description
--------------------

I am an abstract class part of a Design Pattern Strategy. 

With my subclasses we manage the direction of the MooseQueries and everything related to direction in the queries.

I am able to return the right strategy to use in a query with the method #fromSymbol. This method takes a symbol representing a direction as parameter and return the right strategy. 

Example
-------------------

	MooseQueryAbstractDirectionStrategy fromSymbol: #in
"
Class {
	#name : #MQNavigationDirectionStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Navigating'
}

{ #category : #accessing }
MQNavigationDirectionStrategy class >> determinatingSymbol [
	"I should return a Symbol representing a direction. For example an Incoming direction will have #in as determinating symbol."

	^ self subclassResponsibility
]

{ #category : #accessing }
MQNavigationDirectionStrategy class >> ensureAssociation: anObject with: anEntity [
	"Ensure the object as parameter is an association to or from the entity in parameter depending on the direction.
	
	I am used to manage non-reified dependencies."

	^ self subclassResponsibility
]

{ #category : #accessing }
MQNavigationDirectionStrategy class >> entityFor: anAssociation [
	"I should return a a side of the association depending on the direction. For example an Incoming direction will return the source of the associations."

	^ self subclassResponsibility
]

{ #category : #'instance creation' }
MQNavigationDirectionStrategy class >> fromSymbol: aSymbol [
	"I return the right strategy from a Symbol representing a direction"

	^ self allSubclasses detect: [ :each | each determinatingSymbol = aSymbol ] ifNone: [ self error: 'The symbol passed to the query should be either #in or #out. Here we got ' , aSymbol asString ]
]

{ #category : #accessing }
MQNavigationDirectionStrategy class >> msePropertiesOf: anEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
MQNavigationDirectionStrategy class >> queryResultClass [
	^ self subclassResponsibility
]
