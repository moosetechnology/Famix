"
I'm the root for the new importer.
This way my subclasses share error logging and importerContext
"
Class {
	#name : #MooseAbstractImporter,
	#superclass : #MooseTask,
	#instVars : [
		'importingContext'
	],
	#category : #'Moose-Importers-Importers'
}

{ #category : #public }
MooseAbstractImporter class >> run [
	^ self new run
]

{ #category : #accessing }
MooseAbstractImporter >> defaultImportingContext [
	^ MooseImportingContext new importMaximum
]

{ #category : #accessing }
MooseAbstractImporter >> importingContext [
	^ importingContext
]

{ #category : #accessing }
MooseAbstractImporter >> importingContext: anObject [
	importingContext := anObject
]

{ #category : #initialization }
MooseAbstractImporter >> initialize [
	super initialize.
	importingContext := self defaultImportingContext
]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> logFileSuffix [ 
	 
	^'.log'
]
