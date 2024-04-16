"
I'm the root for the new importer.
This way my subclasses share error logging and importerContext
"
Class {
	#name : #FamixStAbstractImporter,
	#superclass : #MooseTask,
	#instVars : [
		'importingContext'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #public }
FamixStAbstractImporter class >> run [
	^ self new run
]

{ #category : #accessing }
FamixStAbstractImporter >> defaultImportingContext [
	^ MooseImportingContext new importMaximum
]

{ #category : #accessing }
FamixStAbstractImporter >> importingContext [
	^ importingContext
]

{ #category : #accessing }
FamixStAbstractImporter >> importingContext: anObject [
	importingContext := anObject
]

{ #category : #initialization }
FamixStAbstractImporter >> initialize [
	super initialize.
	importingContext := self defaultImportingContext
]

{ #category : #'Moose deprecated' }
FamixStAbstractImporter >> logFileSuffix [ 
	 
	^'.log'
]
