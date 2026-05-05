"
I implement a Metamodel generator visitor, aiming to give a UML code usable with plantUML (http://plantuml.com).

I accumulate in a stream the content you'll have to put in a file and run through plantUml.

subclass #MetamodelGenerator , and try me! (print the last line)

b :=  aMetamodelGeneratorSubClass builderWithDefinitions.
v :=  FmxMBPlantTextVisitor new.
b acceptVisitor: v.
v contents

"
Class {
	#name : 'FmxMBPlantTextVisitor',
	#superclass : 'FmxMBVisitor',
	#instVars : [
		'stream',
		'relations',
		'gatherTraits',
		'behaviors',
		'mergeTraits',
		'generalizationDefinitions',
		'typedProperties',
		'traitsWithUsers',
		'withAllTraits'
	],
	#category : 'Famix-MetamodelBuilder-Core-Visitors',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Visitors'
}

{ #category : 'private' }
FmxMBPlantTextVisitor >> behaviorNameOrNilFor: aBehavior [
	^ behaviors associations detect: [ :each | each value includes: aBehavior ] ifFound: [ :foundAssociation | foundAssociation key ] ifNone: [ nil ]
]

{ #category : 'accessing' }
FmxMBPlantTextVisitor >> behaviors [
	^ behaviors
]

{ #category : 'checking' }
FmxMBPlantTextVisitor >> checkTrait: aTrait [

	^ (traitsWithUsers includes: aTrait) and: [ (aTrait builder classes flatCollect: [ :each | each traitGeneralizations ]) includes: aTrait ]
]

{ #category : 'accessing' }
FmxMBPlantTextVisitor >> contents [

	^ stream contents
]

{ #category : 'private' }
FmxMBPlantTextVisitor >> ensureBehaviorNameFor: aBehavior [

	^ (self behaviorNameOrNilFor: aBehavior)
		ifNil: [ self registerNewBehavior: aBehavior ]
]

{ #category : 'accessing' }
FmxMBPlantTextVisitor >> gatherTraits [
	^ gatherTraits
]

{ #category : 'accessing' }
FmxMBPlantTextVisitor >> gatherTraits: anObject [
	gatherTraits := anObject
]

{ #category : 'initialization' }
FmxMBPlantTextVisitor >> initialize [
	super initialize.

	stream := '' writeStream.
	relations := IdentitySet new.
	gatherTraits := false.
	behaviors := Dictionary new.
	mergeTraits := true.
	generalizationDefinitions := OrderedCollection new.
	typedProperties := OrderedCollection new.
	traitsWithUsers := Set new.
	withAllTraits := false.
]

{ #category : 'private' }
FmxMBPlantTextVisitor >> mergeTrait: aTrait withBehaviorNamed: aBehaviorName [

	(behaviors at: aBehaviorName) add: aTrait.
	
	
	
]

{ #category : 'accessing' }
FmxMBPlantTextVisitor >> mergeTraits [
	^ mergeTraits
]

{ #category : 'accessing' }
FmxMBPlantTextVisitor >> mergeTraits: anObject [
	mergeTraits := anObject
]

{ #category : 'private' }
FmxMBPlantTextVisitor >> onlySingleUserOf: aTrait [

	^ (aTrait builder classes count: [ :aClass |
			   | traits |
			   traits := aClass traitGeneralizations.
			   traits size = 1 and: [ traits anyOne = aTrait ] ]) = 1
]

{ #category : 'private' }
FmxMBPlantTextVisitor >> recordGeneralizationsForClass: aClass mergingTraits: mergesTrait [

	aClass superclass ifNotNil: [ :superclass | generalizationDefinitions add: superclass -> aClass ].
	mergesTrait ifFalse: [
		aClass traitGeneralizations ifNotEmpty: [ :generalizations |
			generalizations do: [ :generalization | generalizationDefinitions add: generalization -> aClass ] ] ]
]

{ #category : 'visiting' }
FmxMBPlantTextVisitor >> recordGeneralizationsForTrait: aTrait [

		aTrait traitGeneralizations do: [ :generalization |
				generalizationDefinitions add: (generalization -> aTrait)]
	
	
]

{ #category : 'private' }
FmxMBPlantTextVisitor >> registerNewBehavior: aBehavior [

	| key |

	key := 'behavior', (behaviors size + 1) asString.
	behaviors at: key put: (Set with: aBehavior).
	^ key
	
	
]

{ #category : 'private' }
FmxMBPlantTextVisitor >> selectTraitsWithUsersFrom: aBuilder [

	^ traitsWithUsers := aBuilder classes flatCollect: [:each | each traitGeneralizations] as: Set
]

{ #category : 'visiting' }
FmxMBPlantTextVisitor >> visitBuilder: aBuilder [

	stream
		nextPutAll: '@startuml';
		cr;
		cr;
		nextPutAll: 'hide empty members';
		cr;
		cr.
	self gatherTraits ifTrue: [
			stream
				nextPutAll: 'together {';
				cr ].
	self selectTraitsWithUsersFrom: aBuilder.
	aBuilder traits do: [ :each | each acceptVisitor: self ].
	self gatherTraits ifTrue: [
			stream
				nextPutAll: '}';
				cr ].
	aBuilder sortedClasses do: [ :each | each acceptVisitor: self ].
	self writeGeneralizations.
	self writeRelations.
	stream
		cr;
		nextPutAll: '@enduml';
		cr
]

{ #category : 'visiting' }
FmxMBPlantTextVisitor >> visitClass: aClass [

	| mergesTrait | 
	mergesTrait := self mergeTraits 
		and: [ aClass traitGeneralizations size = 1 
		and: [ self onlySingleUserOf: aClass traitGeneralizations first ]].
	
	self writeClass: aClass mergingTraits: mergesTrait.

	self recordGeneralizationsForClass: aClass mergingTraits: mergesTrait. 

]

{ #category : 'visiting' }
FmxMBPlantTextVisitor >> visitRelationSide: aRelationSide [

	relations add: aRelationSide
]

{ #category : 'visiting' }
FmxMBPlantTextVisitor >> visitTrait: aTrait [

	| behaviorKey |
	withAllTraits
		ifFalse: [ (self checkTrait: aTrait) ifFalse: [ ^ self ] ]
		ifTrue: [ self recordGeneralizationsForTrait: aTrait ].

	behaviorKey := self ensureBehaviorNameFor: aTrait.

	(self onlySingleUserOf: aTrait) ifTrue: [ self writeSingleUseOf: aTrait ].

	self writeTraitBeginningOf: aTrait with: behaviorKey.

	aTrait propertiesAndRelations do: [ :each | each acceptVisitor: self ].

	self writeTraitEnd
]

{ #category : 'visiting' }
FmxMBPlantTextVisitor >> visitTypedProperty: aTypedProperty [

	stream 
		tab; 
		nextPutAll: '+ '; 
		nextPutAll: aTypedProperty propertyType; 
		space; 
		nextPutAll: aTypedProperty name; 
		cr. 
]

{ #category : 'public - configuration' }
FmxMBPlantTextVisitor >> withAllTraits [
	withAllTraits := true.
]

{ #category : 'public - configuration' }
FmxMBPlantTextVisitor >> withoutAllTraits [
	withAllTraits := false.
]

{ #category : 'private' }
FmxMBPlantTextVisitor >> writeClass: aClass mergingTraits: mergesTraits [

	| behaviorKey displayedName |

	displayedName := aClass name.

	mergesTraits
	ifTrue: [ 
		(self behaviorNameOrNilFor:	aClass traitGeneralizations first)
				ifNil: [ behaviorKey := self ensureBehaviorNameFor: aClass.
					self mergeTrait: aClass traitGeneralizations first withBehaviorNamed: behaviorKey. ]
				ifNotNil: [ :key |
					behaviorKey := key.
					self mergeTrait: aClass withBehaviorNamed: behaviorKey. ].
	
		displayedName := displayedName, ' / ', aClass traitGeneralizations first name ]
	ifFalse: [ behaviorKey := self ensureBehaviorNameFor: aClass].

	stream 
		nextPutAll: 'class ';
		nextPutAll: behaviorKey;
		nextPutAll: ' as "';
		nextPutAll: displayedName;
		nextPutAll: '" {'; cr.

	aClass propertiesAndRelations do: [ :each | each acceptVisitor: self ].
	
	mergesTraits	ifTrue: [ 
		| defs |
		defs := typedProperties select: [ :each | each key = aClass traitGeneralizations first ].
		defs do: [ :assoc | 
			stream nextPutAll: assoc value ] ].

	stream nextPutAll: '}'; cr; cr.
	
]

{ #category : 'relations' }
FmxMBPlantTextVisitor >> writeGeneralizations [

	generalizationDefinitions do: [ :each |
			stream
				nextPutAll: (self ensureBehaviorNameFor: each key);
				nextPutAll: ' <|-- ';
				nextPutAll: (self ensureBehaviorNameFor: each value);
				cr ].
	stream cr
]

{ #category : 'relations' }
FmxMBPlantTextVisitor >> writeRelations [

	| isContainer |
	relations do: [ :relation |
			stream
				nextPutAll: (self ensureBehaviorNameFor: relation relatedEntity);
				nextPutAll: ' "';
				nextPutAll: relation oppositeSide name;
				space;
				nextPutAll: relation oppositeSide shortCardinalityString;
				space;
				nextPutAll: '"'.

			isContainer := relation isContainer or: [ relation oppositeSide isContainer ].

			stream space.
			relation oppositeSide isContainer ifTrue: [ stream nextPutAll: 'o' ].

			isContainer
				ifTrue: [ stream nextPutAll: '-[#red]-' ]
				ifFalse: [ stream nextPutAll: '-[#black]-' ].

			relation isContainer ifTrue: [ stream nextPutAll: 'o' ].
			stream space.

			stream
				nextPutAll: '"';
				nextPutAll: relation name;
				space;
				nextPutAll: relation shortCardinalityString;
				space;
				nextPutAll: '" ';
				nextPutAll: (self ensureBehaviorNameFor: relation oppositeSide relatedEntity);
				cr ]
]

{ #category : 'writing' }
FmxMBPlantTextVisitor >> writeSingleUseOf: aTrait [

	| savedStream |
	savedStream := stream.
	stream := String new writeStream.
	aTrait propertiesAndRelations do: [ :each | each acceptVisitor: self ].
	typedProperties add: aTrait -> stream contents.
	stream := savedStream.
	^ self
]

{ #category : 'writing' }
FmxMBPlantTextVisitor >> writeTraitBeginningOf: aTrait with: aBehaviorKey [
	stream
		nextPutAll: 'class ';
		nextPutAll: aBehaviorKey;
		nextPutAll: ' as "';
		nextPutAll: aTrait name;
		nextPutAll: '" << (T,orchid) >> {';
		cr.
]

{ #category : 'writing' }
FmxMBPlantTextVisitor >> writeTraitEnd [
	stream
		nextPutAll: '}';
		cr;
		cr
]
