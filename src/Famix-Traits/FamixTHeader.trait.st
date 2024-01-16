"
I represent a header file. Typically a .h or .hpp

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `headerOwner` | `FamixTHeader` | `header` | `FamixTWithHeaders` | |
| `parentFolder` | `FamixTFileSystemEntity` | `childrenFileSystemEntities` | `FamixTFolder` | Folder entity containing this file.|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `entities` | `FamixTFile` | `containerFiles` | `FamixTWithFiles` | List of entities defined in the file|



"
Trait {
	#name : #FamixTHeader,
	#instVars : [
		'#headerOwner => FMOne type: #FamixTWithHeaders opposite: #header'
	],
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Traits-Header'
}

{ #category : #meta }
FamixTHeader classSide >> annotation [

	<FMClass: #THeader super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTHeader >> headerOwner [
	"Relation named: #headerOwner type: #FamixTWithHeaders opposite: #header"

	<generated>
	<container>
	^ headerOwner
]

{ #category : #accessing }
FamixTHeader >> headerOwner: anObject [

	<generated>
	headerOwner := anObject
]

{ #category : #navigation }
FamixTHeader >> headerOwnerGroup [
	<generated>
	<navigation: 'HeaderOwner'>
	^ MooseSpecializedGroup with: self headerOwner
]
