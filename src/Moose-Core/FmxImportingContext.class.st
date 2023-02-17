"
basic class for generated importing contexts
"
Class {
	#name : #FmxImportingContext,
	#superclass : #Object,
	#instVars : [
		'importedAssociations',
		'allMetamodelConcreteEntities',
		'allMetamodelAssociations',
		'importedEntities'
	],
	#category : #'Moose-Core-Import'
}

{ #category : #accessing }
FmxImportingContext class >> allMetamodelAssociations [

	^ (self importedMetamodel traits detect: [ :trait | 
		   trait name = #TAssociation ]) classUsers
]

{ #category : #accessing }
FmxImportingContext class >> allMetamodelEntities [

	^ self importedMetamodel classes reject: [ :fm3Class | 
		  (fm3Class inheritsFrom:
			   (self importedMetamodel fmTypeOf: MooseAbstractGroup)) or: [ 
			  fm3Class traits anySatisfy: [ :fm3Trait | 
				  fm3Trait name = #TAssociation ] ] ]
]

{ #category : #accessing }
FmxImportingContext class >> fm3ClassNamed: aName [

	^ self importedMetamodel classes detect: [ :fm3Class | 
		  fm3Class name = aName ]
]

{ #category : #accessing }
FmxImportingContext class >> importedMetamodel [

	^ self subclassResponsibility
]

{ #category : #'importing-remove' }
FmxImportingContext >> doNotImportAssociation: aFM3AssociationClass [

	importedAssociations remove: aFM3AssociationClass ifAbsent: [  ]
]

{ #category : #'importing-remove' }
FmxImportingContext >> doNotImportAssociationsDependingOn: aFM3Class [

	aFM3Class allProperties
		select: [ :prop | 
		importedAssociations includesAny: prop type classUsers ]
		thenDo: [ :prop | 
			prop type classUsers do: [ :fm3Class | 
				self doNotImportAssociation: fm3Class ] ]
]

{ #category : #'importing-remove' }
FmxImportingContext >> doNotImportConcreteEntity: aFM3Class [

	self importedEntities remove: aFM3Class ifAbsent: [ ^ self ].

	self doNotImportEntitiesContainedIn: aFM3Class.
	self doNotImportAssociationsDependingOn: aFM3Class
]

{ #category : #'importing-remove' }
FmxImportingContext >> doNotImportEntitiesContainedIn: aFM3Class [

	aFM3Class allComplexProperties
		select: [ :property | 
			property hasOpposite and: [ property opposite isContainer ] ]
		thenDo: [ :property | 
			property type classUsers do: [ :fm3Class | 
				self doNotImportConcreteEntity: fm3Class ] ]
]

{ #category : #'importing-all' }
FmxImportingContext >> importAllAssociations [

	allMetamodelAssociations do: [ :association | 
		self importAssociation: association ]
]

{ #category : #'importing-all' }
FmxImportingContext >> importAllEntities [

	allMetamodelConcreteEntities do: [ :fm3Class | 
		self importConcreteEntity: fm3Class ]
]

{ #category : #'importing-add' }
FmxImportingContext >> importAssociation: aFM3AssociationClass [

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
FmxImportingContext >> importConcreteEntity: aFM3Class [

	(self importedEntities includes: aFM3Class) ifTrue: [ ^ self ].

	self importedEntities add: aFM3Class.

	aFM3Class allContainerProperties do: [ :containerProperty | 
		containerProperty type classUsers do: [ :fm3Class | 
			self importConcreteEntity: fm3Class ] ]
]

{ #category : #'importing-all' }
FmxImportingContext >> importMaximum [

	self importAllEntities.
	self importAllAssociations
]

{ #category : #'importing-remove' }
FmxImportingContext >> importNone [

	importedAssociations := Set new.
	importedEntities := Set new
]

{ #category : #accessing }
FmxImportingContext >> importedAssociations [

	^ importedAssociations
]

{ #category : #accessing }
FmxImportingContext >> importedEntities [

	^ importedEntities
]

{ #category : #accessing }
FmxImportingContext >> imports [

	^ importedEntities , importedAssociations
]

{ #category : #initialization }
FmxImportingContext >> initialize [

	super initialize.
	importedEntities := Set new.
	importedAssociations := Set new.

	allMetamodelAssociations := self class allMetamodelAssociations.
	allMetamodelConcreteEntities := self class allMetamodelEntities
]

{ #category : #testing }
FmxImportingContext >> shouldImport: aClassName [

	^ (importedEntities includes: aClassName) or: [ 
		  importedAssociations includes: aClassName ]
]
