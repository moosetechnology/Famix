"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `fileAnchors` | `FamixTFileAnchor` | nil | All source code definition files|

"
Trait {
	#name : #FamixTMultipleFileAnchor,
	#instVars : [
		'#fileAnchors => FMProperty'
	],
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTMultipleFileAnchor classSide >> annotation [

	<FMClass: #TMultipleFileAnchor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTMultipleFileAnchor >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTMultipleFileAnchor: self
]

{ #category : #adding }
FamixTMultipleFileAnchor >> addFileAnchorWithPath: aPath [
	self fileAnchors
		detect: [ :each | each fileName = aPath ]
		ifNone: [ self createAnchorWithPath: aPath ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> addSourceAnchor: aSourceAnchor [
	self fileAnchors add: aSourceAnchor
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> addToFile: entity [
	^ self fileAnchors do: [ :each | each addToFile: entity ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> allSourceAnchors [
	^ self fileAnchors
]

{ #category : #enumerating }
FamixTMultipleFileAnchor >> allSourceAnchorsDo: aBlock [
	^ self allSourceAnchors do: [ :sa | sa allSourceAnchorsDo: aBlock ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> containerFiles [
	^ self
		propertyNamed: #containerFiles
		ifAbsentPut: [ self fileAnchors collect: #correspondingFile thenReject: #isNil ]
]

{ #category : #adding }
FamixTMultipleFileAnchor >> createAnchorWithPath: aPath [
	self
		addSourceAnchor:
			(self fileAnchorClass new
				fileName: aPath;
				mooseModel: self mooseModel;
				yourself)
]

{ #category : #adding }
FamixTMultipleFileAnchor >> fileAnchorClass [
	^ self mooseModel
		ifNil: [ self error: 'The model need to be set for this feature to work.' ]
		ifNotNil: [ :model | 
			model factory
				entityNamed: #FileAnchor
				ifAbsent: [ self error: 'This metamodel does not includes the full concept of file anchor needed.' ] ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> fileAnchors [
	<FMProperty: #fileAnchors type: #FamixTFileAnchor>
	<multivalued>
	<FMComment: 'All source code definition files'>
	^ fileAnchors ifNil: [ fileAnchors := OrderedCollection new ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> fileAnchors: anObject [
	<generated>
	fileAnchors := anObject
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> fileName [
	"for compatibility with FAMIXFileAnchor, guard condition not needed: it has atleast one file anchor"

	^ self fileAnchors anyOne fileName
]

{ #category : #testing }
FamixTMultipleFileAnchor >> hasSource [
	^ self fileAnchors anySatisfy: #hasSource
]

{ #category : #testing }
FamixTMultipleFileAnchor >> isMultiple [
	^ true
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> lineCount [
	^ self fileAnchors
		ifEmpty: [ self notExistentMetricValue ]
		ifNotEmpty: [ :files | files sum: #lineCount ]
]

{ #category : #private }
FamixTMultipleFileAnchor >> multipleFilesSourceSeparator: aFileAnchor [
	^String streamContents: [ :stream |
		stream
			cr ;
			<< ' ~~~ ~~~ ~~~ ~~~ ' ;
			<< aFileAnchor fileName ;
			<< ' ~~~ ~~~ ~~~ ~~~ ' ;
			cr ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> sourceText [
	^self fileAnchors size > 1
	ifFalse: [ self fileAnchors anyOne sourceText ]
	ifTrue: [
		String streamContents: [ :s | 
			self fileAnchors
			do: [ :file | 
				s
					<< (self multipleFilesSourceSeparator: file) ;
					<< file sourceText ] ] ]
]
