Class {
	#name : #FmxMBBehavior,
	#superclass : #FmxMBEntity,
	#traits : 'FmxMBRelationSideTrait',
	#classTraits : 'FmxMBRelationSideTrait classTrait',
	#instVars : [
		'relations',
		'realClass',
		'properties',
		'tag',
		'prefix',
		'packageName',
		'testingSelectors',
		'traitGeneralizations'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #testing }
FmxMBBehavior class >> isAbstract [
	^ self = FmxMBBehavior
]

{ #category : #generalization }
FmxMBBehavior >> --|> anObject [
	self generalization: anObject.
	^ anObject
]

{ #category : #generalization }
FmxMBBehavior >> <|-- anObject [
	anObject generalization: self.
	^ anObject
]

{ #category : #accessing }
FmxMBBehavior >> addAllTransitiveTraitsIn: aCollection [

	aCollection add: self.
	self allLocalTraits do: [ :trait | trait addAllTransitiveTraitsIn: aCollection ].
	^ aCollection
]

{ #category : #accessing }
FmxMBBehavior >> addRelation: aRelation with: anotherClass [

	self relations add: aRelation.
	anotherClass relations add: aRelation oppositeRelation
	
	
]

{ #category : #accessing }
FmxMBBehavior >> addRelationSide: aRelationSide [

	"skip duplicities"
	(self sides anySatisfy: [ :each | each  name = aRelationSide name ])
		ifTrue: [ ^ self ].

	self sides add: aRelationSide
]

{ #category : #accessing }
FmxMBBehavior >> addTraitGeneralization: aTrait [

	(self traitGeneralizations includes: aTrait)
		ifFalse: [ self traitGeneralizations add: aTrait ].
		
	^ aTrait
]

{ #category : #accessing }
FmxMBBehavior >> allLocalTraits [
	^ self traitGeneralizations
]

{ #category : #accessing }
FmxMBBehavior >> allNavigationGroups [
	^ self navigationGroups , (self relations flatCollect: [ :relation | relation side navigationGroups ])
]

{ #category : #accessing }
FmxMBBehavior >> allProperties [
	"Return my properties and the properties from my traits."

	^ (self allTransitiveTraits flatCollect: [ :trait | trait properties ]) , self properties
]

{ #category : #accessing }
FmxMBBehavior >> allRelations [
	"Return my relations and the relations from my traits."

	^ (self allTransitiveTraits flatCollect: [ :trait | trait relations ]) , self relations
]

{ #category : #accessing }
FmxMBBehavior >> allTraitNames [
	^ (self allLocalTraits collect: #fullName) sorted
]

{ #category : #accessing }
FmxMBBehavior >> allTransitiveTraits [

	^ self addAllTransitiveTraitsIn: Set new
]

{ #category : #accessing }
FmxMBBehavior >> allTransitiveTraitsIncludingClassGeneralization [

	^ self allTransitiveTraits
]

{ #category : #converting }
FmxMBBehavior >> asRelationSideNamed: aPropertyName [

	^ self property: aPropertyName
]

{ #category : #accessing }
FmxMBBehavior >> classGeneralization [
	^ self subclassResponsibility
]

{ #category : #accessing }
FmxMBBehavior >> classGeneralization: anObject [
	^ self subclassResponsibility
]

{ #category : #accessing }
FmxMBBehavior >> commentWithRelations [
	"It is sometimes hard to find our way through all the methods and relations of a moose entity. To help, I add information in the class comments about the different kind of relations in the model."

	^ String streamContents: [ :aStream |
		  aStream nextPutAll: self comment.
		  self comment ifNotEmpty: [
			  aStream
				  cr;
				  cr ].
		  self allRelations ifNotEmpty: [ :rels |
			  aStream
				  nextPutAll: '## Relations
======================';
				  cr;
				  cr.
			  OrderedDictionary new
				  at: 'Parents' put: [ :relation | relation side isContainer ];
				  at: 'Children' put: [ :relation | relation oppositeSide isContainer ];
				  at: 'Outgoing dependencies' put: [ :relation | relation oppositeSide isSource ];
				  at: 'Incoming dependencies' put: [ :relation | relation oppositeSide isTarget ];
				  at: 'Association source' put: [ :relation | relation side isSource ];
				  at: 'Association target' put: [ :relation | relation side isTarget ];
				  at: 'Other' put: [ :relation |
					  relation side isTarget not and: [
							  relation side isSource not and: [
									  relation side isContainer not and: [
											  relation oppositeSide isTarget not and: [ relation oppositeSide isSource not and: [ relation oppositeSide isContainer not ] ] ] ] ] ];
				  keysAndValuesDo: [ :relationKind :selectionBlock |
					  (rels select: selectionBlock) ifNotEmpty: [ :parents |
							  aStream
								  nextPutAll: '### ';
								  nextPutAll: relationKind;
								  cr;
								  nextPutAll: '| Relation | Origin | Opposite | Type | Comment |';
								  cr;
								  nextPutAll: '|---|';
								  cr.
							  (parents sorted: [ :parent | parent side generationStrategy relationSide name ] ascending) do: [ :parent |
								  | strategy |
								  strategy := parent side generationStrategy.

								  aStream
									  nextPutAll: '| `';
									  nextPutAll: strategy relationSide name;
									  nextPutAll: '` | `';
									  nextPutAll: strategy relationSide type;
									  nextPutAll: '` | `';
									  nextPutAll: strategy relationSide oppositeName;
									  nextPutAll: '` | `';
									  nextPutAll: strategy relationSide oppositeType;
									  nextPutAll: '` | ';
									  nextPutAll: (strategy relationSide comment
											   copyWithRegex: (String with: Character cr with: $+)
											   matchesReplacedWith: ' ');
									  nextPut: $|;
									  cr ].

							  aStream cr ] ].
			  aStream cr ].

		  (self allProperties reject: [ :p | p isRelation ]) ifNotEmpty: [ :props |
			  aStream
				  nextPutAll: '## Properties
======================';
				  cr;
				  cr;
				  nextPutAll: '| Name | Type | Default value | Comment |';
				  cr;
				  nextPutAll: '|---|';
				  cr.

			  (props sorted: #name ascending) do: [ :property |
				  aStream
					  nextPutAll: '| `';
					  nextPutAll: property name;
					  nextPutAll: '` | `';
					  nextPutAll: property propertyType;
					  nextPutAll: '` | ';
					  print: property defaultValue;
					  nextPutAll: ' | ';
					  nextPutAll: (property comment
							   copyWithRegex: (String with: Character cr with: $+)
							   matchesReplacedWith: ' ');
					  nextPut: $|;
					  cr ] ] ]
]

{ #category : #'settings - default' }
FmxMBBehavior >> defaultSuperclass [
	^ self builder environment basicSuperclass
]

{ #category : #generating }
FmxMBBehavior >> defaultSuperclassName [
	^ self defaultSuperclass name
]

{ #category : #'settings - default' }
FmxMBBehavior >> defaultTag [
	^ self builder configuration classTag
]

{ #category : #generating }
FmxMBBehavior >> ensureRealClass [
	^ realClass
		ifNil: [ self generate.
			self willGenerate: false.
			self realClass ]
]

{ #category : #accessing }
FmxMBBehavior >> fullName [
	^ (self prefix , self name) asSymbol
]

{ #category : #accessing }
FmxMBBehavior >> generalization: anObject [
	^ anObject isSymbol
		ifTrue: [ self addTraitGeneralization: (self builder getTraitNamed: anObject) ]
		ifFalse: [ anObject isMetamodelTrait ifTrue: [ self addTraitGeneralization: anObject ] ifFalse: [ self classGeneralization: anObject ] ]
]

{ #category : #generating }
FmxMBBehavior >> generate [
	^ self subclassResponsibility
]

{ #category : #generating }
FmxMBBehavior >> generateAccessors [
	self properties do: [ :each | each generateAccessorsIn: self realClass ]
]

{ #category : #generating }
FmxMBBehavior >> generateAddToCollectionFor: aClass [
	self relations
		collect: #side
		thenDo: [ :side | 
			side isMany
				ifTrue: [ | sideName |
					sideName := side name.
					self builder environment
						compile:
							('add{1}: anObject
	<generated>
	^ self {2} add: anObject' format: {sideName capitalized asSingular . sideName})
						in: aClass instanceSide
						classified: #adding ] ]
]

{ #category : #generating }
FmxMBBehavior >> generateAnnotationIn: aRealClass superclass: aSuperclass [

	| aSuperclassName |
	aSuperclassName := aSuperclass
		                   ifNotNil: [ aSuperclass name ]
		                   ifNil: [ 
			                   self classGeneralization
			                   = self defaultSuperclass
				                   ifTrue: [ self defaultSuperclassName ]
				                   ifFalse: [ 
					                   self classGeneralization
						                   ifNil: [ self defaultSuperclassName ]
						                   ifNotNil: [ :cg | cg realClass name ] ] ].

	aRealClass classSide
		compile: ('annotation

	<FMClass: #{1} super: #{2}>
	<package: {3}>
	<generated>{4}
	^ self' format: { 
					 self name.
					 aSuperclassName.
					 self builder safeAnnotationPackageName.
					 self optionalPragma })
		classified: 'meta'
]

{ #category : #generating }
FmxMBBehavior >> generateMethodsToRemoveFromTraitCompositionFor: aBehavioral [
	"In case of method conflict the user can select methods to remove from a trait. In that case we give the information to ring here."

	self additionalProperties
		at: #methodsToRemoveFromTraitComposition
		ifPresent: [ :methodsDictionary |
			aBehavioral
				propertyNamed: #methodsToRemoveFromTraitComposition
				put: methodsDictionary ]
]

{ #category : #generating }
FmxMBBehavior >> generateNavigationGroupsFor: aClass [
	self allNavigationGroups
		do: [ :aNavigationGroup | 
			| sideName |
			sideName := aNavigationGroup entity name.

			self builder environment
				compile:
					((aNavigationGroup entity isMany
						ifTrue: [ '{1}
	<generated>
	<navigation: ''{2}''>
	^ MooseSpecializedGroup withAll: self {3} asSet' ]
						ifFalse: [ '{1}
	<generated>
	<navigation: ''{2}''>
	^ MooseSpecializedGroup with: self {3}' ]) format: {(sideName , 'Group') . sideName capitalized . sideName})
				in: aClass instanceSide
				classified: #navigation ]
]

{ #category : #generating }
FmxMBBehavior >> generatePrecedenceInTraitComposition: aBehavioral [
	"In case of method conflict the user can select methods to remove from a trait. In that case we give the information to ring here."

	self additionalProperties
		at: #precedingTrait
		ifPresent: [ :value |
			aBehavioral
				propertyNamed: #precedingTrait
				put: value ]
]

{ #category : #generating }
FmxMBBehavior >> generateRemoteAccessors [
	(self properties select: #isRemote) do: [ :each | each generateAccessorsIn: self realClass ]
]

{ #category : #generating }
FmxMBBehavior >> generateTestingMethodsIn: aClass [

	self testingSelectors do: [ :aSelector |
		aClass instanceSide compile: ('{1}\\	<generated>\	^ true' withCRs format: { aSelector }) 
		classified: #testing. ]


]

{ #category : #generalization }
FmxMBBehavior >> inheritsFromTrait: aTrait without: aCollection [
	self --|> aTrait.
	(self additionalProperties at: #methodsToRemoveFromTraitComposition ifAbsentPut: [ Dictionary new ])
		at:
			(aTrait isString
				ifTrue: [ builder getTraitNamed: aTrait ]
				ifFalse: [ aTrait ]) fullName
		put: aCollection
]

{ #category : #initialization }
FmxMBBehavior >> initialize [
	super initialize.
	relations := OrderedCollection new.
	properties := OrderedCollection new.
	prefix := ''.
	packageName := ''.
	testingSelectors := Set new
]

{ #category : #testing }
FmxMBBehavior >> isEntityCreatorTrait [

	^ false
]

{ #category : #testing }
FmxMBBehavior >> isMetamodelClass [

	^ false
]

{ #category : #testing }
FmxMBBehavior >> isMetamodelClassGroup [

	^ false
]

{ #category : #testing }
FmxMBBehavior >> isMetamodelTrait [

	^ false
]

{ #category : #testing }
FmxMBBehavior >> isModelClass [
	"The class prefix, Model"
	^ false
]

{ #category : #generating }
FmxMBBehavior >> optionalPragma [

	"Override to add a pragma to your entity #annotation method"

	^ String new
]

{ #category : #accessing }
FmxMBBehavior >> packageName [
	^ packageName
]

{ #category : #accessing }
FmxMBBehavior >> packageName: anObject [
	packageName := anObject
]

{ #category : #utilities }
FmxMBBehavior >> pluralOf: aString [

	| stringParts pluralized |
	
	stringParts := aString splitOnLastNumber.
	
	pluralized := (stringParts first endsWith: 's')
		ifFalse: [ 
			(stringParts first endsWith: 'y')
				ifTrue: [ stringParts first allButLast, 'ies' ]
				ifFalse: [ stringParts first, 's' ]  ]
		ifTrue: [ stringParts first, 'es' ].
		
	^ pluralized, stringParts second.
]

{ #category : #private }
FmxMBBehavior >> pluralPropertyName [

	^ self pluralOf: self name uncapitalized
]

{ #category : #accessing }
FmxMBBehavior >> prefix [
	^ prefix
]

{ #category : #accessing }
FmxMBBehavior >> prefix: anObject [
	prefix := anObject
]

{ #category : #generating }
FmxMBBehavior >> printOn: aStream [
	<ignoreForCoverage>
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: self name asString;
		nextPut: $)
]

{ #category : #accessing }
FmxMBBehavior >> properties [
	^ properties
]

{ #category : #generating }
FmxMBBehavior >> property: propertyName [

	| aSide |
	
	self assert: propertyName isString.
	
	aSide := FmxMBRelationSide new
		builder: self builder;
		relatedClass: self;
		name: propertyName;
		yourself.
		
	self addRelationSide: aSide.
	^ aSide.
]

{ #category : #accessing }
FmxMBBehavior >> property: propertyName type: aTypeName [
	| aSide |
	aSide := FmxMBTypedProperty new
		builder: self builder;
		name: propertyName;
		propertyType: aTypeName asSymbol;
		yourself.

	self properties add: aSide.

	^ aSide
]

{ #category : #accessing }
FmxMBBehavior >> property: propertyName type: aTypeName defaultValue: aValue [ 
	| aSide |
	aSide := FmxMBTypedProperty new
		builder: self builder;
		name: propertyName;
		propertyType: aTypeName asSymbol;
		defaultValue: aValue;
		yourself.

	self properties add: aSide.

	^ aSide
]

{ #category : #private }
FmxMBBehavior >> propertyName [
	^ self name uncapitalized
]

{ #category : #accessing }
FmxMBBehavior >> realClass [

	^ realClass ifNil: [ self class environment at: self fullName  ]
]

{ #category : #accessing }
FmxMBBehavior >> realClass: anObject [
	realClass := anObject
]

{ #category : #accessing }
FmxMBBehavior >> relatedEntityName [

	^ self name
]

{ #category : #accessing }
FmxMBBehavior >> relations [
	^ relations
]

{ #category : #accessing }
FmxMBBehavior >> sides [
	^ self properties
]

{ #category : #'name conversion' }
FmxMBBehavior >> singularPropertyName [

	| normalizedName uncapitalized |
	
	normalizedName := ((self name size >= 2) 
		and: [ ((self name first:2) allSatisfy: #isUppercase)
		and: [ self name beginsWith: 'T' ] ])
			ifTrue: [ self name withoutPrefix: 'T' ]
			ifFalse: [ self name ].	
	
	uncapitalized := normalizedName uncapitalized.
	
	^ uncapitalized

]

{ #category : #generating }
FmxMBBehavior >> slotDefinitions [
	| slotGroups |
	slotGroups := (self properties select: #producesSlot thenCollect: [ :property | property asSlot ]) groupedBy: #name.

	"check that all slots with the same name have the same properties"
	slotGroups valuesDo: [ :similarSlots | self assert: (similarSlots collect: #name) asSet size = 1 ].

	^ slotGroups values collect: [ :each | each anyOne ]
]

{ #category : #associations }
FmxMBBehavior >> source: aFmxTrait [
	"By default, a source property is *-"

	self sourceManyToOne: aFmxTrait
]

{ #category : #associations }
FmxMBBehavior >> sourceManyToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source
	*-* (aFmxTrait property: #outgoing , self name asEnglishPlural)
]

{ #category : #associations }
FmxMBBehavior >> sourceManyToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source
	*- (aFmxTrait property: #outgoing , self name asEnglishPlural)
]

{ #category : #associations }
FmxMBBehavior >> sourceOneToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source -* (aFmxTrait property: #outgoing , self name)
]

{ #category : #associations }
FmxMBBehavior >> sourceOneToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source - (aFmxTrait property: #outgoing , self name)
]

{ #category : #accessing }
FmxMBBehavior >> tag [
	^ tag ifNil: [ self defaultTag ]
]

{ #category : #accessing }
FmxMBBehavior >> tag: aSymbol [

	tag := aSymbol
]

{ #category : #associations }
FmxMBBehavior >> target: aFmxTrait [
	"By default, a source property is *-"

	self targetManyToOne: aFmxTrait
]

{ #category : #associations }
FmxMBBehavior >> targetManyToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target
	*-* (aFmxTrait property: #incoming , self name asEnglishPlural)
]

{ #category : #associations }
FmxMBBehavior >> targetManyToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target
	*- (aFmxTrait property: #incoming , self name asEnglishPlural)
]

{ #category : #associations }
FmxMBBehavior >> targetOneToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target -* (aFmxTrait property: #incoming , self name)
]

{ #category : #associations }
FmxMBBehavior >> targetOneToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target - (aFmxTrait property: #incoming , self name)
]

{ #category : #'testing selectors' }
FmxMBBehavior >> testingSelector: aSelector [

	testingSelectors add: aSelector.
]

{ #category : #'testing selectors' }
FmxMBBehavior >> testingSelectors [

	^ testingSelectors
]

{ #category : #'testing selectors' }
FmxMBBehavior >> testingSelectors: aCollection [

	testingSelectors := aCollection
]

{ #category : #accessing }
FmxMBBehavior >> traitGeneralizations [

	^ traitGeneralizations ifNil: [ traitGeneralizations := OrderedCollection new ]
]

{ #category : #accessing }
FmxMBBehavior >> uses: aTrait [

	^ self generalization: aTrait
]

{ #category : #'testing selectors' }
FmxMBBehavior >> withGroup [
	^ self builder groupOf: self
]

{ #category : #generalization }
FmxMBBehavior >> withPrecedenceOf: aTrait [
	self additionalProperties
		at: #precedingTrait
		put:
			(aTrait isSymbol
				ifTrue: [ (self builder getTraitNamed: aTrait) fullName ]
				ifFalse: [ aTrait fullName ])
]

{ #category : #'testing selectors' }
FmxMBBehavior >> withTesting [

	"adds methods like #isMethod based on the behavior name"

	| aName |
	
	aName := self name capitalized.
	
	"remove T (for traits)"
	((aName size >= 2) and: [( aName first = $T ) and: [ aName second isUppercase ]])
		ifTrue: [ aName := aName allButFirst ].
		
	testingSelectors add: 'is', aName.
]
