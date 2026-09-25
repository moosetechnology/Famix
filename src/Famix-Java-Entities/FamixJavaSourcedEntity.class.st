"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixJavaSourcedEntity',
	#superclass : 'FamixJavaEntity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaSourcedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourcedEntity super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixJavaSourcedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixJavaSourcedEntity
]

{ #category : 'Famix-SourceAnchor' }
FamixJavaSourcedEntity >> fileAnchorPath: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FamixJavaIndexedFileAnchor
				fileName: aString
				startLine: anInteger
				startColumn: anInteger2
				endLine: anInteger3
				endColumn: anInteger4
				model: self mooseModel)
]

{ #category : 'Famix-SourceAnchor' }
FamixJavaSourcedEntity >> fileAnchorPath: aString startPos: anInteger endPos: anotherInteger [
	"I need to be called after the mooseModel is set."

	self
		sourceAnchor:
			(FamixJavaIndexedFileAnchor
				fileName: aString
				startPos: anInteger
				endPos: anotherInteger
				model: self mooseModel)
]

{ #category : 'Famix-Extensions' }
FamixJavaSourcedEntity >> structuralChildren [ 
	^ #()
]
