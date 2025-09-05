"
I am a class that will take as input a collection of folders containing java code and I'll parse the projects with VerveineJ and import the resulting models.

For VerveineJ, for now I can get it in two way:
- Through a setting to target an existing VerveineJ jar
- By downloading the latest version of VerveineJ jar

This is brittle because the version of VerveineJ might not be compatible with the famix version currently in the image. We should think of a way to improve this.

In order to use me you can do:

```st

FamixJavaFoldersImporter importFolder: aFileReference.

""or""

FamixFolderJavaImporter importAndInstallFolder: aFileReference
```

In the future it might be nice to add ways to import projects of other languages.
"
Class {
	#name : 'FamixJavaFoldersImporter',
	#superclass : 'Object',
	#instVars : [
		'folders',
		'models'
	],
	#classVars : [
		'VerveineJJar'
	],
	#category : 'Moose-Importers-ParseFolders',
	#package : 'Moose-Importers',
	#tag : 'ParseFolders'
}

{ #category : 'actions' }
FamixJavaFoldersImporter class >> importAndInstallFolder: aFileReference [

	^ self importAndInstallFolders: { aFileReference }
]

{ #category : 'actions' }
FamixJavaFoldersImporter class >> importAndInstallFolders: aCollection [
	"I'll parse, import in a moose model and install the models  for each folder in the collection."

	^ self new
		  folders: aCollection;
		  importAndInstall
]

{ #category : 'actions' }
FamixJavaFoldersImporter class >> importFolder: aFolder [

	^ self importFolders: { aFolder }
]

{ #category : 'actions' }
FamixJavaFoldersImporter class >> importFolders: aCollection [
	"I'll parse and import in a moose model for each folder in the collection."

	^ self new
		  folders: aCollection;
		  import
]

{ #category : 'settings' }
FamixJavaFoldersImporter class >> importSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder setting: #verveineJJarPath)
		parent: #moose;
		type: #FilePathEncoder;
		default: self verveineJJarPath;
		label: 'VerveineJ jar path for FamixJavaFolderImporter';
		description: 'If you wish to use your own version of verveineJ through FamixJavaFolderImporter you can specify your own path to it..';
		target: self
]

{ #category : 'class initialization' }
FamixJavaFoldersImporter class >> reset [

	<script>
	VerveineJJar := nil
]

{ #category : 'accessing' }
FamixJavaFoldersImporter class >> verveineJJar [

	^ VerveineJJar
]

{ #category : 'accessing' }
FamixJavaFoldersImporter class >> verveineJJar: aFile [

	VerveineJJar := aFile
]

{ #category : 'accessing' }
FamixJavaFoldersImporter class >> verveineJJarPath [
	"We check that the path exists because the loading of the settings are setting it in the CI and we end up with a folder that is not the right one :("

	^ (VerveineJJar isNotNil and: [ VerveineJJar exists ])
		  ifTrue: [ VerveineJJar pathString ]
		  ifFalse: [ '' ]
]

{ #category : 'accessing' }
FamixJavaFoldersImporter class >> verveineJJarPath: anObject [

	anObject asFileReference
		ifExists: [ :file |
				file extension = 'jar' ifFalse: [ ^ self inform: 'Only a jar should be passed as argument.' ].
				VerveineJJar := file ]
		ifAbsent: [ ^ self inform: 'The file does not exist' ]
]

{ #category : 'initialization' }
FamixJavaFoldersImporter >> ensureVerveineJ [

	| json asset downloadUrl |
	self shouldDownloadVerveineJ ifFalse: [ ^ self ].

	json := ZnClient new
		        url: 'https://api.github.com/repos/moosetechnology/VerveineJ/releases/latest';
		        accept: ZnMimeType applicationJson;
		        get;
		        contents.

	asset := ((NeoJSONReader fromString: json) at: #assets ifAbsent: [ self error: 'No asset present in the received JSON:' , json ])
		         detect: [ :each | (each at: #name) beginsWith: 'VerveineJ-' ]
		         ifNone: [ self error: 'No asset named VerveineJ present in the received JSON:' , json ].

	downloadUrl := asset at: #browser_download_url.
	(FileLocator workingDirectory / (asset at: #name)) ensureDelete.
	ZnClient new
		url: downloadUrl;
		downloadTo: FileLocator workingDirectory;
		close.

	self class verveineJJar: (FileLocator workingDirectory / (asset at: #name)) asFileReference.

	self shouldDownloadVerveineJ ifTrue: [ self error: 'Cannot download verveineJ.' ]
]

{ #category : 'accessing' }
FamixJavaFoldersImporter >> folders [

	^ folders
]

{ #category : 'accessing' }
FamixJavaFoldersImporter >> folders: anObject [

	folders := anObject
]

{ #category : 'actions' }
FamixJavaFoldersImporter >> generateJsonOfProjects [

	folders
		do: [ :folder |
			LibC runCommand: ('java -jar {1} -o {2} -format json {3}' format: {
						 self verveineJJar pathString asComment.
						 (self jsonForFolder: folder).
						 folder pathString asComment }) ]
		displayingProgress: [ :folder | folder pathString ]
]

{ #category : 'actions' }
FamixJavaFoldersImporter >> import [

	self ensureVerveineJ.

	self generateJsonOfProjects.

	self importModels.

	^ models
]

{ #category : 'actions' }
FamixJavaFoldersImporter >> importAndInstall [

	self import.

	self installModels.

	^ models
]

{ #category : 'actions' }
FamixJavaFoldersImporter >> importModels [

	folders
		do: [ :folder |
			| json importer model |
			json := (self jsonForFolder: folder) asFileReference.
			importer := FamixAbstractFileImporter importerFor: json.

			model := (importer findPossibleModelClassIn: MooseModel possibleModelsToImportFromFiles forFile: json) new.

			importer new
				model: model;
				inputFile: json;
				run.

			model name: folder basename.
			models add: model ]
		displayingProgress: [ :folder | folder basename ]
]

{ #category : 'initialization' }
FamixJavaFoldersImporter >> initialize [

	super initialize.
	models := OrderedCollection new
]

{ #category : 'actions' }
FamixJavaFoldersImporter >> installModels [

	models do: [ :model | model install ]
]

{ #category : 'actions' }
FamixJavaFoldersImporter >> jsonForFolder: folder [

	^ folder basename , '.json'
]

{ #category : 'testing' }
FamixJavaFoldersImporter >> shouldDownloadVerveineJ [

	self verveineJJar ifNil: [ ^ true ].

	self verveineJJar ifAbsent: [ ^ true ].

	^ self verveineJJar extension ~= 'jar'
]

{ #category : 'accessing' }
FamixJavaFoldersImporter >> verveineJJar [

	^ self class verveineJJar
]
