Class {
	#name : 'FmxMBClass',
	#superclass : 'FmxMBBehavior',
	#instVars : [
		'classGeneralization',
		'isAbstractClass',
		'propertiesForEqualityCheck'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBClass >> acceptVisitor: aVisitor [
	
	<ignoreForCoverage>
	^ aVisitor visitClass: self.
]

{ #category : 'accessing' }
FmxMBClass >> allClassGeneralizations [
	| result c g |
	result := OrderedCollection new.
	c := self.
	[ g := c classGeneralization.
	g isNotNil and: [ g isKindOf: FmxMBClass ] ]
		whileTrue: [ result add: g.
			c := g ].
	^ result
]

{ #category : 'accessing' }
FmxMBClass >> allLocalTraits [
	^ self traitsFromRelations , super allLocalTraits
]

{ #category : 'accessing' }
FmxMBClass >> allTransitiveTraitsIncludingClassGeneralization [

	| result |
	result := super allTransitiveTraitsIncludingClassGeneralization.
	self classGeneralization ifNotNil: [ :class | class ~= Object ifTrue: [ result addAll: class allTransitiveTraitsIncludingClassGeneralization ] ].
	^ result
]

{ #category : 'accessing' }
FmxMBClass >> annotationSuperclass [

	^ (self classGeneralization isNil or: [ self classGeneralization = self defaultSuperclass ])
		  ifTrue: [ self defaultSuperclassName ]
		  ifFalse: [ self classGeneralization fullName ]
]

{ #category : 'accessing' }
FmxMBClass >> classGeneralization [
	^ classGeneralization
]

{ #category : 'accessing' }
FmxMBClass >> classGeneralization: anObject [
	
	classGeneralization := anObject.
	^ anObject
]

{ #category : 'generating' }
FmxMBClass >> generate [

	| superclassName |
	superclassName := self classGeneralization
		                  ifNil: [ self defaultSuperclassName ]
		                  ifNotNil: #fullName.

	self builder environment
		createClassNamed: self fullName asSymbol
		superclass: superclassName
		traitDefinitions: self allTraitDefinitions
		precedingTrait: (self additionalProperties at: #precedingTrait ifAbsent: [ nil ])
		properties: (self propertiesAndRelations select: #producesSlot)
		in: self packageName
		tag: self tag
		comment: self commentWithRelations.

	self generateAccessors.
	self generateAnnotation.
	self generateIsAbstractMethodIfNecessary.

	self generateTestingMethods.
	self generateMetamodelMethod.

	self generateAddToCollection.

	self generateEqualsMethod.
	self generateHashMethod
]

{ #category : 'generating-methods' }
FmxMBClass >> generateEqualsMethod [

	propertiesForEqualityCheck ifNotNil: [
			| code |
			code := String streamContents: [ :stream |
					        | variableName |
					        variableName := 'a' , self fullName.
					        stream << '= '.
					        stream << variableName.
					        stream << '

	<generated>
	^ '.
					        stream
						        << variableName;
						        << ' ';
						        << propertiesForEqualityCheck first;
						        << ' = self ';
						        << propertiesForEqualityCheck first.
					        propertiesForEqualityCheck size > 1 ifTrue: [
							        2 to: propertiesForEqualityCheck size do: [ :idx |
									        stream << ' and: [ '.
									        stream
										        << variableName;
										        << ' ';
										        << (propertiesForEqualityCheck at: idx);
										        << ' = self ';
										        << (propertiesForEqualityCheck at: idx) ].
							        2 to: propertiesForEqualityCheck size do: [ :idx | stream << '] ' ] ] ].

			self addMethod: code protocol: #comparing ]
]

{ #category : 'generating-methods' }
FmxMBClass >> generateHashMethod [

	propertiesForEqualityCheck ifNotNil: [
			| code |
			code := String streamContents: [ :stream |
					        stream << 'hash'.
					        stream << '

	<generated>
	^ '.
					        stream
						        << 'self ';
						        << propertiesForEqualityCheck first;
						        << ' hash '.
					        propertiesForEqualityCheck size > 1 ifTrue: [
							        2 to: propertiesForEqualityCheck size do: [ :idx |
									        stream
										        << 'bitXor: self ';
										        << (propertiesForEqualityCheck at: idx);
										        << ' hash ' ] ] ].

			self addMethod: code protocol: #comparing ]
]

{ #category : 'generating' }
FmxMBClass >> generateIsAbstractMethodIfNecessary [

	self isAbstractClass ifTrue: [
			self
				addMethod: ('isAbstract

	<generated>
	^ self == {1}' format: { self fullName })
				classSide: true
				protocol: #testing ]
]

{ #category : 'generating-methods' }
FmxMBClass >> generateMetamodelMethod [

	self isRoot ifFalse: [ ^ self ].

	self builder model ifNotNil: [ :model |
			self
				addMethod: ('metamodel

	<generated>
	^ {1} metamodel' format: { model fullName })
				classSide: true
				protocol: #meta ]
]

{ #category : 'generating' }
FmxMBClass >> generateRemotes [

	self class environment at: self fullName ifAbsent: [ ^ self ].

	(self propertiesAndRelations select: #isRemote) do: [ :each | each generateAccessorsIn: self ]
]

{ #category : 'generating-methods' }
FmxMBClass >> generateTestingMethods [

	self isRoot ifTrue: [
			| selectorsToGenerate |
			selectorsToGenerate := Set new.
			builder testingSelectorsMapping keysAndValuesDo: [ :concernedClass :selectors |
				(builder shouldGeneratorTestingMethodsOf: concernedClass in: self) ifTrue: [ selectorsToGenerate addAll: selectors ] ].

			(selectorsToGenerate difference: (self traitGeneralizations flatCollect: #testingSelectors)) do: [ :sel |
				self addMethod: (sel , '\\	<generated>\	^ false') withCRs protocol: #testing ] ].

	super generateTestingMethods
]

{ #category : 'testing' }
FmxMBClass >> isAbstractClass [

	^ isAbstractClass ifNil: [ false ]
]

{ #category : 'accessing' }
FmxMBClass >> isAbstractClass: aBoolean [

	isAbstractClass := aBoolean
]

{ #category : 'testing' }
FmxMBClass >> isMetamodelClass [

	^ true
]

{ #category : 'testing' }
FmxMBClass >> isRoot [
	^ self classGeneralization isNil
]

{ #category : 'generating' }
FmxMBClass >> optionalPragma [

	^ self isAbstractClass
		  ifTrue: [ 
			  '
	<abstract>' ]
		  ifFalse: [ super optionalPragma ]
]

{ #category : 'accessing' }
FmxMBClass >> remoteClassGeneratization [

	^ self allClassGeneralizations detect: #isRemote ifNone: [ nil ]
]

{ #category : 'generalization' }
FmxMBClass >> subclassOf: aClass [
	
	self generalization: aClass
]

{ #category : 'accessing' }
FmxMBClass >> traitsFromRelations [
	"returns traits defined by relations"

	^ (self relations
		   collect: #trait
		   thenSelect: #isNotNil) asSet
]

{ #category : 'generalization' }
FmxMBClass >> withEqualityCheckOn: aCollectionOfPropertySymbol [

	propertiesForEqualityCheck := aCollectionOfPropertySymbol
]
