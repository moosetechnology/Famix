"
I am a visitor to generate the metamodel code of everything that is not remote.
"
Class {
	#name : 'FmxMBChangesBuilderVisitor',
	#superclass : 'FmxMBAbstractChangesBuilderVisitor',
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'generation' }
FmxMBChangesBuilderVisitor >> generateAddToCollection [

	currentBehavioral relations do: [ :relation |
		relation isMany ifTrue: [ self addMethod: (self methodFactory addToCollectionFor: relation name) protocol: #adding ] ]
]

{ #category : 'generation' }
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

{ #category : 'generation' }
FmxMBChangesBuilderVisitor >> generateFalseTestingMethods [

	| selectorsToGenerate |
	currentBehavioral isRoot ifFalse: [ ^ self ].

	selectorsToGenerate := Set new.
	builder testingSelectorsMapping keysAndValuesDo: [ :concernedClass :selectors |
		(builder shouldGeneratorTestingMethodsOf: concernedClass in: currentBehavioral) ifTrue: [ selectorsToGenerate addAll: selectors ] ].

	(selectorsToGenerate difference: (currentBehavioral traitGeneralizations flatCollect: #testingSelectors)) do: [ :selector |
		self addMethod: (self methodFactory testReturning: false for: selector) protocol: #testing ]
]

{ #category : 'generation' }
FmxMBChangesBuilderVisitor >> generateFileImportMethods [

	builder configuration shouldGenerateFileImportHelpers ifFalse: [ ^ self ].

	self addMethod: self methodFactory canBeImportedFromFile classSide: true protocol: #testing.

	self addMethod: (self methodFactory importingClassNamed: builder importingContextName) classSide: true protocol: #accessing
]

{ #category : 'generation' }
FmxMBChangesBuilderVisitor >> generateMetamodelMethod [

	currentBehavioral isRoot ifFalse: [ ^ self ].

	builder model ifNotNil: [ :model | self addMethod: (self methodFactory metamodelFor: model fullName) classSide: true protocol: #meta ]
]

{ #category : 'generation' }
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
															self addMethod: (self methodFactory testReturning: true for: selector) in: remoteClass fullName protocol: '*' , builder configuration packageName ] ]
												ifAbsent: [ self error: 'The class ' , remoteClass fullName , ' was not found in the system to generate a remote testing method.' ] ] ] ] ] ]
]

{ #category : 'generation' }
FmxMBChangesBuilderVisitor >> generateTrueTestingMethods [

	currentBehavioral testingSelectors do: [ :aSelector | self addMethod: (self methodFactory testReturning: true for: aSelector) protocol: #testing ]
]

{ #category : 'private' }
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

{ #category : 'private' }
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

{ #category : 'private' }
FmxMBChangesBuilderVisitor >> registerRemovals [

	| classesToGenerate |
	classesToGenerate := (self changesOfType: FmxBehavioralAddition) collectAsSet: #name.

	classesToGenerate do: [ :className |
			self class environment at: className asSymbol ifPresent: [ :realClass |
					self recordMethodRemovalsOf: realClass.
					self recordMethodRemovalsOf: realClass class ] ].

	self recordRemovalOfGeneratedPackagesAndClasses
]

{ #category : 'visiting' }
FmxMBChangesBuilderVisitor >> visitBuilder: aBuilder [

	super visitBuilder: aBuilder.

	self ensurePackageNamed: aBuilder configuration packageName.

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
