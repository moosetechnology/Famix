"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `teacher` | `FamixTest4ClassSession` | `outgoingClassSessions` | `FamixTest4TTeacher` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `classroom` | `FamixTest4ClassSession` | `incomingClassSessions` | `FamixTest4TClassroom` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixTest4ClassSession',
	#superclass : 'FamixTest4Entity',
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#classroom => FMOne type: #FamixTest4TClassroom opposite: #incomingClassSessions',
		'#teacher => FMOne type: #FamixTest4TTeacher opposite: #outgoingClassSessions'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4ClassSession class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ClassSession super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest4ClassSession >> classroom [
	"Relation named: #classroom type: #FamixTest4TClassroom opposite: #incomingClassSessions"

	<ignoreForCoverage>
	<generated>
	<target>
	^ classroom
]

{ #category : 'accessing' }
FamixTest4ClassSession >> classroom: anObject [

	<ignoreForCoverage>
	<generated>
	classroom := anObject
]

{ #category : 'accessing' }
FamixTest4ClassSession >> teacher [
	"Relation named: #teacher type: #FamixTest4TTeacher opposite: #outgoingClassSessions"

	<ignoreForCoverage>
	<generated>
	<source>
	^ teacher
]

{ #category : 'accessing' }
FamixTest4ClassSession >> teacher: anObject [

	<ignoreForCoverage>
	<generated>
	teacher := anObject
]
