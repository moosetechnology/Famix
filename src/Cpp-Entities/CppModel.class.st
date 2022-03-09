Class {
	#name : #CppModel,
	#superclass : #MooseModel,
	#category : #'Cpp-Entities-Model'
}

{ #category : #accessing }
CppModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
CppModel class >> annotation [
	<FMClass: #CppModel super: #MooseModel>
	<package: #'Cpp-Entities'>
	<generated>
]

{ #category : #accessing }
CppModel >> allMainEntities [
	<navigation: 'All main entities'>
	^ self
		lookUpPropertyNamed: #allMainEntities
		computedAs: [ 'Compute allMainEntities' record.
			self allModelBehaviourals , self allModelContainers ]
]

{ #category : #accessing }
CppModel >> allModelClasses [
	<navigation: 'All model classes'>
	"a cpp model can have types or classes hence we show both: types and classes.
	we double check here that types shown have sourceanchor in addition to checking in the super class that these are stubs
	we try to avoid showing type alias in the interface"

	^ self lookUpPropertyNamed: #allModelClasses computedAs: [ self allTypes reject: [ :each | each isStub or: [ each hasSourceAnchor not ] ] ]
]

{ #category : #accessing }
CppModel >> allModelFunctions [
	^ self
		lookUpPropertyNamed: #allModelFunctions
		computedAs: [ 'Compute allModelFunctions' record.
			self allFunctions reject: #isStub ]
]

{ #category : #metrics }
CppModel >> complexityRate [
	^ self allModelBehaviourals average: #cyclomaticComplexity
]

{ #category : #'dead code' }
CppModel >> computeAllBehaviouralsWithDeadCode [
	'Compute computeAllBehaviouralsWithDeadCode' record.
	^ super computeAllBehaviouralsWithDeadCode

]

{ #category : #accessing }
CppModel >> computeAllModelBehaviourals [
	self flag: #todo.	"we remove empty functions because these are function pointers and we dont know yet how to show  these in the interface correctly"
	^ super computeAllModelBehaviourals reject: [ :each | each name isEmpty ]

]

{ #category : #accessing }
CppModel >> computeAllModelContainers [ 
	'Compute all model containers' record.
	^ (self allWithSubTypesOf: CppContainerEntity) reject: #isStub

]

{ #category : #accessing }
CppModel >> computeNumberOfLinesOfCode [
	"the number of lines of code for a C/C++ model is the number of lines in individual source (header and source) files."

	"sum of the number of lines in each file. fileAnchor with same file name are counted only once"

	^ ((self allUsing: FamixTFileAnchor) groupedBy: #fileName) values sum: [ :indexedFileAnchorGroup | indexedFileAnchorGroup anyOne completeText lineCount ]
]

{ #category : #actions }
CppModel >> detectEncodingOfAllFileAnchors [
	self execute: [ super detectEncodingOfAllFileAnchors ] recordedAs: 'Detection of the encodings of files'
]

{ #category : #accessing }
CppModel >> entitiesForReplicationDetection [
	"for duplication entities we have to assert that their start and end are known. for now the problem only occurs for Siemens ref file, we might need to make it common to all models"

	^ self allModelMethods asOrderedCollection, self allModelFunctions
]

{ #category : #actions }
CppModel >> exportToMSEStream: aStream [
	self execute: [ super exportToMSEStream: aStream ] recordedAs: 'Export of a ' , self class printString
]

{ #category : #actions }
CppModel >> importFromMSEStream: aStream [
	"During loading, the MSE parser does not guarantee the order of the loading and so the consistency of the model; that's why we have to ignore assertions during loading"

	self
		execute: [ [ super importFromMSEStream: aStream ]
				on: AssertionFailure
				do: [ :ex | ex resume ] ]
		recordedAs: 'Import of a ' , self class printString
]

{ #category : #initialize }
CppModel >> initialize [
	super initialize.
	self flag: 'TODO'.
	"self rulesManager: RuRulesManager new.
	self initializeDefaultRules"

]

{ #category : #accessing }
CppModel >> replicationDetectionConfiguration [
	^ FamixRepConfiguration
		sourcesCleaner: FamixRepCPPCleaner new
		minimumNumberOfReplicas: 2
		ofLines: 100
		ofCharacters: 80
]
