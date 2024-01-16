"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentFolder` | `FamixTFolder` | `childrenFileSystemEntities` | Folder entity containing this file.|

### Other
| Relation | Type | Opposite | Comment |
| `entities` | `FamixTWithFiles` | `containerFiles` | List of entities defined in the file|



"
Class {
	#name : #FamixTest1File,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1File class >> annotation [

	<FMClass: #File super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
