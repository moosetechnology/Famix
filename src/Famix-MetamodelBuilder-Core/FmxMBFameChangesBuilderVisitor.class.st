"
I reconcile Pharo code with a Fame metamodel. Structural changes come from FM3 elements; Famix support methods are supplied as generation metadata. I do not need the original DSL builder.
"
Class {
	#name : 'FmxMBFameChangesBuilderVisitor',
	#superclass : 'FmxMBChangesBuilderVisitor',
	#instVars : [
		'metamodel'
	],
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'generation' }
FmxMBFameChangesBuilderVisitor >> buildChangesFor: aMetamodel [

	FMMetamodelValidator for: aMetamodel.
	metamodel := aMetamodel.
	changesToApply addAll: (metamodel additionalProperty: #famixAdditionalChanges for: metamodel).
	self ensurePackageNamed: self generatedPackageName.
	(metamodel additionalProperty: #famixGeneratedTypes for: metamodel) do: [ :type | type accept: self ].
	metamodel properties
		select: [ :property |
		property famixIsGenerated and: [ property isRemote and: [ property package name = self generatedPackageName ] ] ]
		thenDo: [ :property | self generateProperty: property ].
	self registerRemovals
]

{ #category : 'generation' }
FmxMBFameChangesBuilderVisitor >> generateAddToCollectionFor: aProperty [

	| source protocol |
	source := self methodFactory addToCollectionFor: aProperty name.
	protocol := #adding.
	aProperty isRemote ifTrue: [
			protocol := '*' , aProperty package name.
			source := source copyReplaceAll: '<generated>' with: ('<generated>
	<package: {1}>' format: { aProperty package name printString }) ].
	self addMethod: source in: aProperty owner famixImplementationName protocol: protocol
]

{ #category : 'generation' }
FmxMBFameChangesBuilderVisitor >> generateAnnotationFor: aType [

	self
		addMethod: (self methodFactory
				 annotationFor: aType name
				 super: (aType isFM3Trait
						  ifTrue: [ #Object ]
						  ifFalse: [ aType superclass famixImplementationName ])
				 package: aType package name printString
				 isAbstract: (aType isFM3Trait not and: [ aType isAbstract ]))
		in: aType famixImplementationName
		classSide: true
		protocol: #meta
]

{ #category : 'generation' }
FmxMBFameChangesBuilderVisitor >> generatePropertiesFor: aType [

	aType properties
		select: [ :property | property famixIsGenerated and: [ property isRemote not ] ]
		thenDo: [ :property | self generateProperty: property ]
]

{ #category : 'generation' }
FmxMBFameChangesBuilderVisitor >> generateProperty: aProperty [

	| protocol strategy getter setter |
	aProperty implementingSelector: aProperty name.
	protocol := aProperty isRemote
		            ifTrue: [ '*' , aProperty package name ]
		            ifFalse: [ #accessing ].
	aProperty famixOpposite
		ifNil: [
				getter := self methodFactory getTypedProperty: aProperty.
				setter := self methodFactory setTypedProperty: aProperty name remote: aProperty isRemote ]
		ifNotNil: [
				strategy := (aProperty producesSlot
					             ifTrue: [ FmxMBRelationSlotsGenerationStrategy ]
					             ifFalse: [ FmxMBRelationAttributesGenerationStrategy ]) defaultInstance.
				getter := strategy generateGetterCodeFor: aProperty.
				setter := strategy generateSetterCodeFor: aProperty ].
	self addMethod: getter in: aProperty owner famixImplementationName protocol: protocol.
	self addMethod: setter in: aProperty owner famixImplementationName protocol: protocol.
	(aProperty famixOpposite isNotNil and: [ aProperty isMultivalued ]) ifTrue: [ self generateAddToCollectionFor: aProperty ]
]

{ #category : 'private' }
FmxMBFameChangesBuilderVisitor >> generatedPackageName [

	^ metamodel additionalProperty: #famixPackageName for: metamodel
]

{ #category : 'private' }
FmxMBFameChangesBuilderVisitor >> registerRemovals [

	| package |
	super registerRemovals.
	package := self generatedPackageName asPackageIfAbsent: [ ^ self ].
	((package extensionMethods select: [ :method | method hasPragmaNamed: #generated ]) groupedBy: #methodClass) keysAndValuesDo: [
			:behavior
			:methods |
			| selectors obsolete |
			selectors := (self changesOfType: FmxMethodAddition)
				             select: [ :change |
				             change className = behavior instanceSide name and: [ change isClassSide = behavior isClassSide ] ]
				             thenCollect: #selector.
			obsolete := (methods collect: #selector) difference: selectors.
			obsolete ifNotEmpty: [
					changesToApply add:
						(FmxMethodRemovals className: behavior instanceSide name isClassSide: behavior isClassSide selectors: obsolete) ] ]
]

{ #category : 'visiting' }
FmxMBFameChangesBuilderVisitor >> visitClass: aClass [

	| metadata |
	metadata := metamodel additionalPropertiesFor: aClass.
	self
		createClassNamed: aClass famixImplementationName
		superclass: aClass superclass famixImplementationName
		traitDefinitions: aClass famixTraitDefinitions
		precedingTrait: (metadata at: #famixPrecedingTrait ifAbsent: [ nil ])
		properties: (aClass properties select: [ :property | property famixIsGenerated and: [ property producesSlot ] ])
		in: aClass package name
		tag: (metadata at: #famixTag)
		comment: aClass comment.
	self generateAnnotationFor: aClass.
	self generatePropertiesFor: aClass
]

{ #category : 'visiting' }
FmxMBFameChangesBuilderVisitor >> visitTrait: aTrait [

	| metadata |
	metadata := metamodel additionalPropertiesFor: aTrait.
	self
		createTraitNamed: aTrait famixImplementationName
		traitDefinitions: aTrait famixTraitDefinitions
		precedingTrait: (metadata at: #famixPrecedingTrait ifAbsent: [ nil ])
		properties: (aTrait properties select: [ :property | property famixIsGenerated and: [ property producesSlot ] ])
		in: aTrait package name
		tag: (metadata at: #famixTag)
		comment: aTrait comment.
	self generateAnnotationFor: aTrait.
	self generatePropertiesFor: aTrait
]
