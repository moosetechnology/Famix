"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `computer` | `FamixTest3Classroom` | `classroom` | `FamixTest3Computer` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingClassSessions` | `FamixTest3TClassroom` | `classroom` | `FamixTest3ClassSession` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `hasProjector` | `Boolean` | false | |

"
Class {
	#name : 'FamixTest3Classroom',
	#superclass : 'FamixTest3Room',
	#traits : 'FamixTest3TClassroom',
	#classTraits : 'FamixTest3TClassroom classTrait',
	#instVars : [
		'#computer => FMOne type: #FamixTest3Computer opposite: #classroom',
		'#hasProjector => FMProperty defaultValue: false'
	],
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3Classroom class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Classroom super: #FamixTest3Room>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest3Classroom >> computer [
	"Relation named: #computer type: #FamixTest3Computer opposite: #classroom"

	<ignoreForCoverage>
	<generated>
	^ computer
]

{ #category : 'accessing' }
FamixTest3Classroom >> computer: anObject [

	<ignoreForCoverage>
	<generated>
	computer := anObject
]

{ #category : 'accessing' }
FamixTest3Classroom >> hasProjector [

	<FMProperty: #hasProjector type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	^ hasProjector ifNil: [ hasProjector := false ]
]

{ #category : 'accessing' }
FamixTest3Classroom >> hasProjector: anObject [
	<ignoreForCoverage>
	<generated>
	hasProjector := anObject
]
