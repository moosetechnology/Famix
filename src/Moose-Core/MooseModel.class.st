"
MooseModel is a special group that is used for manipulating an entire model.
"
Class {
	#name : #MooseModel,
	#superclass : #MooseAbstractGroup,
	#instVars : [
		'metamodel',
		'name'
	],
	#classVars : [
		'MostRecentOwner'
	],
	#classInstVars : [
		'metamodel'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
MooseModel class >> allSubmetamodelsPackagesNames [
	^ #()
]

{ #category : #meta }
MooseModel class >> annotation [
	<FMClass: #Model super: #MooseAbstractGroup>
	<package: #Moose>

]

{ #category : #testing }
MooseModel class >> canBeImportedFromFile [

	^ false
]

{ #category : #accessing }
MooseModel class >> defaultPackagesToProcessWith: aCollectionOfPackages [
	"We add to the creation of a metamodel all the metamodel entities of packages declaring to be part of the metamodels by default. 
	
	If a user of Famix wishes to add entities to all metamodels, they should add a methode #shouldBeIncludedByDefaultInMetamodelsWith: to their package manifest to return true."

	^ self packageOrganizer packages
		select: [ :package | 
			package packageManifestOrNil
				ifNil: [ false ]
				ifNotNil: [ :manifest | manifest shouldBeIncludedByDefaultInMetamodelsWith: aCollectionOfPackages ] ]
]

{ #category : #'world menu' }
MooseModel class >> developerTool: aClass menuCommandOn: aBuilder [
	^(aBuilder item: aClass menuLabel)
		parent: MooseModel developerToolsMenuLabel ;
		label: aClass menuLabel ;
		icon: (MooseIcons mooseIcon scaledToSize: 16@16) ;
		action:[ aClass open ] ;
		yourself
]

{ #category : #'world menu' }
MooseModel class >> developerToolsMenuLabel [
	^#MooseDevelopperTools
]

{ #category : #'import-export' }
MooseModel class >> export: aModel to: aStream [

	self
		deprecated:
			'This method is not used and will be removed in the next Moose version. 
Please use an instance side method instead. 
The default export is done in a MSE format. JSON is also available'
		transformWith: '`@modelClass export: `@model to: `@stream'
			-> '`@model exportToMSEStream: `@stream'.

	aModel exportToMSEStream: aStream
]

{ #category : #'import-export' }
MooseModel class >> exportMetamodel: aMetamodel to: aStream [

	self
		deprecated:
			'This method is not used and will be removed in the next Moose version. 
Please use an instance side method instead.
The default export is done in a MSE format. JSON is also available'
		transformWith:
			'`@modelClass exportMetamodel: `@metamodel to: `@stream'
			-> '`@metamodel exportMetamodelToMSEStream: `@stream'.

	aMetamodel exportMetamodelToMSEStream: aStream
]

{ #category : #accessing }
MooseModel class >> factory [
	^ FMMetamodelFactory forModel: self
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream [
	^ self importFrom: aStream withMetamodel: self metamodel
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream filteredBy: anImportingContext [
	^ self importFrom: aStream withMetamodel: self metamodel filteredBy: anImportingContext
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream withMetamodel: aMetamodel [
	"Here we build with the default importer"

	^ self importFrom: aStream withMetamodel: aMetamodel customizingImporterWith: [ :importer | importer ]
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream withMetamodel: aMetamodel customizingImporterWith: aBlock [
	"I import a MSE with its metamodel and return a FMModel from it. It is possible to customize the importer via a block"

	| model importer areWarningsEnabled |
	model := FMModel withMetamodel: aMetamodel.
	importer := aBlock
		value:
			((FMImporter model: model) autorizeDandlingReferencesAtEnd
				stream: aStream;
				yourself).

	"We are currently updating the meta models and most parsers are not up to date.
	We disable warnings to avoid all deprecation warnings during the transition phase."
	areWarningsEnabled := Deprecation raiseWarning.
	[ Deprecation raiseWarning: false.
	importer run ]
		ensure: [ Deprecation raiseWarning: areWarningsEnabled ].

	model updateCache.
	^ model
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream withMetamodel: aMetamodel filteredBy: anImportingContext [

	"In the way to import a model we filter the entites we want to import via a FmxImportContext."

	| famixElementNames |
	famixElementNames := anImportingContext imports collect: [ :each | 
		                     each fullName ].

	^ self
		  importFrom: aStream
		  withMetamodel: aMetamodel
		  customizingImporterWith: [ :importer | 
			  FMImporterFilter on: importer filtering: famixElementNames ]
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream withMetamodel: aMetamodel translationDictionary: translationDict [

	"In this case we use a translation dictionary to import model by updating the names from the MSE."

	^ self
		  importFrom: aStream
		  withMetamodel: aMetamodel
		  customizingImporterWith: [ :importer | 
			  importer
				  translationUnit: (FMDictionaryTranslationUnit new
						   dictionary: translationDict;
						   yourself);
				  yourself ]
]

{ #category : #'import-export' }
MooseModel class >> importFromJSON: aStream withMetamodel: aMetamodel [
	"Here we build with the default importer"

	^ self importFromJSON: aStream withMetamodel: aMetamodel customizingImporterWith: [ :importer | importer ]
]

{ #category : #'import-export' }
MooseModel class >> importFromJSON: aStream withMetamodel: aMetamodel customizingImporterWith: aBlock [
	"I import a MSE with its metamodel and return a FMModel from it. It is possible to customize the importer via a block"

	| model importer areWarningsEnabled |
	model := FMModel withMetamodel: aMetamodel.
	importer := aBlock
		value:
			((FMImporter model: model) autorizeDandlingReferencesAtEnd
				parser: FMJSONParser;
				stream: aStream;
				yourself).

	"We are currently updating the meta models and most parsers are not up to date.
	We disable warnings to avoid all deprecation warnings during the transition phase."
	areWarningsEnabled := Deprecation raiseWarning.
	[ Deprecation raiseWarning: false.
	importer run ]
		ensure: [ Deprecation raiseWarning: areWarningsEnabled ].

	model updateCache.
	^ model
]

{ #category : #'import-export' }
MooseModel class >> importFromJSON: aStream withMetamodel: aMetamodel filteredBy: anImportingContext [

	"In the way to import a model we filter the entites we want to import via a FmxImportContext."

	| famixElementNames |
	famixElementNames := anImportingContext imports collect: [ :each | 
		                     each fullName ].

	^ self
		  importFromJSON: aStream
		  withMetamodel: aMetamodel
		  customizingImporterWith: [ :importer | 
			  FMImporterFilter on: importer filtering: famixElementNames ]
]

{ #category : #'import-export' }
MooseModel class >> importFromMSEStream: aStream [
	^ self new
		importFromMSEStream: aStream;
		yourself
]

{ #category : #'import-export' }
MooseModel class >> importFromMSEStream: aStream filteredBy: anImportingContext [

	^ self new
		  importFromMSEStream: aStream filteredBy: anImportingContext;
		  yourself
]

{ #category : #meta }
MooseModel class >> metamodel [

	^ metamodel ifNil: [ self resetMetamodel ]
]

{ #category : #'instance creation' }
MooseModel class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
MooseModel class >> ownerOf: element [
	"Answer the MooseModel which includes element.   
 
	We used to store the owning model in an instance variable, but benchmarks 
	have shown that this solution is fast enough. With the new implementation, 
	MooseModel uses a dedicated data-structure to keep track of its element's 
	IDs, see DictionaryStorage>>computeRanges. The main bottleneck as of now 
	is the enumeration if all instances, hence, as a work around, we keep 
	track of the most recent owner."

	^ element mooseID
		ifNotNil: [ :elementID | 
			MostRecentOwner ifNotNil: [ :model | (model includesID: elementID) ifTrue: [ ^ model ] ].
			self allInstances detect: [ :model | model includesID: elementID ] ifFound: [ :model | MostRecentOwner := model ] ifNone: [ nil ] ]
]

{ #category : #meta }
MooseModel class >> packagesToProcessToCreateMetamodel [
	| packages |
	packages := Set with: self package.
	packages addAll: (self allSubmetamodelsPackagesNames collect: #asPackage).
	packages addAll: (self defaultPackagesToProcessWith: packages).
	^ packages
]

{ #category : #meta }
MooseModel class >> resetMetamodel [
	metamodel := FMMetaModelBuilder metamodelFromPackages: self packagesToProcessToCreateMetamodel.

	"MooseEntity has a cache for some infos. When we regenerate a MM we need to flush this cache."
	metamodel classes do: [ :fm3Class | fm3Class implementingClass resetMooseEntityCache ].
	
	self allInstancesDo: [ :model | model updateMetamodelTo: metamodel ].

	^ metamodel
]

{ #category : #accessing }
MooseModel class >> resetMetamodels [
	<script>
	self allSubclassesDo: #resetMetamodel
]

{ #category : #meta }
MooseModel class >> resetMetamodelsAdditionalProperties [
	<script>
	self allSubclassesDo: [ :each | each metamodel cleanAdditionalProperties ]
]

{ #category : #'root model' }
MooseModel class >> resetRoot [
	<script>
	MooseModelRoot resetRoot
]

{ #category : #'root model' }
MooseModel class >> root [
	^ MooseModelRoot root
]

{ #category : #'instance creation' }
MooseModel class >> sourceLanguage: aSourceLanguage [
	^ self new
		sourceLanguage: aSourceLanguage;
		yourself
]

{ #category : #'entity collection' }
MooseModel >> add: anElement [ 
	 
	super add: anElement.
	anElement privateSetMooseModel: self.
	self announcer announce: (MooseEntityAdded new entity: anElement).
	^anElement
]

{ #category : #'entity collection' }
MooseModel >> addAll: entities [ 
	 
	entities do: [:each | self add: each]. 
	^entities
]

{ #category : #'entity collection' }
MooseModel >> addNoAnnounce: anElement [

	self entityStorage add: anElement.
	self flush.
	anElement privateSetMooseModel: self.
	^ anElement
]

{ #category : #'dead code' }
MooseModel >> allBehaviouralsWithDeadCode [
	<navigation: 'All behaviourals with dead code'>
	^ self lookUpPropertyNamed: #allBehaviouralsWithDeadCode computedAs: [ self computeAllBehaviouralsWithDeadCode ]
]

{ #category : #accessing }
MooseModel >> allRootContainers [
	^ self allModelContainers select: #isRoot
]

{ #category : #'import-export' }
MooseModel >> asMSEString [

	^ String streamContents: [ :stream | self exportToMSEStream: stream ]
]

{ #category : #groups }
MooseModel >> cacheMooseGroups [
	<menuItem: 'Cache groups' category: 'Utilities'>
	| selectors |
	self flush.
	selectors := self navigationSelectors.
	MooseCustomTask
		runWithProgress: [ :bar | 
			selectors
				do: [ :sel | 
					self perform: sel.
					bar increment ] ]
		description: ('Caching <1p> groups in Moose model' expandMacrosWith: selectors size)
		length: selectors size
]

{ #category : #'dead code' }
MooseModel >> computeAllBehaviouralsWithDeadCode [
	^ self allModelBehaviourals select: #isDead
]

{ #category : #metrics }
MooseModel >> computeNumberOfLinesOfCode [
	^ self allRootContainers sum: #numberOfLinesOfCode
]

{ #category : #'dead code' }
MooseModel >> deadCodeRate [
	^ self
		lookUpPropertyNamed: #deadCodeRate
		computedAs: [ self allBehaviouralsWithDeadCode size / self allModelBehaviourals size ]
]

{ #category : #'import-export' }
MooseModel >> detectEncodingOfAllFileAnchors [

	"I can be execute to reduce the time of detection of the encoding of each file anchor because multiple file anchor can point to the same file."

	(((self allUsing: FamixTFileAnchor) asOrderedCollection reject:
		  #privateHasEncoding) groupedBy: #fileName) valuesDo: [ :anchors |
		| encoding |
		encoding := anchors anyOne detectEncoding.
		anchors do: [ :anchor | anchor encoding: encoding ] ]
]

{ #category : #'set operations' }
MooseModel >> difference: aGroup [ 
	 
	| result | 
	result := MooseGroup withAll: (self entities difference: aGroup entities). 
	result description: self description , '  subtracted with ' , aGroup description. 
	^result
]

{ #category : #'import-export' }
MooseModel >> exportMetamodelTo: aStream [

	self
		deprecated: 'Renamed to specify the format.'
		transformWith: '`@receiver exportMetamodelTo: `@arg'
			-> '`@receiver exportMetamodelToMSEStream: `@arg'.

	self metamodel exportMetamodelToMSEStream: aStream
]

{ #category : #'import-export' }
MooseModel >> exportMetamodelToMSEStream: aStream [

	self metamodel exportToMSEStream: aStream
]

{ #category : #'import-export' }
MooseModel >> exportTo: aStream [

	self
		deprecated:
		'Please specify the format you want to export to. Default is MSE. JSON is also available.'
		transformWith:
		'`@model exportTo: `@stream'
		-> '`@model exportToMSEStream: `@stream'.

	self exportToMSEStream: aStream
]

{ #category : #'import-export' }
MooseModel >> exportToJSONStream: aStream [

	self detectEncodingOfAllFileAnchors.
	self exportWithMetamodelUsingPrinter: (FMJSONPrinter on: aStream)
]

{ #category : #'import-export' }
MooseModel >> exportToMSEStream: aStream [

	self detectEncodingOfAllFileAnchors.
	self exportWithMetamodelUsingPrinter: (FMMSEPrinter on: aStream)
]

{ #category : #'import-export' }
MooseModel >> exportWithMetamodelUsingPrinter: aPrinter [

	(FMModel withMetamodel: self metamodel)
		addAll: self entities;
		exportWithPrinter: aPrinter
]

{ #category : #accessing }
MooseModel >> factory [
	^ self class factory
]

{ #category : #actions }
MooseModel >> flushPrivateState [
	"Clean the private state caches of all the entities of the model. This will not impact attributes in the private state (informations you cannot derive)"

	self entities do: #flush displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #'import-export' }
MooseModel >> importFrom: aFMModel named: aString [

	self silentlyAddAll: aFMModel elements.
	self name: aString
]

{ #category : #'import-export' }
MooseModel >> importFromJSON [

	| file |
	file := UIManager default
		        chooseExistingFileReference: 'Import model from JSON file'
		        extensions: #( 'json' )
		        path: FileLocator home.
	file ifNotNil: [ 
		| stream |
		stream := file readStream.
		self importFromJSONStream: stream.
		self name: file basenameWithoutExtension.
		stream close ]
]

{ #category : #'import-export' }
MooseModel >> importFromJSONStream: aStream [

	"Benchmarks
	Time millisecondsToRun: [ MooseModel new importFromJSONStream: (StandardFileStream readOnlyFileNamed: 'network3.json') ].
	Time millisecondsToRun: [ MooseModel new importFromJSONStream: (StandardFileStream readOnlyFileNamed: 'moose.json') ]. 178163 simon.denier 9/11/2009 12:29
	 23678 -> simon.denier 9/11/2009 11:36 - initial run
 	 21551 -> simon.denier 9/11/2009 12:18 - IdentityHashSet (reverted)
	 17560 -> simon_denier 9/21/2009 22:34 - removing metrics from MSE
	"

	^ self
		  importFrom:
		  (self class importFromJSON: aStream withMetamodel: self metamodel)
		  named: (aStream localName  withoutSuffix: '.json')
]

{ #category : #'import-export' }
MooseModel >> importFromJSONStream: aStream filteredBy: anImportingContext [

	^ self
		  importFrom: (self class
				   importFromJSON: aStream
				   withMetamodel: self metamodel
				   filteredBy: anImportingContext)
		  named: (aStream localName withoutSuffix: '.json')
]

{ #category : #'import-export' }
MooseModel >> importFromMSE [

	| file |
	file := UIManager default
		        chooseExistingFileReference: 'Import model from MSE file'
		        extensions: #( 'mse' )
		        path: FileLocator home.
	file ifNotNil: [ 
		| stream |
		stream := file readStream.
		self importFromMSEStream: stream.
		self name: file basenameWithoutExtension.
		stream close ]
]

{ #category : #'import-export' }
MooseModel >> importFromMSEStream: aStream [

	"Benchmarks
	Time millisecondsToRun: [ MooseModel new importFromMSEStream: (StandardFileStream readOnlyFileNamed: 'network3.mse') ].
	Time millisecondsToRun: [ MooseModel new importFromMSEStream: (StandardFileStream readOnlyFileNamed: 'moose.mse') ]. 178163 simon.denier 9/11/2009 12:29
	 23678 -> simon.denier 9/11/2009 11:36 - initial run
 	 21551 -> simon.denier 9/11/2009 12:18 - IdentityHashSet (reverted)
	 17560 -> simon_denier 9/21/2009 22:34 - removing metrics from MSE
	"

	^ self
		  importFrom:
		  (self class importFrom: aStream withMetamodel: self metamodel)
		  named: (aStream localName withoutSuffix: '.mse')
]

{ #category : #'import-export' }
MooseModel >> importFromMSEStream: aStream filteredBy: anImportingContext [

	^ self
		  importFrom: (self class
				   importFrom: aStream
				   withMetamodel: self metamodel
				   filteredBy: anImportingContext)
		  named: (aStream localName withoutSuffix: '.mse')
]

{ #category : #testing }
MooseModel >> includes: anItem [ 
	anItem ifNil: [^ false].
	^ self includesID: anItem mooseID
]

{ #category : #'Moose-DistributionMap' }
MooseModel >> includesElementsOfType: aClass [
	"self entities detect: [:each | each class = aClass] ifNone: [^ false].
	^true"

	^ (self allWithType: aClass) isNotEmpty
]

{ #category : #actions }
MooseModel >> inferNamespaceParentsBasedOnNames [
	<menuItem: 'Infer Namespace Parents Based on Names' category: 'Utilities'>
	| parent parentNameSize currentPosition parentName namespaces |
	self deprecated: 'NameSpaces do not exist in any MooseModel'.
	namespaces := self allNamespaces.
	MooseCustomTask new
		with: [ :task | 
			namespaces
				do: [ :each | 
					currentPosition := 1.
					each name: (each name copyReplaceAll: '.' with: '::').
					[ currentPosition := each name indexOf: $: startingAt: currentPosition.
					currentPosition isZero ]
						whileFalse: [ parentName := (each name copyFrom: 1 to: currentPosition - 1) asSymbol.
							namespaces
								detect: [ :x | parentName = x mooseName ]
								ifNone: [ | newNamespace |
									newNamespace := (self factory entityNamed: #Namespace ifAbsent: [ self error: 'MM should contain a concept of namespace to apply this algo' ]) new
										name: parentName.
									namespaces add: newNamespace.
									self add: newNamespace ].
							currentPosition := currentPosition + 2 ].
					task increment ].
			namespaces
				do: [ :each | 
					each belongsTo
						ifNil: [ parentNameSize := (each name lastIndexOf: $:) - 2.
							parentNameSize > 0
								ifTrue: [ parent := namespaces
										detect: [ :x | (each name copyFrom: 1 to: parentNameSize) asSymbol = x mooseName ]
										ifNone: [ nil ].
									parent
										ifNotNil: [ each name: (each name copyFrom: parentNameSize + 3 to: each name size) asSymbol.
											each parentNamespace: parent ] ] ].
					task increment ] ]
			description: 'Infer namespace parents based on names'
			length: namespaces size * 2;
		runWithProgress.
	^ self allNamespaces
]

{ #category : #initialization }
MooseModel >> initialize [
	super initialize.
	name := self class undefinedName. 
	self metamodel: self class metamodel
]

{ #category : #actions }
MooseModel >> install [ 

	^ self installWithCache: true
]

{ #category : #actions }
MooseModel >> installWithCache: aBoolean [

	aBoolean
		ifTrue: [	self cacheMooseGroups ].
	^ MooseModel root add: self
]

{ #category : #'set operations' }
MooseModel >> intersection: aGroup [ 
	 
	| result | 
	result := MooseGroup withAll: (self entities intersection: aGroup entities). 
	result description: self description , '  intersected with ' , aGroup description. 
	^result
]

{ #category : #testing }
MooseModel >> isMooseModel [
	^ true
]

{ #category : #accessing }
MooseModel >> localMooseModel [ 
	 
	^self
]

{ #category : #accessing }
MooseModel >> metamodel [

	^ metamodel ifNil: [ MooseModel metamodel ]
]

{ #category : #accessing }
MooseModel >> metamodel: anObject [
	metamodel := anObject
]

{ #category : #accessing }
MooseModel >> mooseDescription [
	^ self mooseDescriptionFor: self class
]

{ #category : #accessing }
MooseModel >> mooseDescriptionFor: class [

	^ self metamodel fmTypeOf: class instanceSide
]

{ #category : #accessing }
MooseModel >> mooseModel [
	"Answer the containing moose model of self, if any."

	^ self attributeAt: #privateModel ifAbsent: [ nil ]
]

{ #category : #accessing }
MooseModel >> name [ 
	 
	^name
]

{ #category : #accessing }
MooseModel >> name: aStringOrSymbol [
	| oldName |
	oldName := name.
	name := aStringOrSymbol.
	(oldName isNotNil and: [ oldName ~= name ])
		ifTrue: [ self resetMooseName.
			self announcer announce: (MooseEntityRenamed new oldName: oldName) ]
]

{ #category : #metrics }
MooseModel >> numberOfClasses [
	<FMProperty: #numberOfClasses type: #Number>
	<FMComment: 'The number of classes'>
	
	^self
		lookUpPropertyNamed: #numberOfClasses
		computedAs: [ self allClasses size ]
]

{ #category : #metrics }
MooseModel >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of lines of code of the project.'>
	^ self lookUpPropertyNamed: #numberOfLinesOfCode computedAs: [ self computeNumberOfLinesOfCode ]
]

{ #category : #metrics }
MooseModel >> numberOfLinesOfCodePerClass [
	<FMProperty: #numberOfLinesOfCodePerClass type: #Number>
	<FMComment: 'The number of lines of code per class in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCodePerClass
		computedAs: [ self numberOfLinesOfCode / self numberOfClasses ]
]

{ #category : #accessing }
MooseModel >> privateSetMooseModel: aMooseModel [
	self attributeAt: #privateModel put: aMooseModel
]

{ #category : #actions }
MooseModel >> remove [

	^ MooseModel root remove: self
]

{ #category : #'entity collection' }
MooseModel >> remove: anElement [
	self entityStorage remove: anElement.
	anElement privateSetMooseModel: nil.
	self flush.
	self announcer announce: (MooseEntityRemoved new entity: anElement).
	^ anElement
]

{ #category : #'entity collection' }
MooseModel >> removeAll [
	"It may look ineficient.
	However, it allows to remove all entities correctly. 
	Setting the mooseModel of all entities at nil.
	And we can iterate over the same collection (ie entityStorage)."

	self entities
		do: [ :anElement | 
			anElement privateSetMooseModel: nil.
			self flush.
			self announcer announce: (MooseEntityRemoved new entity: anElement) ].
	self entityStorage removeAll
]

{ #category : #'entity collection' }
MooseModel >> removeAll: collection [ 
	 collection do: [:each | self remove: each]. 
]

{ #category : #'entity collection' }
MooseModel >> removeModelNamed: aStringOrSymbol [

	| el |
	el := self entityStorage elements detect: [:each | each name = aStringOrSymbol asSymbol] ifNone: [nil].
	el ifNotNil: [self entityStorage remove: el.
				el privateSetMooseModel: nil.].
	^el
]

{ #category : #accessing }
MooseModel >> rootFolder [
	^ self attributeAt: #rootFolder ifAbsent: [ Smalltalk imageDirectory asFileReference / 'src' / self name ]
]

{ #category : #accessing }
MooseModel >> rootFolder: aString [
	^ self attributeAt: #rootFolder put: aString
]

{ #category : #'entity collection' }
MooseModel >> silentlyAdd: anElement [

	self suspendAllAnnouncementsDuring: [ ^ self add: anElement ]
]

{ #category : #'entity collection' }
MooseModel >> silentlyAddAll: entities [

	entities do: [ :each | self addNoAnnounce: each ].
	^ entities
]

{ #category : #'entity collection' }
MooseModel >> silentlyRemove: anElement [ 
	
	self suspendAllAnnouncementsDuring: [^self remove: anElement].
]

{ #category : #'entity collection' }
MooseModel >> silentlyRemoveAll: collection [

	collection do: [ :each | self silentlyRemove: each ].
	^ collection
]

{ #category : #'set operations' }
MooseModel >> union: aGroup [ 
	 
	| result | 
	result := MooseGroup withAll: (self entities asSet union: aGroup entities asSet). 
	result description: self description , '  and ' , aGroup description. 
	^result
]

{ #category : #initialization }
MooseModel >> updateMetamodelTo: aMetamodel [
	metamodel ifNil: [ ^ self ].

	self metamodel: aMetamodel
]
