Class {
	#name : #MooseQueryScopeAbstractTypeStrategy,
	#superclass : #Object,
	#category : #'Moose-Query-Scoping'
}

{ #category : #testing }
MooseQueryScopeAbstractTypeStrategy >> isOfRightType: anEntity [
	^ self subclassResponsibility
]
