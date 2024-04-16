"
MooseImportingTask defines tasks whose goal is to populate models.

Instance Variables:
	importingContext	<ProtoObject | PseudoContext>
	importerClass	<Behavior>
"
Class {
	#name : #MooseImportingTask,
	#superclass : #FamixStAbstractImporter,
	#instVars : [
		'factory'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #accessing }
MooseImportingTask >> factory [
	^ factory
]

{ #category : #accessing }
MooseImportingTask >> factory: anObject [
	factory := anObject
]
