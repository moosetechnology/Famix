Class {
	#name : 'FmxMBBehavior',
	#superclass : 'FmxMBEntity',
	#traits : 'FmxMBRelationSideTrait',
	#classTraits : 'FmxMBRelationSideTrait classTrait',
	#instVars : [
		'tag',
		'prefix',
		'packageName',
		'testingSelectors',
		'traitGeneralizations',
		'propertiesAndRelations'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'testing' }
FmxMBBehavior class >> isAbstract [
	^ self = FmxMBBehavior
]

{ #category : 'generalization' }
FmxMBBehavior >> --|> anObject [
	self generalization: anObject.
	^ anObject
]

{ #category : 'generalization' }
FmxMBBehavior >> <|-- anObject [
	anObject generalization: self.
	^ anObject
]

{ #category : 'visiting' }
FmxMBBehavior >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitBehavioral: self
]

{ #category : 'accessing' }
FmxMBBehavior >> addAllTransitiveTraitsIn: aCollection [

	aCollection add: self.
	self allLocalTraits do: [ :trait | trait addAllTransitiveTraitsIn: aCollection ].
	^ aCollection
]

{ #category : 'accessing' }
FmxMBBehavior >> addRelation: aRelation [

	(self relations anySatisfy: [ :relation | relation name = aRelation name ]) ifTrue: [ ^ self ].

	self propertiesAndRelations add: aRelation
]

{ #category : 'accessing' }
FmxMBBehavior >> addTraitGeneralization: aTrait [

	(self traitGeneralizations includes: aTrait) ifFalse: [ self traitGeneralizations add: aTrait ].

	^ aTrait
]

{ #category : 'accessing' }
FmxMBBehavior >> allLocalTraits [
	^ self traitGeneralizations
]

{ #category : 'accessing' }
FmxMBBehavior >> allProperties [
	"Return my properties and the properties from my traits."

	^ self allPropertiesAndRelations reject: #isRelation
]

{ #category : 'accessing' }
FmxMBBehavior >> allPropertiesAndRelations [
	"Return my properties and the properties from my traits."

	^ (self allTransitiveTraits flatCollect: [ :trait | trait propertiesAndRelations ]) , self propertiesAndRelations
]

{ #category : 'accessing' }
FmxMBBehavior >> allRelations [
	"Return my relations and the relations from my traits."

	^ self allPropertiesAndRelations select: #isRelation
]

{ #category : 'accessing' }
FmxMBBehavior >> allTraitDefinitions [

	^ self allLocalTraits ifEmpty: [ #(  ) ] ifNotEmpty: [ :traits |
			  | methodsToRemove |
			  methodsToRemove := self additionalProperties at: #methodsToRemoveFromTraitComposition ifAbsent: [ Dictionary new ].

			  (traits sorted: #fullName ascending) collect: [ :trait |
					  methodsToRemove
						  at: trait fullName
						  ifPresent: [ :methods | '(' , trait fullName , ' - {' , ('. ' join: (methods collect: #printString)) , '})' ]
						  ifAbsent: [ trait fullName ] ] ]
]

{ #category : 'accessing' }
FmxMBBehavior >> allTransitiveTraits [

	^ self addAllTransitiveTraitsIn: Set new
]

{ #category : 'accessing' }
FmxMBBehavior >> allTransitiveTraitsIncludingSuperclasses [

	^ self allTransitiveTraits
]

{ #category : 'converting' }
FmxMBBehavior >> asRelationNamed: aPropertyName [

	^ self property: aPropertyName
]

{ #category : 'accessing' }
FmxMBBehavior >> commentWithRelations [
	"It is sometimes hard to find our way through all the methods and relations of a moose entity. To help, I add information in the class comments about the different kind of relations in the model."

	^ String streamContents: [ :aStream |
			  self comment ifNotEmpty: [
					  aStream
						  nextPutAll: self comment;
						  cr;
						  cr ].
			  self allRelations ifNotEmpty: [ :relations |
					  aStream
						  nextPutAll: '## Relations
======================';
						  cr;
						  cr.
					  self relationSectionsToCommentMap keysAndValuesDo: [ :sectionTitle :selectionBlock |
							  (relations select: selectionBlock) ifNotEmpty: [ :selectedRelations |
									  aStream
										  nextPutAll: '### ';
										  nextPutAll: sectionTitle;
										  cr;
										  nextPutAll: '| Relation | Origin | Opposite | Type | Comment |';
										  cr;
										  nextPutAll: '|---|';
										  cr.
									  (selectedRelations sorted: #name ascending) do: [ :relation |
											  aStream
												  nextPutAll: '| `';
												  nextPutAll: relation name;
												  nextPutAll: '` | `';
												  nextPutAll: relation type;
												  nextPutAll: '` | `';
												  nextPutAll: relation oppositeName;
												  nextPutAll: '` | `';
												  nextPutAll: relation oppositeType;
												  nextPutAll: '` | ';
												  nextPutAll: (relation comment copyWithRegex: (String with: Character cr with: $+) matchesReplacedWith: ' ');
												  nextPut: $|;
												  cr ].

									  aStream cr ] ].
					  aStream cr ].

			  self allProperties ifNotEmpty: [ :props |
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
								  nextPutAll: (property comment copyWithRegex: (String with: Character cr with: $+) matchesReplacedWith: ' ');
								  nextPut: $|;
								  cr ] ] ]
]

{ #category : 'settings - default' }
FmxMBBehavior >> defaultTag [

	^ #Entities
]

{ #category : 'accessing' }
FmxMBBehavior >> fullName [
	^ (self prefix , self name) asSymbol
]

{ #category : 'accessing' }
FmxMBBehavior >> generalization: anObject [

	self isRemote ifTrue: [ self error: 'It is not possible to add a generalization to a remote entity.' ].
	^ anObject isSymbol
		  ifTrue: [ self addTraitGeneralization: (self builder getTraitNamed: anObject) ]
		  ifFalse: [
				  anObject isMetamodelTrait
					  ifTrue: [ self addTraitGeneralization: anObject ]
					  ifFalse: [ self superclass: anObject ] ]
]

{ #category : 'generalization' }
FmxMBBehavior >> inheritsFromTrait: aTrait without: aCollection [
	self --|> aTrait.
	(self additionalProperties at: #methodsToRemoveFromTraitComposition ifAbsentPut: [ Dictionary new ])
		at:
			(aTrait isString
				ifTrue: [ builder getTraitNamed: aTrait ]
				ifFalse: [ aTrait ]) fullName
		put: aCollection
]

{ #category : 'initialization' }
FmxMBBehavior >> initialize [

	super initialize.
	propertiesAndRelations := OrderedCollection new.
	prefix := ''.
	packageName := ''.
	testingSelectors := Set new
]

{ #category : 'testing' }
FmxMBBehavior >> isAbstractClass [

	^ false
]

{ #category : 'testing' }
FmxMBBehavior >> isEntityCreatorTrait [

	^ false
]

{ #category : 'testing' }
FmxMBBehavior >> isMetamodelClass [

	^ false
]

{ #category : 'testing' }
FmxMBBehavior >> isMetamodelClassGroup [

	^ false
]

{ #category : 'testing' }
FmxMBBehavior >> isMetamodelTrait [

	^ false
]

{ #category : 'testing' }
FmxMBBehavior >> isModelClass [
	"The class prefix, Model"
	^ false
]

{ #category : 'accessing' }
FmxMBBehavior >> packageName [
	^ packageName
]

{ #category : 'accessing' }
FmxMBBehavior >> packageName: anObject [
	packageName := anObject
]

{ #category : 'utilities' }
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

{ #category : 'private' }
FmxMBBehavior >> pluralPropertyName [

	^ self pluralOf: self name uncapitalized
]

{ #category : 'accessing' }
FmxMBBehavior >> prefix [
	^ prefix
]

{ #category : 'accessing' }
FmxMBBehavior >> prefix: anObject [
	prefix := anObject
]

{ #category : 'printing' }
FmxMBBehavior >> printOn: aStream [
	<ignoreForCoverage>
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: self name asString;
		nextPut: $)
]

{ #category : 'accessing' }
FmxMBBehavior >> properties [

	^ propertiesAndRelations reject: #isRelation
]

{ #category : 'accessing' }
FmxMBBehavior >> propertiesAndRelations [

	^ propertiesAndRelations
]

{ #category : 'associations' }
FmxMBBehavior >> property: propertyName [

	| aSide |
	
	self assert: propertyName isString.
	
	aSide := FmxMBRelation new
		builder: self builder;
		relatedClass: self;
		name: propertyName;
		yourself.
		
	self addRelation: aSide.
	^ aSide.
]

{ #category : 'accessing' }
FmxMBBehavior >> property: propertyName type: aTypeName [

	| aSide |
	aSide := FmxMBTypedProperty new
		         builder: self builder;
		         name: propertyName;
		         isRemote: self isRemote;
		         propertyType: aTypeName asSymbol;
		         yourself.

	self propertiesAndRelations add: aSide.

	^ aSide
]

{ #category : 'accessing' }
FmxMBBehavior >> property: propertyName type: aTypeName defaultValue: aValue [

	| aSide |
	aSide := FmxMBTypedProperty new
		         builder: self builder;
		         name: propertyName;
		         isRemote: self isRemote;
		         propertyType: aTypeName asSymbol;
		         defaultValue: aValue;
		         yourself.

	self propertiesAndRelations add: aSide.

	^ aSide
]

{ #category : 'private' }
FmxMBBehavior >> propertyName [
	^ self name uncapitalized
]

{ #category : 'accessing' }
FmxMBBehavior >> relatedEntityName [

	^ self name
]

{ #category : 'accessing' }
FmxMBBehavior >> relationSectionsToCommentMap [
	"When generating a class comment, we group the relations by kind. This method builds a dictionary to declare the sections to comment and declare how to select the relations inside."

	^ OrderedDictionary new
		  at: 'Parents' put: [ :relation | relation isContainer ];
		  at: 'Children' put: [ :relation | relation oppositeSide isContainer ];
		  at: 'Outgoing dependencies' put: [ :relation | relation oppositeSide isSource ];
		  at: 'Incoming dependencies' put: [ :relation | relation oppositeSide isTarget ];
		  at: 'Association source' put: [ :relation | relation isSource ];
		  at: 'Association target' put: [ :relation | relation isTarget ];
		  at: 'Other' put: [ :relation |
				  relation isTarget not and: [
							  relation isSource not and: [
									  relation isContainer not and: [
											  relation oppositeSide isTarget not and: [ relation oppositeSide isSource not and: [ relation oppositeSide isContainer not ] ] ] ] ] ];
		  yourself
]

{ #category : 'accessing' }
FmxMBBehavior >> relations [

	^ self propertiesAndRelations select: #isRelation
]

{ #category : 'name conversion' }
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

{ #category : 'associations' }
FmxMBBehavior >> source: aFmxTrait [
	"By default, a source property is *-"

	self sourceManyToOne: aFmxTrait
]

{ #category : 'associations' }
FmxMBBehavior >> sourceManyToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source
	*-* (aFmxTrait property: #outgoing , self name asEnglishPlural)
]

{ #category : 'associations' }
FmxMBBehavior >> sourceManyToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source
	*- (aFmxTrait property: #outgoing , self name asEnglishPlural)
]

{ #category : 'associations' }
FmxMBBehavior >> sourceOneToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source -* (aFmxTrait property: #outgoing , self name)
]

{ #category : 'associations' }
FmxMBBehavior >> sourceOneToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		source - (aFmxTrait property: #outgoing , self name)
]

{ #category : 'accessing' }
FmxMBBehavior >> superclassName [
	"Trait do not have a superclass but they declare one for the fame annotation"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FmxMBBehavior >> tag [
	^ tag ifNil: [ self defaultTag ]
]

{ #category : 'accessing' }
FmxMBBehavior >> tag: aSymbol [

	tag := aSymbol
]

{ #category : 'associations' }
FmxMBBehavior >> target: aFmxTrait [
	"By default, a source property is *-"

	self targetManyToOne: aFmxTrait
]

{ #category : 'associations' }
FmxMBBehavior >> targetManyToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target
	*-* (aFmxTrait property: #incoming , self name asEnglishPlural)
]

{ #category : 'associations' }
FmxMBBehavior >> targetManyToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target
	*- (aFmxTrait property: #incoming , self name asEnglishPlural)
]

{ #category : 'associations' }
FmxMBBehavior >> targetOneToMany: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target -* (aFmxTrait property: #incoming , self name)
]

{ #category : 'associations' }
FmxMBBehavior >> targetOneToOne: aFmxTrait [

	(self property: (aFmxTrait name copyWithoutFirst: $T) uncapitalized)
		target - (aFmxTrait property: #incoming , self name)
]

{ #category : 'testing selectors' }
FmxMBBehavior >> testingSelector: aSelector [

	testingSelectors add: aSelector.
]

{ #category : 'testing selectors' }
FmxMBBehavior >> testingSelectors [

	^ testingSelectors
]

{ #category : 'testing selectors' }
FmxMBBehavior >> testingSelectors: aCollection [

	testingSelectors := aCollection
]

{ #category : 'accessing' }
FmxMBBehavior >> traitGeneralizations [

	^ traitGeneralizations ifNil: [ traitGeneralizations := OrderedCollection new ]
]

{ #category : 'testing selectors' }
FmxMBBehavior >> withGroup [

	^ (self builder newClassGroupNamed: self name , 'Group')
		  innerClass: self;
		  yourself
]

{ #category : 'generalization' }
FmxMBBehavior >> withPrecedenceOf: aTrait [

	self additionalProperties at: #precedingTrait put: (aTrait isSymbol
			 ifTrue: [ (self builder getTraitNamed: aTrait) fullName ]
			 ifFalse: [ aTrait fullName ])
]

{ #category : 'testing selectors' }
FmxMBBehavior >> withTesting [

	"adds methods like #isMethod based on the behavior name"

	| aName |
	
	aName := self name capitalized.
	
	"remove T (for traits)"
	((aName size >= 2) and: [( aName first = $T ) and: [ aName second isUppercase ]])
		ifTrue: [ aName := aName allButFirst ].
		
	testingSelectors add: 'is', aName.
]
