"
## Relations
======================

### Association source
- Relation: #subclass Type: #FamixTWithInheritances Opposite: #superInheritances Comment: Subclass linked to in this relationship. from-side of the association
### Association target
- Relation: #superclass Type: #FamixTWithInheritances Opposite: #subInheritances Comment: Superclass linked to in this relationship. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Class {
	#name : #FamixJavaInheritance,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInheritance class >> annotation [

	<FMClass: #Inheritance super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'Moose-Hismo' }
FamixJavaInheritance >> historicalUniqueName [
	
	^(self subclass mooseName , '->' , self superclass mooseName) asSymbol
]

{ #category : #printing }
FamixJavaInheritance >> mooseNameOn: aStream [
	self subclass ifNotNil: [ aStream nextPutAll: self subclass name ].
	aStream nextPutAll: ' -> '.
	self superclass ifNotNil: [ aStream nextPutAll: self superclass name ]
]

{ #category : #printing }
FamixJavaInheritance >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Inheritance)'
]
