Class {
	#name : 'FmxMBClass',
	#superclass : 'FmxMBBehavior',
	#instVars : [
		'superclass'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'testing' }
FmxMBClass class >> isAbstract [

	^ self = FmxMBClass
]

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

	self generateAccessors
]

{ #category : 'generating' }
FmxMBClass >> generateRemotes [

	self class environment at: self fullName ifAbsent: [ ^ self ].

	(self propertiesAndRelations select: #isRemote) do: [ :each | each generateAccessorsIn: self ]
]

{ #category : 'testing' }
FmxMBClass >> isMetamodelClass [

	^ true
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
