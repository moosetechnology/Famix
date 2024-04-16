"
This class specifies that the Smalltalk classes are identified using packages
"
Class {
	#name : #FamixStPharoImporterTask,
	#superclass : #FamixStAbstractImporter,
	#instVars : [
		'packages',
		'classExtensions',
		'runSelector',
		'candidateClass',
		'candidateOperator',
		'model'
	],
	#category : #'Moose-SmalltalkImporter-Importers'
}

{ #category : #adding }
FamixStPharoImporterTask >> addClass: aClass [
	classes add: aClass
]

{ #category : #adding }
FamixStPharoImporterTask >> addClassExtensions: col [
	classExtensions addAll: col
]

{ #category : #adding }
FamixStPharoImporterTask >> addClasses: col [
	classes addAll: col
]

{ #category : #adding }
FamixStPharoImporterTask >> addFromPackage: aRPackage [

	"late-bound cache initialization for classes"
	self addClasses: aRPackage definedClasses.
	self addClassExtensions: aRPackage extensionMethods
	
]

{ #category : #adding }
FamixStPharoImporterTask >> addFromPackageNamed: aPackageName [

	self addFromPackage: (self packageOrganizer packageNamed: aPackageName asSymbol)
]

{ #category : #adding }
FamixStPharoImporterTask >> addFromPackagesMatching: aBlock [

	self packageOrganizer packages do: [:each |
		 (aBlock value: each) ifTrue: [self addFromPackage: each]]
]

{ #category : #adding }
FamixStPharoImporterTask >> addFromPackagesNamed: aCollection [

	aCollection do: [:each| self addFromPackageNamed: each]
]

{ #category : #running }
FamixStPharoImporterTask >> basicRun [

	| importerTask importer |
	"importerTask applies an import filter definition (context) on a set of classes (allClasses) and yields elements"
	importerTask := FamixStImportClassesTask new.
	importerTask factory: self factory.
	importerTask importingContext: self importingContext.
	importerTask addAll: self classes.
	importerTask addAllExtensions: self classExtensions.
	importer := importerTask runSelector: runSelector.
	"InstallElementsOperator populates a Moose model with (unary) elements"
	(InstallElementsOperator with: importer on: self model) runSelector: runSelector.
	"CandidateListOperator populates a Moose model with (binary) element relations like: methodA invokes methodB"
	candidateOperator ifTrue: [ (self candidateClass runOn: self model importer: importer) runSelector: runSelector ].
	self model sourceLanguage: importer factory sourceLanguage new.
	^ self model
]

{ #category : #'protected hooks' }
FamixStPharoImporterTask >> candidateClass [

	^ candidateClass ifNil: [ candidateClass := CandidateListOperator ]
]

{ #category : #'protected hooks' }
FamixStPharoImporterTask >> candidateClass: anObject [
	"Normally you should not invoke such method. Use run and doNotRunCandidateOperator instead"
	
	candidateClass := anObject
]

{ #category : #accessing }
FamixStPharoImporterTask >> classExtensions [ 
	^classExtensions 
]

{ #category : #initialization }
FamixStPharoImporterTask >> defaultImportingContext [
	"does not import stub methods by default because it can create a lot of methods"

	| context |
	context := MooseImportingContext new importMaximum.
	context entityKindsToBeExtracted remove: context class importingSmalltalkStubMethod.
	^ context
]

{ #category : #accessing }
FamixStPharoImporterTask >> description [

	^ 'Importing <1p> packages from Smalltalk' expandMacrosWith: self packages size
]

{ #category : #setting }
FamixStPharoImporterTask >> doNotRunCandidateOperator [

	candidateOperator := false
]

{ #category : #accessing }
FamixStPharoImporterTask >> factory [
	^ super factory ifNil: [ factory := self model factory ]
]

{ #category : #initialization }
FamixStPharoImporterTask >> initialize [

	super initialize.
	candidateOperator := true.
	runSelector := #run.
	classes := OrderedCollection new.
	classExtensions := OrderedCollection new.
	packages := OrderedCollection new.
]

{ #category : #accessing }
FamixStPharoImporterTask >> length [ 
	 
	^0	"dummy value since we are a task holder"
]

{ #category : #accessing }
FamixStPharoImporterTask >> model [ 
	 
	^model ifNil: [model := MooseModel new name: self modelName; yourself]
]

{ #category : #accessing }
FamixStPharoImporterTask >> model: mooseModel [ 
	 
	model := mooseModel
]

{ #category : #accessing }
FamixStPharoImporterTask >> modelName [

	^'<1s> package<2#:s>' 
		expandMacrosWith: self packagesString 
		with: self packages size
]

{ #category : #accessing }
FamixStPharoImporterTask >> packages [
	^packages
]

{ #category : #accessing }
FamixStPharoImporterTask >> packagesString [ 
	 
	| stream | 
	stream := String new writeStream. 
	(self packages asOrderedCollection sorted: [:a :b | a name < b name]) 
		do: [:each | stream print: each] 
		separatedBy: 
			[stream 
				nextPut: $,; 
				space]. 
	^stream contents
]

{ #category : #setting }
FamixStPharoImporterTask >> runCandidateOperator [

	candidateOperator := true
]

{ #category : #running }
FamixStPharoImporterTask >> runWithProgress [

	self withProgress.
	self run.
]

{ #category : #running }
FamixStPharoImporterTask >> updateModelName [ 
	 
	self model name: self modelName
]

{ #category : #running }
FamixStPharoImporterTask >> withProgress [

	runSelector := #runWithProgress
]

{ #category : #running }
FamixStPharoImporterTask >> withoutProgress [

	runSelector := #run
]
