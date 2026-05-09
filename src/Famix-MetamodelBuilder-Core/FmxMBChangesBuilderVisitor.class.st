Class {
	#name : 'FmxMBChangesBuilderVisitor',
	#superclass : 'FmxMBWalkerVisitor',
	#instVars : [
		'builder',
		'currentBehavioral',
		'changesToApply'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'adding' }
FmxMBChangesBuilderVisitor >> addMethod: sourceCode classSide: aBoolean protocol: protocol [

	changesToApply add: (FmxMethodAddition
			 className: currentBehavioral name
			 isClassSide: aBoolean
			 sourceCode: sourceCode
			 protocol: protocol)
]

{ #category : 'adding' }
FmxMBChangesBuilderVisitor >> addMethod: sourceCode protocol: protocol [

	self addMethod: sourceCode classSide: false protocol: protocol
]

{ #category : 'initialization' }
FmxMBChangesBuilderVisitor >> buildSlotsDefinitionsFor: properties existingClass: currentClass [

	| modelSlotDefinitions |
	currentClass
		ifNil: [ modelSlotDefinitions := properties collect: [ :property | property slotDefinition ] ]
		ifNotNil: [
				| currentCustomSlots |
				currentCustomSlots := currentClass localSlots copyWithoutAll: currentClass generatedSlots.

				(currentClass generatedSlots reject: [ :generatedSlot | properties anySatisfy: [ :property | property name = generatedSlot name ] ]) ifNotEmpty: [
					:slotRemovals | changesToApply add: (FmxSlotRemovals slots: slotRemovals) ].

				modelSlotDefinitions := properties
					                        reject: [ :property | currentCustomSlots anySatisfy: [ :slot | slot name = property name ] ]
					                        thenCollect: [ :property | property slotDefinition ].

				modelSlotDefinitions addAll: (currentCustomSlots collect: #definitionString) ].

	modelSlotDefinitions ifEmpty: [ ^ nil ].
	^ modelSlotDefinitions sorted
]

{ #category : 'cleaning' }
FmxMBChangesBuilderVisitor >> changesOfType: aClass [

	^ changesToApply select: [ :change | change isKindOf: aClass ]
]

{ #category : 'accessing' }
FmxMBChangesBuilderVisitor >> changesToApply [
	^ changesToApply
]

{ #category : 'initialization' }
FmxMBChangesBuilderVisitor >> createClassNamed: className superclass: superclassName traitDefinitions: traitDefinitions precedingTrait: precedingTrait properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| realClass packageName tag change |
	realClass := self class environment at: className ifAbsent: [ nil ].

	packageName := realClass
		               ifNil: [ defaultPackage ]
		               ifNotNil: [ realClass package name ].
	tag := realClass
		       ifNil: [ defaultTag ]
		       ifNotNil: [ realClass packageTag name ].

	change := FmxClassAddition new.
	change
		name: className;
		superclass: superclassName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].

	self validateProperties: properties.
	change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass).
	changesToApply add: change.

	self ensurePackageNamed: packageName.

	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: className comment: comment) ]
]

{ #category : 'initialization' }
FmxMBChangesBuilderVisitor >> createTraitNamed: traitName traitDefinitions: traitDefinitions precedingTrait: precedingTrait properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| packageName tag realClass change |
	realClass := self class environment at: traitName ifAbsent: [ nil ].

	packageName := realClass
		               ifNil: [ defaultPackage ]
		               ifNotNil: [ realClass package name ].
	tag := realClass
		       ifNil: [ defaultTag ]
		       ifNotNil: [ realClass packageTag name ].

	change := FmxTraitAddition new.
	change
		name: traitName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].

	properties ifNotEmpty: [
			self validateProperties: properties.
			change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass) ].
	changesToApply add: change.

	self ensurePackageNamed: packageName.

	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: traitName comment: comment) ]
]

{ #category : 'private' }
FmxMBChangesBuilderVisitor >> ensurePackageNamed: packageName [

	((self changesOfType: FmxPackageAddition) anySatisfy: [ :change | change packageName = packageName ]) ifTrue: [ ^ self ].

	changesToApply add: (FmxPackageAddition named: packageName)
]

{ #category : 'as yet unclassified' }
FmxMBChangesBuilderVisitor >> generateAddToCollection [

	currentBehavioral relations do: [ :relation |
		relation isMany ifTrue: [ self addMethod: (self methodFactory addToCollectionFor: relation name) protocol: #adding ] ]
]

{ #category : 'as yet unclassified' }
FmxMBChangesBuilderVisitor >> generateAnnotation [

	self
		addMethod: (self methodFactory
				 annotationFor: currentBehavioral name
				 super: currentBehavioral superclassName
				 package: builder safeAnnotationPackageName
				 isAbstract: currentBehavioral isAbstractClass)
		classSide: true
		protocol: #meta
]

{ #category : 'as yet unclassified' }
FmxMBChangesBuilderVisitor >> generateFalseTestingMethods [

	| selectorsToGenerate |
	currentBehavioral isRoot ifFalse: [ ^ self ].

	selectorsToGenerate := Set new.
	builder testingSelectorsMapping keysAndValuesDo: [ :concernedClass :selectors |
		(builder shouldGeneratorTestingMethodsOf: concernedClass in: currentBehavioral) ifTrue: [ selectorsToGenerate addAll: selectors ] ].

	(selectorsToGenerate difference: (currentBehavioral traitGeneralizations flatCollect: #testingSelectors)) do: [ :selector |
		self addMethod: (self methodFactory testReturning: false for: selector) protocol: #testing ]
]

{ #category : 'generating-methods' }
FmxMBChangesBuilderVisitor >> generateFileImportMethods [

	builder configuration shouldGenerateFileImportHelpers ifFalse: [ ^ self ].

	self addMethod: self methodFactory canBeImportedFromFile classSide: true protocol: #testing.

	self addMethod: (self methodFactory importingClassNamed: builder importingContextName) classSide: true protocol: #accessing
]

{ #category : 'generating-methods' }
FmxMBChangesBuilderVisitor >> generateMetamodelMethod [

	currentBehavioral isRoot ifFalse: [ ^ self ].

	builder model ifNotNil: [ :model | self addMethod: (self methodFactory metamodelFor: model fullName) classSide: true protocol: #meta ]
]

{ #category : 'as yet unclassified' }
FmxMBChangesBuilderVisitor >> generateTrueTestingMethods [

	currentBehavioral testingSelectors do: [ :aSelector | self addMethod: (self methodFactory testReturning: true for: aSelector) protocol: #testing ]
]

{ #category : 'initialization' }
FmxMBChangesBuilderVisitor >> initialize [

	super initialize.
	changesToApply := OrderedCollection new
]

{ #category : 'as yet unclassified' }
FmxMBChangesBuilderVisitor >> methodFactory [

	^ FmxMBMethodsFactory
]

{ #category : 'installing' }
FmxMBChangesBuilderVisitor >> traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass [
	"We need to collect the generated traits + the custom traits added by the user."

	| customTraitNames traitCompositionString |
	customTraitNames := ((realClass
		                      ifNil: [ #(  ) ]
		                      ifNotNil: [ :class | class traitComposition rootMembers ]) select: [ :e | realClass customTraitNames includes: e name ]) collect:
		                    #traitCompositionExpression.
	"manage methods to remove."
	traitCompositionString := traitDefinitions , customTraitNames ifEmpty: [ ^ '{ }' ] ifNotEmpty: [ :definitions | definitions joinUsing: ' + ' ].

	precedingTrait ifNil: [ ^ traitCompositionString ].

	^ String streamContents: [ :s |
			  s
				  nextPutAll: '(';
				  nextPutAll: traitCompositionString;
				  nextPutAll: ' withPrecedenceOf: ';
				  nextPutAll: precedingTrait;
				  nextPutAll: ')' ]
]

{ #category : 'installing' }
FmxMBChangesBuilderVisitor >> validateProperties: properties [

	| names |
	names := properties collect: #name.
	self assert: names size = names asSet size description: 'Two properties of the same class cannot have the same names.'.
	properties do: [ :property | property validate ]
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitBuilder: aBuilder [

	builder := aBuilder.
	self ensurePackageNamed: aBuilder configuration packageName.

	super visitBuilder: aBuilder
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitClass: aClass [

	currentBehavioral := aClass.

	self
		createClassNamed: aClass fullName
		superclass: aClass superclassName
		traitDefinitions: aClass allTraitDefinitions
		precedingTrait: (aClass additionalProperties at: #precedingTrait ifAbsent: [ nil ])
		properties: (aClass propertiesAndRelations select: #producesSlot)
		in: aClass packageName
		tag: aClass tag
		comment: aClass commentWithRelations.


	super visitClass: aClass
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitClassEntity: aClass [

	super visitClassEntity: aClass.

	self
		generateAnnotation;
		generateTrueTestingMethods;
		generateFalseTestingMethods;
		generateAddToCollection;
		generateMetamodelMethod.

	aClass isAbstractClass ifTrue: [ self addMethod: (self methodFactory isAbstractFor: aClass fullName) classSide: true protocol: #testing ].

	aClass propertiesForEqualityCheck ifNotNil: [
			self addMethod: (self methodFactory equalsForVariableNamed: 'a' , aClass fullName properties: aClass propertiesForEqualityCheck) protocol: #comparing.
			self addMethod: (self methodFactory hashForProperties: aClass propertiesForEqualityCheck) protocol: #comparing ]
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitClassGroup: aClass [

	super visitClassGroup: aClass.
	aClass innerClass addMethod: (self methodFactory groupAnnotationNamed: aClass fullName) classSide: true protocol: #groups
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitEntityCreator: aTrait [

	super visitEntityCreator: aTrait.

	builder concreteClasses do: [ :class |
			self addMethod: (self methodFactory instantiate: class) protocol: #'entity creation'.

			(class allTransitiveTraitsIncludingSuperclasses anySatisfy: [ :trait | trait prefix = #Famix and: [ trait name = #TNamedEntity ] ]) ifTrue: [
				self addMethod: (self methodFactory instantiateNamed: class) protocol: #'entity creation' ] ]
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitImportingContext: aClass [

	super visitImportingContext: aClass.

	self addMethod: (self methodFactory importedMetamodelForPrefix: aClass prefix) classSide: true protocol: #accessing.

	builder concreteClasses do: [ :each |
			self
				addMethod: (each allTransitiveTraits
						 detect: [ :trait | trait name = #TAssociation ]
						 ifFound: [ self methodFactory importAssociationNamed: each name ]
						 ifNone: [ self methodFactory importEntityNamed: each name ])
				protocol: #importing.

			self addMethod: (self methodFactory shouldImportNamed: each name) protocol: #testing ]
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitModel: aClass [

	super visitClassGroup: aClass.

	self
		generateFileImportMethods;
		generateAnnotation.

	builder allSubBuilders ifNotEmpty: [ :subBuilders |
		self addMethod: (self methodFactory allSubmetamodelsPackagesNamesFor: subBuilders) classSide: true protocol: #accessing ]
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitRelation: aRelation [

	| generationStrategy protocol |
	super visitRelation: aRelation.

	generationStrategy := (aRelation producesSlot
		                       ifTrue: [ FmxMBRelationSlotsGenerationStrategy ]
		                       ifFalse: [ FmxMBRelationAttributesGenerationStrategy ]) defaultInstance.

	protocol := aRelation isRemote
		            ifTrue: [ '*' , builder parentBuilderPackageName ]
		            ifFalse: [ #accessing ].

	self addMethod: (generationStrategy generateSetterCodeFor: aRelation) protocol: protocol.
	self addMethod: (generationStrategy generateGetterCodeFor: aRelation) protocol: protocol
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitTrait: aTrait [

	currentBehavioral := aTrait.

	self
		createTraitNamed: aTrait fullName
		traitDefinitions: aTrait allTraitDefinitions
		precedingTrait: (aTrait additionalProperties at: #precedingTrait ifAbsent: [ nil ])
		properties: (aTrait propertiesAndRelations select: #producesSlot)
		in: aTrait packageName
		tag: aTrait tag
		comment: aTrait commentWithRelations.

	self
		generateAnnotation;
		generateTrueTestingMethods;
		generateAddToCollection.

	super visitTrait: aTrait
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitTypedProperty: aTypedProperty [

	| protocol |
	super visitTypedProperty: aTypedProperty.

	protocol := aTypedProperty isRemote
		            ifTrue: [ '*' , builder parentBuilderPackageName ]
		            ifFalse: [ #accessing ].

	self addMethod: (self methodFactory getTypedProperty: aTypedProperty) protocol: protocol.

	self addMethod: (self methodFactory setTypedProperty: aTypedProperty name remote: aTypedProperty isRemote) protocol: protocol
]
