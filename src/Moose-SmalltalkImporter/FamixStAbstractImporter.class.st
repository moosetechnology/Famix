"
I'm the root for the new importer.
This way my subclasses share error logging and importerContext
"
Class {
	#name : #FamixStAbstractImporter,
	#superclass : #MooseTask,
	#instVars : [
		'importingContext',
		'factory'
	],
	#category : #'Moose-SmalltalkImporter-Importers'
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
FamixStAbstractImporter >> factory [

	^ factory
]

{ #category : #accessing }
FamixStAbstractImporter >> factory: anObject [
	factory := anObject
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
