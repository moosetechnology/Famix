Class {
	#name : #MooseSmalltalkImporterSubclassesTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'pharoImporterTask'
	],
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> model [
	^ model
]

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> model: anObject [
	model := anObject
]

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> pharoImporterTask [
	^ pharoImporterTask
]

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> pharoImporterTask: anObject [
	pharoImporterTask := anObject
]

{ #category : #running }
MooseSmalltalkImporterSubclassesTest >> setUp [

	super setUp.
	model := FamixStModel new.
	model name: 'Test'.
	pharoImporterTask := FamixStPharoImporterTask new
		                     doNotRunCandidateOperator;
		                     importingContext: (FamixStImporterContext new
				                      importPackage;
				                      importInheritance;
				                      importAccess;
				                      mergeClassAndMetaclass;
				                      yourself)
]

{ #category : #tests }
MooseSmalltalkImporterSubclassesTest >> testDoNotImportSubClasses [

	self pharoImporterTask
		importingContext: (self pharoImporterTask importingContext
				 doNotImportSubclasses;
				 yourself);
		model: model;
		addFromPackagesMatching: [ :e |
		e name beginsWith: 'Moose-TestResources-Reference-Core' ];
		run.

	self deny:
		((model allClasses collect: #name) includes: 'SubRootModelTwo')
]

{ #category : #tests }
MooseSmalltalkImporterSubclassesTest >> testImportSubClasses [

	self pharoImporterTask
		importingContext: (self pharoImporterTask importingContext
				 importSubclasses;
				 yourself);
		model: model;
		addFromPackagesMatching: [ :e |
		e name beginsWith: 'Moose-TestResources-Reference-Core' ];
		run.

	self assert:
		((model allClasses collect: #name) includes: 'SubRootModelTwo')
]
