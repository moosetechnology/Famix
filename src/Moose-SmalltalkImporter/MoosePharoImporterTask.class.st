"
This class specifies that the Smalltalk classes are identified using packages
"
Class {
	#name : #MoosePharoImporterTask,
	#superclass : #MooseImportingTask,
	#instVars : [
		'classes',
		'packages',
		'classExtensions',
		'runSelector',
		'candidateClass',
		'candidateOperator',
		'model'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #adding }
MoosePharoImporterTask >> addClass: aClass [
	classes add: aClass
]

{ #category : #adding }
MoosePharoImporterTask >> addClassExtensions: col [
	classExtensions addAll: col
]

{ #category : #adding }
MoosePharoImporterTask >> addClasses: col [
	classes addAll: col
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackage: aRPackage [

	"late-bound cache initialization for classes"
	self addClasses: aRPackage definedClasses.
	self addClassExtensions: aRPackage extensionMethods
	
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackageNamed: aPackageName [

	self addFromPackage: (self packageOrganizer packageNamed: aPackageName asSymbol)
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackagesMatching: aBlock [

	self packageOrganizer packages do: [:each |
		 (aBlock value: each) ifTrue: [self addFromPackage: each]]
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackagesNamed: aCollection [

	aCollection do: [:each| self addFromPackageNamed: each]
]

{ #category : #running }
MoosePharoImporterTask >> basicRun [

	| importerTask importer |
	"importerTask applies an import filter definition (context) on a set of classes (allClasses) and yields elements"
	importerTask := MooseImportClassesTask new.
	importerTask factory: self factory.
	importerTask importingContext: importingContext.
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
MoosePharoImporterTask >> candidateClass [

	^ candidateClass ifNil: [ candidateClass := CandidateListOperator ]
]

{ #category : #'protected hooks' }
MoosePharoImporterTask >> candidateClass: anObject [
	"Normally you should not invoke such method. Use run and doNotRunCandidateOperator instead"
	
	candidateClass := anObject
]

{ #category : #accessing }
MoosePharoImporterTask >> classExtensions [ 
	^classExtensions 
]

{ #category : #accessing }
MoosePharoImporterTask >> classes [
	^classes
]

{ #category : #initialization }
MoosePharoImporterTask >> defaultImportingContext [
	"does not import stub methods by default because it can create a lot of methods"
	| context |
	context := super defaultImportingContext.
	context entityKindsToBeExtracted remove: (context class importingSmalltalkStubMethod).
	^context
]

{ #category : #accessing }
MoosePharoImporterTask >> description [

	^ 'Importing <1p> packages from Smalltalk' expandMacrosWith: self packages size
]

{ #category : #setting }
MoosePharoImporterTask >> doNotRunCandidateOperator [

	candidateOperator := false
]

{ #category : #accessing }
MoosePharoImporterTask >> factory [
	^ super factory ifNil: [ factory := self model factory ]
]

{ #category : #initialization }
MoosePharoImporterTask >> initialize [

	super initialize.
	candidateOperator := true.
	runSelector := #run.
	classes := OrderedCollection new.
	classExtensions := OrderedCollection new.
	packages := OrderedCollection new.
]

{ #category : #accessing }
MoosePharoImporterTask >> length [ 
	 
	^0	"dummy value since we are a task holder"
]

{ #category : #accessing }
MoosePharoImporterTask >> model [ 
	 
	^model ifNil: [model := MooseModel new name: self modelName; yourself]
]

{ #category : #accessing }
MoosePharoImporterTask >> model: mooseModel [ 
	 
	model := mooseModel
]

{ #category : #accessing }
MoosePharoImporterTask >> modelName [

	^'<1s> package<2#:s>' 
		expandMacrosWith: self packagesString 
		with: self packages size
]

{ #category : #accessing }
MoosePharoImporterTask >> packages [
	^packages
]

{ #category : #accessing }
MoosePharoImporterTask >> packagesString [ 
	 
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
MoosePharoImporterTask >> runCandidateOperator [

	candidateOperator := true
]

{ #category : #running }
MoosePharoImporterTask >> runWithProgress [

	self withProgress.
	self run.
]

{ #category : #running }
MoosePharoImporterTask >> updateModelName [ 
	 
	self model name: self modelName
]

{ #category : #running }
MoosePharoImporterTask >> withProgress [

	runSelector := #runWithProgress
]

{ #category : #running }
MoosePharoImporterTask >> withoutProgress [

	runSelector := #run
]
