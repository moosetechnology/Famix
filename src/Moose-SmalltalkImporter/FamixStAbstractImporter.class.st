"
I'm the root for the new importer.
This way my subclasses share error logging and importerContext
"
Class {
	#name : #FamixStAbstractImporter,
	#superclass : #MooseTask,
	#instVars : [
		'importingContext',
		'factory',
		'classes'
	],
	#category : #'Moose-SmalltalkImporter-Importers'
}

{ #category : #public }
FamixStAbstractImporter class >> run [
	^ self new run
]

{ #category : #accessing }
FamixStAbstractImporter >> classes [

	^ classes
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

	^ importingContext ifNil: [ importingContext := self defaultImportingContext ]
]

{ #category : #accessing }
FamixStAbstractImporter >> importingContext: anObject [
	importingContext := anObject
]
