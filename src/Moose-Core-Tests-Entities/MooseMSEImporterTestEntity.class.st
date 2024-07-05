Class {
	#name : #MooseMSEImporterTestEntity,
	#superclass : #MooseEntity,
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
MooseMSEImporterTestEntity class >> isAbstract [

	<generated>
	^ self == MooseMSEImporterTestEntity
]

{ #category : #meta }
MooseMSEImporterTestEntity class >> metamodel [

	<generated>
	^ MooseMSEImporterTestModel metamodel
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
MooseMSEImporterTestEntity >> isType [

	<generated>
	^ false
]
