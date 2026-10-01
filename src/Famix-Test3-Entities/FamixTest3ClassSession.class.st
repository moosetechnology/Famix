"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `teacher` | `FamixTest3ClassSession` | `outgoingClassSessions` | `FamixTest3TTeacher` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `classroom` | `FamixTest3ClassSession` | `incomingClassSessions` | `FamixTest3TClassroom` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : #FamixTest3ClassSession,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#classroom => FMOne type: #FamixTest3TClassroom opposite: #incomingClassSessions',
		'#teacher => FMOne type: #FamixTest3TTeacher opposite: #outgoingClassSessions'
	],
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3ClassSession class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ClassSession super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #accessing }
FamixTest3ClassSession >> classroom [
	"Relation named: #classroom type: #FamixTest3TClassroom opposite: #incomingClassSessions"

	<ignoreForCoverage>
	<generated>
	<target>
	^ classroom
]

{ #category : #accessing }
FamixTest3ClassSession >> classroom: anObject [

	<ignoreForCoverage>
	<generated>
	classroom := anObject
]

{ #category : #accessing }
FamixTest3ClassSession >> teacher [
	"Relation named: #teacher type: #FamixTest3TTeacher opposite: #outgoingClassSessions"

	<ignoreForCoverage>
	<generated>
	<source>
	^ teacher
]

{ #category : #accessing }
FamixTest3ClassSession >> teacher: anObject [

	<ignoreForCoverage>
	<generated>
	teacher := anObject
]
