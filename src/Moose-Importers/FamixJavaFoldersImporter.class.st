"
I am a class that will take as input a collection of folders containing java code and I'll parse the projects with VerveineJ and import the resulting models.

For VerveineJ, for now I can get it in two way:
- Through a setting to target an existing VerveineJ folder
- By downloading the latest version of VerveineJ

This is brittle because the version of VerveineJ might not be compatible with the famix version currently in the image. We should think of a way to improve this.

In order to use me you can do:

```st

FamixJavaFoldersImporter importFolder: aFileReference.

""or""

FamixFolderJavaImporter importFolder: aFileReference
```

In the future it might be nice to add ways to import projects of other languages.
"
Class {
	#name : #FamixJavaFoldersImporter,
	#superclass : #Object,
	#instVars : [
		'folders'
	],
	#classVars : [
		'VerveineJPath'
	],
	#category : #'Moose-Importers'
}

{ #category : #accessing }
FamixJavaFoldersImporter class >> defaultVerveineJDirectory [

	^ FileSystem workingDirectory / 'VerveineJ'
]

{ #category : #actions }
FamixJavaFoldersImporter class >> importFolder: aFileReference [

	^ self importFolders: { aFileReference }
]

{ #category : #actions }
FamixJavaFoldersImporter class >> importFolders: aCollection [

	^ self new
		  folders: aCollection;
		  import
]

{ #category : #settings }
FamixJavaFoldersImporter class >> importSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder setting: #verveineJPath)
		parent: #moose;
		type: #FilePathEncoder;
		default: self verveineJPath;
		label: 'VerveineJ path for FamixJavaFolderImporter';
		description: 'If you wish to use your own version of verveineJ through FamixJavaFolderImporter you can specify your own path to it..';
		target: self
]

{ #category : #accessing }
FamixJavaFoldersImporter class >> verveineJPath [

	^ VerveineJPath ifNil: [ VerveineJPath := self defaultVerveineJDirectory ]
]

{ #category : #accessing }
FamixJavaFoldersImporter class >> verveineJPath: anObject [

	VerveineJPath := anObject
]

{ #category : #initialization }
FamixJavaFoldersImporter >> ensureVerveineJ [

	self verveineJScript ifAbsent: [
		"For now we take the latest VerveineJ. Probably we could have a better way to download VerveinJ by selecting a version that is compatible with the current Famix. But I don't know how to do that for now."
		IceGitClone new
			location: self verveineJPath;
			url: 'https://github.com/moosetechnology/VerveineJ.git';
			execute.

		self verveineJScript ifAbsent: [ self error: 'Cannot download verveineJ.' ] ]
]

{ #category : #accessing }
FamixJavaFoldersImporter >> folders [

	^ folders
]

{ #category : #accessing }
FamixJavaFoldersImporter >> folders: anObject [

	folders := anObject
]

{ #category : #actions }
FamixJavaFoldersImporter >> generateJsonOfProjects [

	folders
		do: [ :folder |
			LibC runCommand: ('{1} -o {2} -format json {3}' format: {
						 self verveineJScript pathString asComment.
						 (self jsonForFolder: folder).
						 folder pathString asComment }) ]
		displayingProgress: [ :folder | folder pathString ]
]

{ #category : #actions }
FamixJavaFoldersImporter >> import [

	self ensureVerveineJ.

	self generateJsonOfProjects.

	self importModels
]

{ #category : #actions }
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

			model
				name: folder basename;
				install ]
		displayingProgress: [ :folder | folder basename ]
]

{ #category : #actions }
FamixJavaFoldersImporter >> jsonForFolder: folder [

	^ folder basename , '.json'
]

{ #category : #accessing }
FamixJavaFoldersImporter >> verveineJPath [

	^ self class verveineJPath
]

{ #category : #accessing }
FamixJavaFoldersImporter >> verveineJScript [
	"Manage windows later?"

	^ self verveineJPath / 'verveinej.sh'
]
