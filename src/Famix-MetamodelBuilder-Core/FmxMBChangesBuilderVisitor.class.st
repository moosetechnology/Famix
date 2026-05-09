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

	self
		addMethod: sourceCode
		in: currentBehavioral fullName
		classSide: aBoolean
		protocol: protocol
]

{ #category : 'adding' }
FmxMBChangesBuilderVisitor >> addMethod: sourceCode in: aClassName classSide: aBoolean protocol: protocol [

	changesToApply add: (FmxMethodAddition
			 className: aClassName
			 isClassSide: aBoolean
			 sourceCode: sourceCode
			 protocol: protocol)
]

{ #category : 'adding' }
FmxMBChangesBuilderVisitor >> addMethod: sourceCode in: aClassName protocol: protocol [

	self
		addMethod: sourceCode
		in: aClassName
		classSide: false
		protocol: protocol
]

{ #category : 'adding' }
FmxMBChangesBuilderVisitor >> addMethod: sourceCode protocol: protocol [

	self addMethod: sourceCode in: currentBehavioral fullName protocol: protocol
]

{ #category : 'accessing' }
FmxMBChangesBuilderVisitor >> applyChanges [

	| dependencies |
	changesToApply ifEmpty: [ ^ self ]. 
	
	"Now we have a list of changes to apply. Some changes needs to by applied before others (for example, we need to create a classe to compile its methods or compile superclasses before their subclasses or traits before their users)."
	dependencies := changesToApply inject: Dictionary new into: [ :dictionary :change |
			                dictionary
				                at: change put: (change followingChangesIn: (changesToApply copyWithout: change));
				                yourself ].
	(AITopologicalSorting sort: changesToApply followingIncomingProperty: [ :change | dependencies at: change ]) do: #apply
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

{ #category : 'accessing' }
FmxMBChangesBuilderVisitor >> filterRedoundantChanges [

	changesToApply := changesToApply select: #isRequired
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

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> generateTestingMethodsOfRemoteEntities [

	| entitiesWithRemoteSuperclasses |
	entitiesWithRemoteSuperclasses := builder classes groupedBy: [ :class | class remoteSuperclass ].


	entitiesWithRemoteSuperclasses keysAndValuesDo: [ :remoteClass :subclasses |
			remoteClass ifNotNil: [
					| subclassesAndTraits |
					subclassesAndTraits := subclasses flatCollectAsSet: [ :subclass | subclass allTransitiveTraits , { subclass } ].

					builder testingSelectorsMapping keysAndValuesDo: [ :behavior :selectors |
							((builder shouldGeneratorTestingMethodsOf: behavior in: remoteClass) and: [ subclassesAndTraits includes: behavior ]) ifTrue: [
									selectors do: [ :selector |
											self class environment
												at: remoteClass fullName
												ifPresent: [ :class |
														(class includesSelector: selector) ifFalse: [
															self addMethod: (self methodFactory testReturning: true for: selector) in: remoteClass name protocol: '*' , builder configuration packageName ] ]
												ifAbsent: [ self error: 'The class ' , remoteClass fullName , ' was not found in the system to generate a remote testing method.' ] ] ] ] ] ]
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
FmxMBChangesBuilderVisitor >> recordMethodRemovalsOf: realClass [

	| generatedMethodsOfRealClass generatedMethodNamesOfRealClass selectorsToGenerate |
	generatedMethodsOfRealClass := (Pragma allNamed: #generated in: realClass)
		                               collect: #method
		                               thenReject: [ :m | m isFromTrait ].

	"In case we have an extension, we remove it if the package is the right one"
	self flag: #todo. "Demeter. Clean package name management."
	generatedMethodsOfRealClass := generatedMethodsOfRealClass reject: [ :method | (method hasPragmaNamed: #package:) and: [ ((method pragmaAt: #package:) argumentAt: 1) ~=  builder generator packageName ] ].

	generatedMethodNamesOfRealClass := generatedMethodsOfRealClass collect: #selector.

	selectorsToGenerate := ((self changesOfType: FmxMethodAddition) select: [ :change | change className = realClass instanceSide name and: [ change isClassSide = realClass isClassSide ] ]) collect: #selector.

	"First we removed the generated methods should not be here anymore"
	(generatedMethodNamesOfRealClass difference: selectorsToGenerate) ifNotEmpty: [ :selectorsOfRemovedGeneratedMethod |
		changesToApply add: (FmxMethodRemovals className: realClass instanceSide name isClassSide: realClass isClassSide selectors: selectorsOfRemovedGeneratedMethod) ]
]

{ #category : 'accessing' }
FmxMBChangesBuilderVisitor >> recordRemovalOfGeneratedPackagesAndClasses [
	"Since the last generation it is possible some behaviorals were removed from the generator. In that case we should remove them. We will remove all classes and traits of Famix that are not part of the current generator."

	| classesToGenerate |
	classesToGenerate := (self changesOfType: FmxBehavioralAddition) collectAsSet: #name.

	(self changesOfType: FmxPackageAddition)
		collect: #systemPackage
		thenDo: [ :package |
				package ifNotNil: [
						package definedClasses
							select: #canBeGenerated
							thenDo: [ :class | (classesToGenerate includes: class name) ifFalse: [ changesToApply add: (FmxClassRemoval class: class) ] ] ] ]
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> registerRemovals [

	| classesToGenerate |
	classesToGenerate := (self changesOfType: FmxBehavioralAddition) collectAsSet: #name.

	classesToGenerate do: [ :className |
			self class environment at: className asSymbol ifPresent: [ :realClass |
					self recordMethodRemovalsOf: realClass.
					self recordMethodRemovalsOf: realClass class ] ].

	self recordRemovalOfGeneratedPackagesAndClasses
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

	super visitBuilder: aBuilder.

	self generateTestingMethodsOfRemoteEntities.

	self registerRemovals
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
	self
		addMethod: (self methodFactory groupAnnotationNamed: aClass fullName)
		in: aClass innerClass fullName
		classSide: true
		protocol: #groups
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

	self generateAnnotation.

	super visitTrait: aTrait
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitTraitEntity: aTrait [

	super visitTraitEntity: aTrait.

	self
		generateTrueTestingMethods;
		generateAddToCollection
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
