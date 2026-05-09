"
builder := FamixMetamodelBuilder new.
builder 
	prefix: 'FamixTest';
	packageName: 'FamixTest'.

comment := builder newClassNamed: #Comment.
method := builder newClassNamed: #Method.
package := builder newClassNamed: #Package.

(package <>- comment)
	from
	




builder := FamixMetamodelBuilder new.

rel := builder newRelation 
	between: #TAccess and: #TWithAccesses;
	fromOne: #accessor toMany: #accesses.
	
	
rel := builder newRelation 
	between: #TAccess and: #TWithAccesses;
	fromOne: #accessor toMany: #accesses.
	
rel := builder newRelation
	from: [ :side |
		side name: #accessor;
			traitName: #TAccess;
			container;
			comment: 'some comment';
			one	 ];
	to: [ :opposite |
		opposite 	name: #accesses;
			traitName: #TWithAccesses;
			comment: 'ohter comment';
			many ].
		
	



"
Class {
	#name : 'FamixMetamodelBuilder',
	#superclass : 'Object',
	#instVars : [
		'environment',
		'classes',
		'traits',
		'generator',
		'testingSelectorsMapping',
		'configuration',
		'parentBuilder',
		'withoutBuilder'
	],
	#category : 'Famix-MetamodelBuilder-Core-Basic',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Basic'
}

{ #category : 'instance creation' }
FamixMetamodelBuilder class >> forGenerator: aGenerator [

	<ignoreForCoverage>
	^ self new
		generator: aGenerator;
		yourself.
]

{ #category : 'visitor' }
FamixMetamodelBuilder >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitBuilder: self
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> addEntityCreatorTraitToModel: aClass [

	self shouldGenerateModel ifTrue: [ aClass addTraitGeneralization: self entityCreatorTrait ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> allSubBuilders [

	^ self generator ifNil: [ Set new ] ifNotNil: #allSubBuilders
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> apply [

	self environment apply
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> association: anAssociationName [

	| association |
	association := self ensureClassNamed: anAssociationName.

	association --|> #TAssociation.

	^ association
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> baseImportingContextName [

	^ #FamixImportingContext
]

{ #category : 'generating' }
FamixMetamodelBuilder >> changesToApply [

	self prepareGeneration.
	^ self environment changesToApply
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> classNamed: aClassName [

	"empty block returns nil anyway"

	<ignoreForMutations:
	#( ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator )>
	^ self classes
		  detect: [ :each | each name = aClassName ]
		  ifNone: [ nil ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> classes [

	^ classes
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> concreteClasses [

	^ self classes select: #isConcreteClass
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> configuration [

	^ configuration
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> configuration: anObject [

	<ignoreForCoverage>
	configuration := anObject
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> ensureAbstractClassNamed: aString [

	^ self classes
		  detect: [ :each | each name = aString ]
		  ifFound: [ :aClass | 
			  aClass
				  isAbstractClass: true;
				  yourself ]
		  ifNone: [ self newAbstractClassNamed: aString ]
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> ensureClassNamed: aString [

	^ self classes
		  detect: [ :each | each name = aString ]
		  ifNone: [ self newClassNamed: aString ]
]

{ #category : 'generating' }
FamixMetamodelBuilder >> ensureEntityClassIsTheCommonSuperclass [

	"All classes should have a common superclass called Entity. Here we ensure it is created and used."

	self classes iterator
	| #isClassEntity selectIt
	| #isRoot selectIt
	| [ :class | class name = #Entity ] rejectIt
	| [ :class | class --|> (self ensureAbstractClassNamed: #Entity) ] doIt
	> NullAddableObject
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> ensureLocalTraitNamed: aString [

	<ignoreForMutations: #( ReplaceAndWithEqvMutantOperator )>
	^ self traits
		  detect: [ :each | 
			  each name = aString and: [ 
				  each prefix = self configuration prefix ] ]
		  ifNone: [ self unsafeNewTraitNamed: aString ]
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> entityCreatorTrait [

	^ self traits
		  detect: [ :each | each isEntityCreatorTrait ]
		  ifNone: [
			  self traits add: (FmxMBEntityCreatorTrait new
					   builder: self;
					   prefix: self configuration prefix;
					   packageName: self configuration packageName;
					   yourself) ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> environment [

	^ environment
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> environment: anObject [

	environment := anObject
]

{ #category : 'generating' }
FamixMetamodelBuilder >> generate [

	| changesBuilder |
	self prepareGeneration.
	changesBuilder := FmxMBChangesBuilderVisitor visit: self.
	self apply
]

{ #category : 'generating' }
FamixMetamodelBuilder >> generateImportingContext [

	| aClass |
	self configuration shouldGenerateFileImportHelpers ifFalse: [ ^ self ].

	aClass := FmxMBImportingContext new.
	aClass builder: self.
	aClass prefix: self configuration prefix.
	aClass packageName: self configuration packageName.
	aClass tag: 'Import'.

	self classes add: aClass.
	^ aClass
]

{ #category : 'generating' }
FamixMetamodelBuilder >> generateRemotes [

	self traits do: [ :each | each generateRemotes ].
	self classes do: [ :each | each generateRemotes ].

	self apply
]

{ #category : 'generating' }
FamixMetamodelBuilder >> generateTestingMethodsOfRemoteEntities [

	| entitiesWithRemoteSuperclasses |
	entitiesWithRemoteSuperclasses := self classes groupedBy: [ :class | class remoteSuperclass ].


	entitiesWithRemoteSuperclasses keysAndValuesDo: [ :remoteClass :subclasses |
			remoteClass ifNotNil: [
					| subclassesAndTraits |
					subclassesAndTraits := subclasses flatCollectAsSet: [ :subclass | subclass allTransitiveTraits , { subclass } ].

					self testingSelectorsMapping keysAndValuesDo: [ :behavior :selectors |
							((self shouldGeneratorTestingMethodsOf: behavior in: remoteClass) and: [ subclassesAndTraits includes: behavior ]) ifTrue: [
									selectors do: [ :selector |
											self class environment
												at: remoteClass fullName
												ifPresent: [ :class |
														(class includesSelector: selector) ifFalse: [
															remoteClass addMethod: ('{1}\\	<generated>\	^ false' withCRs format: { selector }) protocol: '*' , self configuration packageName ] ]
												ifAbsent: [ self error: 'The class ' , remoteClass fullName , ' was not found in the system to generate a remote testing method.' ] ] ] ] ] ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> generator [

	<ignoreForCoverage>
	^ generator
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> generator: aGenerator [

	<ignoreForCoverage>
	generator := aGenerator
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> getTraitNamed: aSymbol [
	"Check if I contain a trait of this name. If yes, return it. 
	If no, check if one of my subMM has a trait of this name. If one is found, return it. If more is found raise an error. If non is found, create a new trait of this name and return it."

	| remoteTraits |
	remoteTraits := Dictionary new.
	self allSubBuilders do: [ :builder |
		builder traits
			detect: [ :each | each name = aSymbol ]
			ifFound: [ :trait | remoteTraits at: builder put: trait ] ].
	remoteTraits size = 1 ifTrue: [
		^ remoteTraits values anyOne
			  isRemote: true;
			  remoteBuilder: self;
			  yourself ].
	remoteTraits size > 1 ifTrue: [
		self error: ('Multiple remote traits named {1} where found in sub metamodels. Found in: {2}.
In order to fix the issue you should use #remoteTrait:withPrefix: in your generator to select yourself the right trait to use. If you want to create an entity of this name in your model and not use the trait of this name from a sub metamodel, declare this trait before referencing it.'
				 format: {
						 aSymbol.
						 (', ' join: (remoteTraits keys collect: [ :builder | builder generator asString ])) }) ].

	^ self traitNamed: aSymbol
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> importingContextName [

	^ (self configuration prefix , 'ImportingContext') asSymbol
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> initialize [

	super initialize.
	environment := FmxMBRingEnvironment for: self.

	configuration := FmxMBConfiguration new.

	classes := OrderedCollection new.
	traits := OrderedCollection new.
	testingSelectorsMapping := Dictionary new.
	withoutBuilder := false
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> model [

	| aClass |
	"can only have one model by generator, so return the model class if already created"
	self classes detect: #isModelClass ifFound: [ :found | ^ found ].

	aClass := FmxMBModel new.
	aClass builder: self.
	aClass prefix: self configuration prefix.
	aClass packageName: self configuration packageName.
	self classes add: aClass.
	^ aClass
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newAbstractClassNamed: aClassName [

	(self classes select: [ :each | each name = aClassName ]) 
		ifNotEmpty: [ FmxMBEntityAlreadyExists signal ].

	^ self newClass
		  name: aClassName;
		  isAbstractClass: true;
		  yourself
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newClass [

	| aClass |
	aClass := FmxMBClassEntity new
		          builder: self;
		          prefix: self configuration prefix;
		          packageName: self configuration packageName;
		          yourself.
	self classes add: aClass.
	^ aClass
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newClassGroup [

	| aClass |
	aClass := FmxMBClassGroup new.
	aClass builder: self.
	aClass prefix: self configuration prefix.
	aClass packageName: self configuration packageName.
	self classes add: aClass.
	^ aClass
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newClassGroupNamed: aClassName [

	(self classes select: [ :each | each name = aClassName ]) 
		ifNotEmpty: [ FmxMBEntityAlreadyExists signal ].

	^ self newClassGroup name: aClassName
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newClassNamed: aClassName [

	(self classes select: [ :each | each name = aClassName ]) 
		ifNotEmpty: [ FmxMBEntityAlreadyExists signal ].

	^ self newClass name: aClassName
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newClassNamed: aClassName comment: aString [

	^ (self newClassNamed: aClassName)
		  comment: aString;
		  yourself
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newTrait [

	| aTrait |
	aTrait := FmxMBTrait new.
	aTrait builder: self.
	aTrait prefix: self configuration prefix.
	aTrait packageName: self configuration packageName.
	self traits add: aTrait.
	^ aTrait
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newTraitNamed: aTraitName [

	| fullName |
	fullName := self configuration prefix , aTraitName.
	(self traits select: [ :each | each fullName = fullName ]) ifNotEmpty: [ FmxMBEntityAlreadyExists signal ].

	^ self unsafeNewTraitNamed: aTraitName
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> newTraitNamed: aClassName comment: aString [

	^ (self newTraitNamed: aClassName)
		  comment: aString;
		  yourself
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> parentBuilder [

	<ignoreForCoverage>
	^ parentBuilder
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> parentBuilder: anObject [

	parentBuilder := anObject.
	self environment: parentBuilder environment
]

{ #category : 'tests support' }
FamixMetamodelBuilder >> parentBuilderPackageName [

	"needed to know the package where extension methods of the composed metamodels should be placed"

	^ (parentBuilder ifNil: [ self ]) configuration packageName
]

{ #category : 'generating' }
FamixMetamodelBuilder >> prepareBehaviorsGeneration [

	self traitsWithSubBuildersTraits do: [ :each | self testingSelectorsMapping at: each put: each testingSelectors ].
	self classes do: [ :each | self testingSelectorsMapping at: each put: each testingSelectors ].
	self traits do: [ :each | each generate ].
	self sortedClasses do: [ :each | each generate ].
	self generateTestingMethodsOfRemoteEntities
]

{ #category : 'generating' }
FamixMetamodelBuilder >> prepareGeneration [

	self environment ensurePackageNamed: self configuration packageName.
	self ensureEntityClassIsTheCommonSuperclass.

	self shouldGenerateModel ifTrue: [
			self withSubBuildersAddEntityCreatorTraitTo: self model.
			self generateImportingContext ].

	self prepareBehaviorsGeneration
]

{ #category : 'printing' }
FamixMetamodelBuilder >> printOn: aStream [

	super printOn: aStream.

	self generator ifNotNil: [ :g | 
		aStream
			nextPut: $(;
			print: g class;
			nextPut: $) ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> reservedKeywords [

	^ { #class }
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> safeAnnotationPackageName [

	^ self configuration packageNameForAnnotations asSymbol printString
]

{ #category : 'asserting' }
FamixMetamodelBuilder >> shouldGenerateModel [

	withoutBuilder ifTrue: [ ^ false ].

	"In case of empty prefix, it would generate a classe name Model which is not possible in Pharo. Thus we prevent this case."
	self configuration prefix ifEmpty: [ ^ false ].

	^ self concreteClasses isNotEmpty or: [ self subBuilders anySatisfy: #shouldGenerateModel ]
]

{ #category : 'asserting' }
FamixMetamodelBuilder >> shouldGeneratorTestingMethodsOf: aClass in: targetClass [
	"In case a testing selector is relatif to a Trait that is not used in the current MM, then we do not need to generate the testing selector."

	aClass isMetamodelTrait ifFalse: [ ^ true ].
	
	"If the target class contains the trait, then it should not generate a testing method returning false, else it will override the method returning true."
	(targetClass allTransitiveTraits includes: aClass) ifTrue: [ ^ false ].
	
	^ self classes anySatisfy: [ :class | class allTransitiveTraits includes: aClass ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> sortedClasses [

	<ignoreForMutations: #( ReplaceLessOrEqualWithLessMutantOperator )>

	^ self classes sorted: [ :class |
		  class isModelClass
			  ifTrue: [ -1 ]
			  ifFalse: [ class allSuperclasses size ] ] ascending
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> sortedTraits [

	<ignoreForMutations:
	#( ReplaceAndWithEqvMutantOperator ReplaceLessOrEqualWithLessMutantOperator )>
	^ self traits sorted: [ :a :b | 
		  a allTraitGeneralizations size <= b allTraitGeneralizations size 
			  and: [ a name <= b name ] ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> subBuilders [

	^ self generator ifNil: [ #(  ) ] ifNotNil: #subBuilders
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> testingSelectorsMapping [

	^ testingSelectorsMapping
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> traitNamed: aString [

	^ self traits detect: [ :each | each name = aString ] ifNone: [
		  FamixMetamodelGeneratorUnknownTrait signal: 'Trait ' , aString
			  ,
			  ' not found in the metamodel. Please add it or refer to a submetamodel.' ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> traits [

	^ traits
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> traitsWithSubBuildersTraits [

	^ (self allSubBuilders flatCollect: #traits)
		  addAll: self traits;
		  yourself
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> unsafeNewTraitNamed: aTraitName [

	^ self newTrait name: aTraitName.

]

{ #category : 'accessing' }
FamixMetamodelBuilder >> withFileImport [

	self configuration shouldGenerateFileImportHelpers: true
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> withImportingContext [

	self
		deprecated: 'Use #withFileImport instead'
		transformWith:
		'`@receiver withImportingContext' -> '`@receiver withFileImport'.
	self withFileImport
]

{ #category : 'initialization' }
FamixMetamodelBuilder >> withSubBuildersAddEntityCreatorTraitTo: aClass [

	self addEntityCreatorTraitToModel: aClass.
	self allSubBuilders do: [ :subBuilder | 
		subBuilder addEntityCreatorTraitToModel: aClass ]
]

{ #category : 'accessing' }
FamixMetamodelBuilder >> withoutModel [

	withoutBuilder := true
]
