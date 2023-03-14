"
basic class for generated importing contexts
"
Class {
	#name : #FamixImportingContext,
	#superclass : #Object,
	#instVars : [
		'importedAssociations',
		'importedEntities'
	],
	#category : #'Moose-Core-Import'
}

{ #category : #accessing }
FamixImportingContext class >> allMetamodelAssociations [

	^ (self importedMetamodel traits detect: [ :trait | 
		   trait name = #TAssociation ]) classUsers
]

{ #category : #accessing }
FamixImportingContext class >> allMetamodelConcreteEntities [

	^ self importedMetamodel classes reject: [ :fm3Class | 
		  fm3Class isAbstract or: [ 
			  (fm3Class inheritsFrom:
				   (self importedMetamodel fmTypeOf: MooseAbstractGroup)) or: [ 
				  fm3Class traits anySatisfy: [ :fm3Trait | 
					  fm3Trait name = #TAssociation ] ] ] ]
]

{ #category : #accessing }
FamixImportingContext class >> fm3ClassNamed: aName [

	^ self importedMetamodel classes detect: [ :fm3Class | 
		  fm3Class name = aName ]
]

{ #category : #accessing }
FamixImportingContext class >> importedMetamodel [

	^ self subclassResponsibility
]

{ #category : #'importing-remove' }
FamixImportingContext >> doNotImportAssociation: aFM3AssociationClass [

	importedAssociations remove: aFM3AssociationClass ifAbsent: [  ]
]

{ #category : #'importing-remove' }
FamixImportingContext >> doNotImportAssociationsDependingOn: aFM3Class [

	aFM3Class allProperties
		select: [ :prop | 
		importedAssociations includesAny: prop type classUsers ]
		thenDo: [ :prop | 
			prop type classUsers do: [ :fm3Class | 
				self doNotImportAssociation: fm3Class ] ]
]

{ #category : #'importing-remove' }
FamixImportingContext >> doNotImportConcreteEntity: aFM3Class [

	self importedEntities remove: aFM3Class ifAbsent: [ ^ self ].

	self doNotImportEntitiesContainedIn: aFM3Class.
	self doNotImportAssociationsDependingOn: aFM3Class
]

{ #category : #'importing-remove' }
FamixImportingContext >> doNotImportEntitiesContainedIn: aFM3Class [

	aFM3Class allComplexProperties
		select: [ :property | 
			property hasOpposite and: [ property opposite isContainer ] ]
		thenDo: [ :property | 
			property type classUsers do: [ :fm3Class | 
				self doNotImportConcreteEntity: fm3Class ] ]
]

{ #category : #'importing-all' }
FamixImportingContext >> importAllAssociations [

	self class allMetamodelAssociations do: [ :association | 
		self importAssociation: association ]
]

{ #category : #'importing-all' }
FamixImportingContext >> importAllEntities [

	self class allMetamodelConcreteEntities do: [ :fm3Class | 
		self importConcreteEntity: fm3Class ]
]

{ #category : #'importing-add' }
FamixImportingContext >> importAssociation: aFM3AssociationClass [

	(importedAssociations includes: aFM3AssociationClass) ifTrue: [ 
		^ self ].

	importedAssociations add: aFM3AssociationClass.

	aFM3AssociationClass allComplexProperties
		select: [ :property | property isSource or: [ property isTarget ] ]
		thenDo: [ :property | 
			property type classUsers do: [ :fm3Class | 
				self importConcreteEntity: fm3Class ] ]
]

{ #category : #'importing-add' }
FamixImportingContext >> importConcreteEntity: aFM3Class [

	((self importedEntities includes: aFM3Class) or: [ 
		 aFM3Class isAbstract ]) ifTrue: [ ^ self ].

	self importedEntities add: aFM3Class.

	aFM3Class allContainerProperties do: [ :containerProperty | 
		containerProperty type classUsers do: [ :fm3Class | 
			self importConcreteEntity: fm3Class ] ]
]

{ #category : #'importing-all' }
FamixImportingContext >> importMaximum [

	self importAllEntities.
	self importAllAssociations
]

{ #category : #'importing-remove' }
FamixImportingContext >> importNone [

	importedAssociations := Set new.
	importedEntities := Set new
]

{ #category : #accessing }
FamixImportingContext >> importedAssociations [

	^ importedAssociations
]

{ #category : #accessing }
FamixImportingContext >> importedEntities [

	^ importedEntities
]

{ #category : #accessing }
FamixImportingContext >> imports [

	^ importedEntities , importedAssociations
]

{ #category : #initialization }
FamixImportingContext >> initialize [

	super initialize.
	importedEntities := Set new.
	importedAssociations := Set new
]

{ #category : #testing }
FamixImportingContext >> shouldImport: aClassName [

	^ (importedEntities includes: aClassName) or: [ 
		  importedAssociations includes: aClassName ]
]
