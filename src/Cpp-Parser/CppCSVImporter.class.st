"
TODO
"
Class {
	#name : #CppCSVImporter,
	#superclass : #Object,
	#category : #'Cpp-Parser-CSVImporter'
}

{ #category : #accessing }
CppCSVImporter class >> declarationMap [
	^ Dictionary new
		at: #fileLocation
			put:
			'#Files
fileId,path';
		at: #namespace
			put:
			'#Namespaces
id,name,parentId,file,line,column';
		at: #package
			put:
			'#Packages
id,name,parentId';
		at: #type
			put:
			'#Types
id,name';
		at: #classe
			put:
			'#Classes
id,name,typeId,parentId,file,line,column,abstract,trivial,kind,packageId';
		at: #enum
			put:
			'#Enums
id,name,typeId,parentId,file,line,column,packageId';
		at: #function
			put:
			'#Funcs
id,name,typeId,parentId,file,line,column,lineE,vindex';
		at: #variable
			put:
			'#Vars
id,name,typeId,parentId,file,line,column';
		at: #edge
			put:
			'#Edges
sourceId,targetId,file,line,column,edgeType';
		yourself
]

{ #category : #accessing }
CppCSVImporter class >> modelClass [
	^ CppModel
]

{ #category : #'instance creation' }
CppCSVImporter class >> runOn: aFolder [
	^ self new runOn: aFolder asFileReference
]

{ #category : #'instance creation' }
CppCSVImporter class >> runOn: aSourceFolder withRefFile: aFile withModel: aModel [
	^ self new runOn: aSourceFolder withRefFile: aFile readStream withModel: aModel
]

{ #category : #'instance creation' }
CppCSVImporter >> declarationFor: aSymbol [
	^ self class declarationMap at: aSymbol
]

{ #category : #initialization }
CppCSVImporter >> initialize [
	<launcherFor: #cpp priority: 10>
	super initialize
]

{ #category : #accessing }
CppCSVImporter >> modelClass [
	^ self class modelClass
]

{ #category : #accessing }
CppCSVImporter >> newModelOn: aRootFolder [
	^ self modelClass new
		rootFolder: aRootFolder fullName;
		yourself
]

{ #category : #parsing }
CppCSVImporter >> parse: stream forDeclaration: aSymbol with: parser [
	| securedPosition declaration |
	('Running sub-parser ' , aSymbol) record.
	securedPosition := stream position.
	declaration := self declarationFor: aSymbol.
	declaration lines
		do: [ :aLine | 
			('Checking if the stream is positioned at "' , aLine , '"') record.
			self
				assert: (aLine asPParser parse: stream nextLine) isPetit2Failure not
				description: 'Unable to find declaration: ' , declaration , ' at position: ' , securedPosition asString ].
	[ securedPosition := stream position.
	(parser parse: (stream nextLine ifNil: [ '' ])) isPetit2Failure ] whileFalse.
	stream position: securedPosition
]

{ #category : #'instance creation' }
CppCSVImporter >> runOn: aFolder [
	^ self runOn: aFolder withModel: (self newModelOn: aFolder)
]

{ #category : #'instance creation' }
CppCSVImporter >> runOn: aFolder withModel: model [
	| refFile |
	self flag: #todo.	"Manage errors"
	refFile := aFolder children detect: [ :f | f extension = 'ref' ].
	('Launch Siemens CSV importer on ' , refFile basename) record.
	^ CppCSVImporter runOn: aFolder withRefFile: refFile withModel: model
]

{ #category : #'instance creation' }
CppCSVImporter >> runOn: aSourceFolder withRefFile: aReadStream withModel: aModel [
	self
		execute: [ | parser |
			parser := CppCSVParser new
				optimize;
				model: aModel;
				yourself.

			[ #(#fileLocation #namespace #package #type #classe #enum #function #variable #edge)
				do: [ :symbol | self parse: aReadStream forDeclaration: symbol with: (parser perform: symbol) ] ]
				ensure: [ aReadStream close ].
			parser doReportedOperations.
			(aModel allWithSubTypesOf: CppSourcedEntity) do: [ :entity | entity sourceAnchor ifNil: [ entity isStub ] ].
			self setMethodsModifiersIn: aModel.
			self setMethodsKindsIn: aModel.
			self setUnknowPackageToOrphanTypesIn: aModel ]
		recordedAs: 'Import CPP model'.
	^ aModel
]

{ #category : #'instance creation' }
CppCSVImporter >> setMethodsKindsIn: aModel [
	"With Siemens's parser we do not have the kind informations. To improve user experience we try to find the best suited modifier here."

	self
		execute: [ (aModel allWithSubTypesOf: CppMethod)
				do: [ :method | 
					method parentType name = method name ifTrue: [ method isConstructor: true ].
					method parentType name = ('~' , method name) ifTrue: [ method isDestructor: true ] ] ]
		recordedAs: 'Init kind of methods.'
]

{ #category : #'instance creation' }
CppCSVImporter >> setMethodsModifiersIn: aModel [
	"With this parser we do not have the public/private informations. To improve user experience we try to find the best suited modifier here."

	self
		execute: [ (aModel allWithSubTypesOf: CppMethod) do: [ :method | method addModifier: (method clientTypes ifEmpty: [ #private ] ifNotEmpty: [ #public ]) ] ]
		recordedAs: 'Init modifier of methods'
]

{ #category : #'instance creation' }
CppCSVImporter >> setUnknowPackageToOrphanTypesIn: aModel [
	"To improve user experiance while using the tools, we group potential orphan classes into an unknow package."

	self
		execute: [ | unknowPackage |
			unknowPackage := CppPackage new
				name: 'unknowPackage';
				mooseModel: aModel;
				isStub;
				yourself.
			(aModel allWithSubTypesOf: CppType) do: [ :type | type parentPackage ifNil: [ type parentPackage: unknowPackage ] ] ]
		recordedAs: 'Set unknow package'
]
