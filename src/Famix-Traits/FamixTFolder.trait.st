"
It represents a folder in the file system. It can contain other files or folders.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFolder` | `FamixTFileSystemEntity` | `childrenFileSystemEntities` | `FamixTFolder` | Folder entity containing this file.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `childrenFileSystemEntities` | `FamixTFolder` | `parentFolder` | `FamixTFileSystemEntity` | List of entities contained in this folder.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTFolder,
	#instVars : [
		'#childrenFileSystemEntities => FMMany type: #FamixTFileSystemEntity opposite: #parentFolder'
	],
	#traits : 'FamixTFileSystemEntity',
	#classTraits : 'FamixTFileSystemEntity classTrait',
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTFolder classSide >> annotation [

	<FMClass: #TFolder super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTFolder classSide >> annotationFamixFolderGroup [
	<generated>
	<mooseGroup>
	^ FamixFolderGroup
]

{ #category : #visitor }
FamixTFolder >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTFolder: self
]

{ #category : #adding }
FamixTFolder >> addChildFileSystemEntity: aFileOrFolder [
	self childrenFileSystemEntities add: aFileOrFolder
]

{ #category : #adding }
FamixTFolder >> addChildrenFileSystemEntity: anObject [
	<generated>
	^ self childrenFileSystemEntities add: anObject
]

{ #category : #properties }
FamixTFolder >> allRecursiveFiles [
	| result |
	result := MooseGroup withAll: self files withDescription: 'All recursive files in ', self mooseName.
	self folders do: [:each | result := result addAll: each allRecursiveFiles].
	^result.
]

{ #category : #properties }
FamixTFolder >> allRecursiveFolders [
	| result |
	result := MooseGroup withAll: self folders withDescription: 'All recursive folders in ', self mooseName.
	self folders do: [:each | result := result addAll: each allRecursiveFolders].
	^result.
]

{ #category : #accessing }
FamixTFolder >> childrenFileSystemEntities [
	"Relation named: #childrenFileSystemEntities type: #FamixTFileSystemEntity opposite: #parentFolder"

	<generated>
	<FMComment: 'List of entities contained in this folder.'>
	<derived>
	^ childrenFileSystemEntities
]

{ #category : #accessing }
FamixTFolder >> childrenFileSystemEntities: anObject [

	<generated>
	childrenFileSystemEntities value: anObject
]

{ #category : #adding }
FamixTFolder >> files [
	^ self childrenFileSystemEntities reject: #isFolder
]

{ #category : #adding }
FamixTFolder >> filesGroup [
	<navigation: 'Files'>
	^FamixFileGroup withAll: self files withDescription: 'Files'
]

{ #category : #adding }
FamixTFolder >> folders [
	^ self childrenFileSystemEntities select: #isFolder
]

{ #category : #adding }
FamixTFolder >> foldersGroup [
	<navigation: 'Folders'>
	^FamixFolderGroup withAll: self folders withDescription: 'Folders'
]

{ #category : #testing }
FamixTFolder >> isFolder [
	^ true
]

{ #category : #properties }
FamixTFolder >> numberOfEmptyLinesOfText [
	<FMProperty: #numberOfEmptyLinesOfText type: #Number>
	<FMComment: 'Number of empty lines of text'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfEmptyLinesOfText computedAs: [ 
		self files, self folders sumNumbers: #numberOfEmptyLinesOfText
	]
]

{ #category : #properties }
FamixTFolder >> numberOfFiles [
	<FMProperty: #numberOfFiles type: #Number>
	<FMComment: 'The number of files in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFiles
		computedAs: [self files size]
]

{ #category : #properties }
FamixTFolder >> numberOfFolders [
	<FMProperty: #numberOfFolders type: #Number>
	<FMComment: 'The number of folders in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFolders
		computedAs: [self folders size]
]

{ #category : #properties }
FamixTFolder >> totalNumberOfLinesOfText [
	<FMProperty: #totalNumberOfLinesOfText type: #Number>
	<FMComment: 'Number of lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #totalNumberOfLinesOfText
		computedAs: [ self files , self folders sumNumbers: #totalNumberOfLinesOfText ]
]

{ #category : #properties }
FamixTFolder >> withAllRecursiveFolders [
	| result |
	result := MooseGroup with: self withDescription: 'All recursive folders in ', self mooseName.
	result addAll: self folders.
	self folders do: [:each | result := result addAll: each allRecursiveFolders].
	^result.
]
