"
A MooseImportClassesTask is an elementary importing action which is called by the MooseCompositeImporterTask.
Normally you should not call it directly. The results of MooseImportClassesTask is a list of entitie which are not yet installed in a model.

MooseImportClassesTask pays attention to import classes and their extensions nicely.

A MooseImportClassesTask does not deal directly with a model. It just creates entities that will be installed in a model. The installation 
is trigged by the MooseCompositeImporterTask and implemented by InstallElementsOperator.


"
Class {
	#name : #FamixStImportClassesTask,
	#superclass : #MooseTask,
	#traits : 'FamixStTImportUtils',
	#classTraits : 'FamixStTImportUtils classTrait',
	#instVars : [
		'classExtensions'
	],
	#category : #'Moose-SmalltalkImporter-Importers'
}

{ #category : #adding }
FamixStImportClassesTask >> addAll: classCollection [ 
	 
	^classCollection do: [:each | self addClass: each]
]

{ #category : #adding }
FamixStImportClassesTask >> addAllExtensions: extCollection [ 
	 
	^extCollection do: [:each | self addClassExtension: each]
]

{ #category : #adding }
FamixStImportClassesTask >> addClass: aClass [ 
	 
	^classes add: aClass
]

{ #category : #adding }
FamixStImportClassesTask >> addClassExtension: aClassExtension [ 
	 
	^classExtensions add: aClassExtension 
]

{ #category : #running }
FamixStImportClassesTask >> basicRun [

	| importer |
	importer := FamixStImporter new importingContext: self importingContext.
	importer factory: self factory.
	self classes do: [ :class |
		importer importClass: class.
		self increment ].
	self classExtensions do: [ :ext | importer importClassExtension: ext ].
	^ importer
]

{ #category : #accessing }
FamixStImportClassesTask >> classExtensions [ 
	 
	^classExtensions 
]

{ #category : #accessing }
FamixStImportClassesTask >> description [ 
	 
	^'Importing <1p> classes from Smalltalk' 
		expandMacrosWith: self classes size
]

{ #category : #initialization }
FamixStImportClassesTask >> initialize [
	super initialize. 
	classes := IdentitySet new. 
	classExtensions := IdentitySet new.
]

{ #category : #accessing }
FamixStImportClassesTask >> length [ 
	 
	^self classes size
]
