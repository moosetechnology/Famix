"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `computer` | `FamixTest4Classroom` | `classroom` | `FamixTest4Computer` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingClassSessions` | `FamixTest4TClassroom` | `classroom` | `FamixTest4ClassSession` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `hasProjector` | `Boolean` | false | |

"
Class {
	#name : 'FamixTest4Classroom',
	#superclass : 'FamixTest4Room',
	#traits : 'FamixTest4TClassroom',
	#classTraits : 'FamixTest4TClassroom classTrait',
	#instVars : [
		'#computer => FMOne type: #FamixTest4Computer opposite: #classroom',
		'#hasProjector => FMProperty defaultValue: false'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4Classroom class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Classroom super: #FamixTest4Room>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest4Classroom >> computer [
	"Relation named: #computer type: #FamixTest4Computer opposite: #classroom"

	<ignoreForCoverage>
	<generated>
	^ computer
]

{ #category : 'accessing' }
FamixTest4Classroom >> computer: anObject [

	<ignoreForCoverage>
	<generated>
	computer := anObject
]

{ #category : 'accessing' }
FamixTest4Classroom >> hasProjector [

	<FMProperty: #hasProjector type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	^ hasProjector ifNil: [ hasProjector := false ]
]

{ #category : 'accessing' }
FamixTest4Classroom >> hasProjector: anObject [
	<ignoreForCoverage>
	<generated>
	hasProjector := anObject
]
