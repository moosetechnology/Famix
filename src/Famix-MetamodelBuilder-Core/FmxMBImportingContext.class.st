Class {
	#name : #FmxMBImportingContext,
	#superclass : #FmxMBBehavior,
	#instVars : [
		'classGeneralization'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visiting }
FmxMBImportingContext >> acceptVisitor: aVisitor [

	^ aVisitor visitImportingContext: self
]

{ #category : #accessing }
FmxMBImportingContext >> classGeneralization [

	^ self builder environment basicImportingContextSuperclass
]

{ #category : #accessing }
FmxMBImportingContext >> classGeneralization: anObject [

	classGeneralization := anObject
]

{ #category : #'settings - default' }
FmxMBImportingContext >> defaultSuperclass [

	^ self builder environment basicImportingContextSuperclass
]

{ #category : #generating }
FmxMBImportingContext >> generate [

	| aClass superclass |
	self willGenerate ifFalse: [ ^ self ].

	superclass := self classGeneralization
		              ifNil: [ self defaultSuperclass ]
		              ifNotNil: [ self classGeneralization ].

	aClass := self builder environment
		          createClassNamed: self fullName asSymbol
		          superclass: superclass
		          traitNames: self allTraitNames
		          slots: self slotDefinitions
		          in: self packageName
		          overwrite: true.

	aClass tagWith: self tag.

	self builder environment setComment: self comment for: aClass.

	self realClass: aClass.

	self generateMethodsIn: aClass
]

{ #category : #'generating-methods' }
FmxMBImportingContext >> generateImportAssociation: aFmxMBAssociationClass in: aClass [

	aClass
		compile: ('import{1}

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #{1})' format:
				 { aFmxMBAssociationClass name })
		classified: 'importing'
]

{ #category : #'generating-methods' }
FmxMBImportingContext >> generateImportConcreteEntity: aFmxMBClass in: aClass [

	aClass
		compile: ('import{1}

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #{1})' 
				 format: { aFmxMBClass name })
		classified: 'importing'
]

{ #category : #'generating-methods' }
FmxMBImportingContext >> generateImportIn: aClass [

	self builder classes do: [ :each | 
		"No need to generate methods for model and groups."
		(each isModelClass or: [ 
			 each isMetamodelClassGroup "or: [ each isAbstractClass ] "]) ifFalse: [ 
			
			"Associations and other entities are managed differently by the importing context"
			each allTransitiveTraits
				detect: [ :trait | trait name = #TAssociation ]
				ifFound: [ self generateImportAssociation: each in: aClass ]
				ifNone: [ self generateImportConcreteEntity: each in: aClass ] ] ]
]

{ #category : #'generating-methods' }
FmxMBImportingContext >> generateImportingContextMetamodelIn: aClass [

	aClass classSide
		compile: ('importedMetamodel

	<generated>
	^ {1}Model metamodel' format: { self prefix })
		classified: 'accessing'
]

{ #category : #generating }
FmxMBImportingContext >> generateMethodsIn: aClass [

	self generateImportingContextMetamodelIn: aClass.
	self generateShouldImportIn: aClass.
	self generateImportIn: aClass
]

{ #category : #'generating-methods' }
FmxMBImportingContext >> generateShouldImportIn: aClass [

	self builder classes do: [ :each | 
		"No need to generate methods for model and groups."
		(each isModelClass or: [ 
			 each isMetamodelClassGroup "or: [ each isAbstractClass ] "]) ifFalse: [ 
			aClass
				compile: ('shouldImport{1}

	<generated>
	^ self shouldImport: #{1}' format: { each name })
				classified: 'testing' ] ]
]

{ #category : #accessing }
FmxMBImportingContext >> name [

	^ 'ImportingContext'
]
