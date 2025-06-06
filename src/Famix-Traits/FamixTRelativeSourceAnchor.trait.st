"
Description
--------------------

I am a source anchor storing the sources by pointing another source anchor and defining a subpart of this source as my sourced.

I point another source anchor and define a start and end position in the source text of this source anchor as my anchor.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	endPos:					<anInteger>				Position of the last character of my source in the source text of the relative anchor.
	relatedAnchor:			<aSourceAnchor>			The anchor I'll get my relative sources from.
	startPos:					<anInteger>				Position of the first character of my source in the source text of the relative anchor.


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
| `endPos` | `Number` | nil | Stop position in the source|
| `relatedAnchor` | `FamixTSourceAnchor` | nil | Source anchor to which I am relative.|
| `startPos` | `Number` | nil | Start position in the source|

"
Trait {
	#name : #FamixTRelativeSourceAnchor,
	#instVars : [
		'#relatedAnchor => FMProperty',
		'#startPos => FMProperty',
		'#endPos => FMProperty'
	],
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTRelativeSourceAnchor classSide >> annotation [

	<FMClass: #TRelativeSourceAnchor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTRelativeSourceAnchor >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTRelativeSourceAnchor: self
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> completeText [
	^ self relatedAnchor sourceText
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> endLine [
	^ self
		cacheAt: #endLine
		ifAbsent: [ self ensureStartAndEndLineAreSet.
			self cacheAt: #endLine ifAbsent: [ self error ] ]
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	<FMComment: 'Stop position in the source'>
	^ endPos
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> ensureStartAndEndLineAreSet [
	self initializeStartAndEndLineFrom: self relatedAnchor sourceText
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> fileName [
	^ self relatedAnchor fileName
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> initializeStartAndEndLineFrom: sourceText [
	self cacheAt: #startLine put: (sourceText lineNumberCorrespondingToIndex: self startPos) + (self relatedAnchor startLine ifNil: [ 0 ]).
	self cacheAt: #endLine put: (sourceText lineNumberCorrespondingToIndex: self endPos) + (self relatedAnchor startLine ifNil: [ 0 ])
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> relatedAnchor [

	<FMProperty: #relatedAnchor type: #FamixTSourceAnchor>
	<generated>
	<FMComment: 'Source anchor to which I am relative.'>
	^ relatedAnchor
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> relatedAnchor: anObject [
	<generated>
	relatedAnchor := anObject
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> sourceText [
	^ self relatedAnchor sourceTextFrom: self startPos to: self endPos
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> sourceTextFrom: start to: end [
	^ self relatedAnchor sourceTextFrom: start + self startPos - 1 to: self startPos + end - 1
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> startLine [
	^ self
		cacheAt: #startLine
		ifAbsent: [ self ensureStartAndEndLineAreSet.
			self cacheAt: #startLine ifAbsent: [ self error ] ]
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	<FMComment: 'Start position in the source'>
	^ startPos
]

{ #category : #accessing }
FamixTRelativeSourceAnchor >> startPos: anObject [
	<generated>
	startPos := anObject
]
