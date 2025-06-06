"
It represents a file in the file system.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentFolder` | `FamixTFileSystemEntity` | `childrenFileSystemEntities` | `FamixTFolder` | Folder entity containing this file.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entities` | `FamixTFile` | `containerFiles` | `FamixTWithFiles` | List of entities defined in the file|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTFile,
	#instVars : [
		'#entities => FMMany type: #FamixTWithFiles opposite: #containerFiles'
	],
	#traits : 'FamixTFileSystemEntity',
	#classTraits : 'FamixTFileSystemEntity classTrait',
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTFile classSide >> annotation [

	<FMClass: #TFile super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTFile classSide >> annotationFamixFileGroup [
	<generated>
	<mooseGroup>
	^ FamixFileGroup
]

{ #category : #visitor }
FamixTFile >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTFile: self
]

{ #category : #accessing }
FamixTFile >> addEntity: famixEntity [
	self entities add: famixEntity
]

{ #category : #accessing }
FamixTFile >> averageNumberOfCharactersPerLine [
	<FMProperty: #averageNumberOfCharactersPerLine type: #Number>
	<FMComment: 'Average number of characters per line of text in a file.'>
	<derived>
	^ self
		lookUpPropertyNamed: #averageNumberOfCharactersPerLine
		computedAs: [ self numberOfLinesOfText isZero
			ifFalse: [ (self numberOfCharacters / self numberOfLinesOfText) asFloat ]
			ifTrue: [ 0 ] ]
]

{ #category : #accessing }
FamixTFile >> entities [
	"Relation named: #entities type: #FamixTWithFiles opposite: #containerFiles"

	<generated>
	<FMComment: 'List of entities defined in the file'>
	<derived>
	^ entities
]

{ #category : #accessing }
FamixTFile >> entities: anObject [

	<generated>
	entities value: anObject
]

{ #category : #accessing }
FamixTFile >> entitiesGroup [
	<navigation: 'Entities'>
	
	^ MooseGroup withAll: self entities withDescription: 'Entities defined in a file'
]

{ #category : #testing }
FamixTFile >> exists [
	^ self fileExists 
]

{ #category : #testing }
FamixTFile >> fileExists [
	self name ifNil: [ ^ false ].
	^ self fileReference exists
]

{ #category : #testing }
FamixTFile >> ifFileExistsDo: aBlock [
	self name ifNil: [ ^ aBlock value ].
	^ self fileExists ifTrue: [ aBlock value ]
]

{ #category : #properties }
FamixTFile >> numberOfBytes [
	<FMProperty: #numberOfBytes type: #Number>
	<FMComment: 'Number of bytes in a file.'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfBytes
		computedAs: [ self fileExists
				ifTrue: [ self fileReference size ]
				ifFalse: [ 0 ] ]
]

{ #category : #properties }
FamixTFile >> numberOfCharacters [
	<FMProperty: #numberOfCharacters type: #Number>
	<FMComment: 'Number of characters in a file.'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfCharacters computedAs: [ self sourceText size ]
]

{ #category : #properties }
FamixTFile >> numberOfEmptyLinesOfText [
	<FMProperty: #numberOfEmptyLinesOfText type: #Number>
	<FMComment: 'Number of empty lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfEmptyLinesOfText
		computedAs: [ self fileExists
				ifTrue: [ (self sourceText lines select: #isEmpty) size ]
				ifFalse: [ 0 ] ]
]

{ #category : #properties }
FamixTFile >> numberOfKiloBytes [
	<FMProperty: #numberOfKiloBytes type: #Number>
	<FMComment: 'Number of kilo bytes in a file.'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfKiloBytes computedAs: [ (self numberOfBytes / 1024) asFloat ]
]

{ #category : #properties }
FamixTFile >> readStream [
	^ self fileReference readStream
]

{ #category : #accessing }
FamixTFile >> sourceText [
	^ self
		lookUpPropertyNamed: #sourceText
		computedAs: [ self fileExists
				ifTrue: [ self fileReference contents ]
				ifFalse: [ '' ] ]
]

{ #category : #accessing }
FamixTFile >> sourceText: aString [
	^ self propertyNamed: #sourceText put: aString
]

{ #category : #properties }
FamixTFile >> totalNumberOfLinesOfText [
	<FMProperty: #totalNumberOfLinesOfText type: #Number>
	<FMComment: 'Number of lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #totalNumberOfLinesOfText
		computedAs: [ self sourceText
				ifEmpty: [ (self name isNotNil and: [ self exists ])
						ifTrue: [ (self sourceText select: [ :each | each = Character cr ]) size + 1 ]
						ifFalse: [ 0 ] ]
				ifNotEmpty: [ self sourceText lineCount ] ]
]
