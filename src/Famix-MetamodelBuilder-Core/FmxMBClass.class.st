Class {
	#name : 'FmxMBClass',
	#superclass : 'FmxMBBehavior',
	#instVars : [
		'isAbstractClass',
		'propertiesForEqualityCheck',
		'superclass'
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
FmxMBClass >> allLocalTraits [
	^ self traitsFromRelations , super allLocalTraits
]

{ #category : 'accessing' }
FmxMBClass >> allSuperclasses [

	| result class g |
	result := OrderedCollection new.
	class := self.
	[
		g := class superclass.
		g isNotNil ] whileTrue: [
			result add: g.
			class := g ].
	^ result
]

{ #category : 'accessing' }
FmxMBClass >> allTransitiveTraitsIncludingSuperclasses [

	| result |
	result := super allTransitiveTraitsIncludingSuperclasses.
	self superclass ifNotNil: [ :class | result addAll: class allTransitiveTraitsIncludingSuperclasses ].
	^ result
]

{ #category : 'accessing' }
FmxMBClass >> annotationSuperclass [

	^ self superclassName
]

{ #category : 'settings - default' }
FmxMBClass >> defaultSuperclassName [
	"We have a special case with MooseObject that should inherit from Object."

	self isMooseObject ifTrue: [ ^ #Object ].

	^ #MooseEntity
]

{ #category : 'generating' }
FmxMBClass >> generate [

	self builder environment
		createClassNamed: self fullName
		superclass: self superclassName
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
FmxMBClass >> isMooseObject [

	^ self name = 'Object' and: [ self prefix = 'Moose' ]
]

{ #category : 'testing' }
FmxMBClass >> isRoot [

	self superclass ifNotNil: [ ^ false ].
	
	"We have a special case with MooseObject because we do not want to consider it as a root but it inherits from Object."
	^ self isMooseObject not
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
FmxMBClass >> remoteSuperclass [

	^ self allSuperclasses detect: #isRemote ifNone: [ nil ]
]

{ #category : 'accessing' }
FmxMBClass >> superclass [

	^ superclass
]

{ #category : 'accessing' }
FmxMBClass >> superclass: aFmxClass [
	"In the past we could have real objects here but this is not the case anymore"

	superclass ifNotNil: [
			self error:
				'Cannot have two superclasses for an entity. ' , self name , ' declared ' , superclass name , ' as superclass and try to set also ' , aFmxClass name
				, ' as second superclass.' ].
	superclass := aFmxClass.
	^ aFmxClass
]

{ #category : 'settings - default' }
FmxMBClass >> superclassName [

	^ self superclass
		  ifNil: [ self defaultSuperclassName ]
		  ifNotNil: #fullName
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
