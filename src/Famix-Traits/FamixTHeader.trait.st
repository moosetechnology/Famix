"
I represent a header file. Typically a .h or .hpp

## Relations
======================

### Parents
- Relation: #parentFolder Type: #FamixTFolder Opposite: #childrenFileSystemEntities Comment: Folder entity containing this file.
- Relation: #headerOwner Type: #FamixTWithHeaders Opposite: #header
### Other
- Relation: #entities Type: #FamixTWithFiles Opposite: #containerFiles Comment: List of entities defined in the file


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
