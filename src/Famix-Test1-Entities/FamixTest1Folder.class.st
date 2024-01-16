"
## Relations
======================

### Parents
- Relation: #parentFolder Type: #FamixTFolder Opposite: #childrenFileSystemEntities Comment: Folder entity containing this file.
### Children
- Relation: #childrenFileSystemEntities Type: #FamixTFileSystemEntity Opposite: #parentFolder Comment: List of entities contained in this folder.


"
Class {
	#name : #FamixTest1Folder,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Folder class >> annotation [

	<FMClass: #Folder super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
