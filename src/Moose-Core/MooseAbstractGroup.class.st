"
AbstractGroup is an entity that offers the basic mechanism for managing multiple entities. It is also the superclass of MooseModel.

It stores the contained entities in a storage variable that points to a MooseGroupStorage strategy.


"
Class {
	#name : #MooseAbstractGroup,
	#superclass : #MooseObject,
	#traits : 'TMooseGroupDependencyQueries',
	#classTraits : 'TMooseGroupDependencyQueries classTrait',
	#instVars : [
		'storage'
	],
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseAbstractGroup class >> annotation [
	<FMClass: #AbstractGroup super: #MooseObject>
	<package: #Moose>
	<abstract>

]

{ #category : #'instance creation' }
MooseAbstractGroup class >> with: anEntity [
	^ anEntity
		ifNil: [ self new ]
		ifNotNil: [ self withAll: (Array with: anEntity) ]
]

{ #category : #'instance creation' }
MooseAbstractGroup class >> withAll: aCollection [
	"Create a new collection containing all the elements from aCollection."

	^ self basicNew
		  initializeWithAll: aCollection;
		  yourself
]

{ #category : #'set operations' }
MooseAbstractGroup >> & aCollection [
	^ self intersection: aCollection
]

{ #category : #'set operations' }
MooseAbstractGroup >> \ aCollection [
	^ self difference: aCollection
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> add: anItem [
	self entityStorage add: anItem.
	self flush.
	^ anItem
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> addAll: aCollectionOfItems [ 
	^ self subclassResponsibility
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> addLast: anEntity [ 
	 
	^self add: anEntity
]

{ #category : #accessing }
MooseAbstractGroup >> allContainers [
	<navigation: 'All containers'>
	^ self lookUpPropertyNamed: #allContainers computedAs: [ self entities select: #isContainerEntity ]
]

{ #category : #groups }
MooseAbstractGroup >> allMatching: aClassOrTrait [
	"I return the list of entities of the type of the parameter, be it a class or a trait."

	^ aClassOrTrait allMatchingSelfIn: self
]

{ #category : #accessing }
MooseAbstractGroup >> allModelContainers [
	<navigation: 'All model containers'>
	^ self lookUpPropertyNamed: #allModelContainers computedAs: [ self computeAllModelContainers ]
]

{ #category : #groups }
MooseAbstractGroup >> allModels [ 
	 "returns all known Models (be them MooseModels or of a subclass of it)"
	<navigation: 'All models'> 
	^self allWithSubTypesOf: MooseModel 
]

{ #category : #'public interface' }
MooseAbstractGroup >> allSatisfy: aBlock [
	^ self entities allSatisfy: aBlock
]

{ #category : #groups }
MooseAbstractGroup >> allUsing: aTrait [
	^ self allUsing: aTrait ofGroupClass: MooseGroup 
]

{ #category : #groups }
MooseAbstractGroup >> allUsing: aTrait ofGroupClass: aGroupClass [

	^ self cacheAt: aTrait ifAbsentPut: [ aGroupClass withAll: (self rawAllUsing: aTrait) withDescription: 'All ' , aTrait name asLowercase asEnglishPlural ]
]

{ #category : #groups }
MooseAbstractGroup >> allWithSubTypesOf: aFamixClass [
	^ self allWithSubTypesOf: aFamixClass ofGroupClass: MooseGroup 
]

{ #category : #groups }
MooseAbstractGroup >> allWithSubTypesOf: aFamixClass ofGroupClass: aGroupClass [
	aFamixClass isTrait ifTrue: [ MooseAllWithTypeOnTrait signal ].
	^ self
		cacheAt: aFamixClass withAllSubclasses asSet
		ifAbsentPut: [ aGroupClass
				withAll: (aFamixClass withAllSubclasses asSet flatCollect: [ :each | self entityStorage selectAllWithType: each ])
				withDescription: 'All subtypes of ' , aFamixClass name asLowercase asEnglishPlural ]
]

{ #category : #groups }
MooseAbstractGroup >> allWithSubTypesOfAny: aCollectionOfFamixClass [

	^ (aCollectionOfFamixClass
		flatCollect: [ :aFamixClass | self allWithSubTypesOf: aFamixClass ])
		asMooseGroup
]

{ #category : #groups }
MooseAbstractGroup >> allWithType: aFamixClass [
	^ self allWithType: aFamixClass ofGroupClass: MooseGroup 
]

{ #category : #groups }
MooseAbstractGroup >> allWithType: aFamixClass ofGroupClass: aGroupClass [
	aFamixClass isTrait ifTrue: [ MooseAllWithTypeOnTrait signal ].
	^ self
		cacheAt: aFamixClass
		ifAbsentPut: [ aGroupClass withAll: (self entityStorage selectAllWithType: aFamixClass) withDescription: 'All ' , aFamixClass name asLowercase asEnglishPlural ]
]

{ #category : #accessing }
MooseAbstractGroup >> anyOne [
	 
	^self entities anyOne
]

{ #category : #'public interface' }
MooseAbstractGroup >> anySatisfy: aBlock [ 
	 
	^self entities anySatisfy: aBlock
]

{ #category : #converting }
MooseAbstractGroup >> asArray [ 
	 
	^self entityStorage asArray
]

{ #category : #converting }
MooseAbstractGroup >> asBag [
	^ self entityStorage asBag
]

{ #category : #converting }
MooseAbstractGroup >> asCollection [

	^ self entityStorage asCollection
]

{ #category : #converting }
MooseAbstractGroup >> asMooseGroup [ 
	^ self 
]

{ #category : #converting }
MooseAbstractGroup >> asOrderedCollection [ 
	^ self entityStorage asOrderedCollection
]

{ #category : #converting }
MooseAbstractGroup >> asSet [ 
	^ self entityStorage asSet
]

{ #category : #converting }
MooseAbstractGroup >> asSortedCollection [
	^ self entityStorage asSortedCollection
]

{ #category : #converting }
MooseAbstractGroup >> asSortedCollection: aSortBlock [
	^ self entityStorage asSortedCollection: aSortBlock 
]

{ #category : #accessing }
MooseAbstractGroup >> at: anIndex [
	^ self entities at: anIndex
]

{ #category : #accessing }
MooseAbstractGroup >> at: anIndex ifAbsent: aBlock [

	^ self entities at: anIndex ifAbsent: aBlock
]

{ #category : #'public interface' }
MooseAbstractGroup >> average: aSymbolOrBlock [ 
	 
	^ (self sumNumbers: aSymbolOrBlock) / self size
]

{ #category : #iterators }
MooseAbstractGroup >> basicIterator [
	^ self entityStorage basicIterator
]

{ #category : #enumerating }
MooseAbstractGroup >> collect: aBlock [ 
	^ self entities collect: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> collect: aBlock as: aClass [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into an instance of aClass. Answer the resulting collection."

	^ (aClass new: self size) fillFrom: self with: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> collect: collectBlock thenReject: selectBlock [
	"Utility method to improve readability."

	^ (self collect: collectBlock) reject: selectBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> collect: aBlockCollect thenSelect: aBlockThenSelect [

	^ self entities collect: aBlockCollect thenSelect: aBlockThenSelect
]

{ #category : #enumerating }
MooseAbstractGroup >> collectAsSet: aBlock [
	^ self entities collectAsSet: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> collectWithIndex: aBlock [

	^ self entities
		collectWithIndex:  aBlock
]

{ #category : #accessing }
MooseAbstractGroup >> commonSuperclass [ 
	^ self entityStorage commonSuperclass
]

{ #category : #accessing }
MooseAbstractGroup >> computeAllModelContainers [
	^ self allContainers reject: #isStub
]

{ #category : #enumerating }
MooseAbstractGroup >> contains: aBlock [ 
	 
	^self entities contains: aBlock
]

{ #category : #copying }
MooseAbstractGroup >> copyWithout: anEntity [ 
	^ self entities copyWithout: anEntity
]

{ #category : #copying }
MooseAbstractGroup >> copyWithoutAll: mooseEntities [

	^ self entities copyWithoutAll: mooseEntities
]

{ #category : #enumerating }
MooseAbstractGroup >> count: aBlock [ 
	 
	| count | 
	count := 0. 
	self do: [:each | (aBlock value: each) ifTrue: [count := count + 1]]. 
	^count
]

{ #category : #enumerating }
MooseAbstractGroup >> detect: aBlock [

	^ self entities detect: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> detect: aBlock ifFound: anotherBlock [

	^ self entities detect: aBlock ifFound: anotherBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> detect: aBlock ifFound: foundBlock ifNone: noneBlock [

	^ self entities 
		detect:  aBlock
		ifFound: foundBlock
		ifNone:  noneBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> detect: aBlock ifNone: anotherBlock [

	^ self entities detect: aBlock ifNone: anotherBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> detectMax: aString [

	^ self entities detectMax: aString
]

{ #category : #'entity collection' }
MooseAbstractGroup >> difference: aCollection [
	^ self species withAll: (self entities difference: aCollection)
]

{ #category : #enumerating }
MooseAbstractGroup >> do: aBlock [ 
	 
	^self entityStorage do: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> do: aBlock displayingProgress: aString [
	^ self entityStorage do: aBlock displayingProgress: aString
]

{ #category : #enumerating }
MooseAbstractGroup >> do: elementBlock separatedBy: separatorBlock [
	^ self entities do: elementBlock separatedBy: separatorBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> doWithIndex: aBlockClosure [ 
	self entities doWithIndex: aBlockClosure 
]

{ #category : #accessing }
MooseAbstractGroup >> eighth [

	^ self entities eighth
]

{ #category : #'entity collection' }
MooseAbstractGroup >> entities [
	^ self entityStorage elements
]

{ #category : #'entity collection' }
MooseAbstractGroup >> entities: aCollection [ 
	 
	self entityStorage removeAll. 
	self addAll: aCollection	"	aCollection do: [:each | self addEntity: each ]."
]

{ #category : #'entity collection' }
MooseAbstractGroup >> entitiesDo: aBlock [ 
	 
	^self entityStorage do: aBlock	"self entityDictionary keysAndValuesDo: [ :key :group | 
		group do: aBlock 
	]."
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aSymbol [ 
	 
	^self 
		entityNamed: aSymbol 
		ifAbsent: [nil]
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aMooseName ifAbsent: aBlock [ 
	^ self entityStorage at: aMooseName ifAbsent: aBlock
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aMooseName ifAbsent: aBlock ifPresent: anotherBlock [
	| entity |
	entity := self entityStorage at: aMooseName ifAbsent: [ nil ].
	^ entity ifNil: [ aBlock value ] ifNotNil: [ anotherBlock value: entity ]
]

{ #category : #'public interface' }
MooseAbstractGroup >> entityNamed: aMooseName ifAbsentPut: aValuable [
	^ self
		entityNamed: aMooseName
		ifAbsent: [ | entity |
			entity := aValuable value.
			self
				assert: entity mooseName = aMooseName
				description: 'The provided entity must have the same mooseName to be consistent'.
			self add: entity ]
]

{ #category : #private }
MooseAbstractGroup >> entityStorage [ 
	 
	^storage
]

{ #category : #testing }
MooseAbstractGroup >> equalsTo: aCollection [
	^ self entities equalsTo: aCollection
]

{ #category : #accessing }
MooseAbstractGroup >> fifth [

	^ self entities fifth
]

{ #category : #accessing }
MooseAbstractGroup >> first [ 
	 
	^self entities first
]

{ #category : #enumerating }
MooseAbstractGroup >> first: n [
	^ self entities first: n
]

{ #category : #enumerating }
MooseAbstractGroup >> flatCollect: aBlock [ 
	^ (self entities flatCollect: aBlock) asMooseGroup
]

{ #category : #enumerating }
MooseAbstractGroup >> flatCollectAsSet: aBlock [

	^ self entities flatCollectAsSet: aBlock
]

{ #category : #flattening }
MooseAbstractGroup >> flatten [
	"Recursively collect each non-collection element of the receiver and its descendant
	collections.  Please note, this implementation assumes that strings are to be treated
	as objects rather than as collection."

	^self gather: [ :each | each ]
]

{ #category : #enumerating }
MooseAbstractGroup >> fold: aBlock [

	^ self entities fold: aBlock
]

{ #category : #accessing }
MooseAbstractGroup >> fourth [

	^ self entities fourth
]

{ #category : #enumerating }
MooseAbstractGroup >> gather: aBlock [
	"This method is kept for compatibility reasons, use flatCollect instead."
	^ self flatCollect: aBlock.
]

{ #category : #enumerating }
MooseAbstractGroup >> groupedBy: aBlock [ 
	"we are reimplementing this method here and not reuse the one in collection
	because we want the keys to be groups, not simple collections"
	| result |
	result := Dictionary new.
	self do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [OrderedCollection new].
		collection add: each].
	result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)].

	^result
]

{ #category : #testing }
MooseAbstractGroup >> ifEmpty: emptyBlock [
	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
MooseAbstractGroup >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	self ifEmpty: [ ^ emptyBlock value ].
	^ notEmptyBlock cull: self
]

{ #category : #testing }
MooseAbstractGroup >> ifNotEmpty: aBlock [
	^ self ifEmpty: [ self ] ifNotEmpty: [ aBlock cull: self ]
]

{ #category : #testing }
MooseAbstractGroup >> ifNotEmpty: aBlockIfNotEmpty ifEmpty: aBlockIfEmpty [

	^ self entities ifEmpty: aBlockIfEmpty ifNotEmpty: aBlockIfNotEmpty
]

{ #category : #testing }
MooseAbstractGroup >> includes: anEntity [ 
	 
	^self entities includes: anEntity
]

{ #category : #testing }
MooseAbstractGroup >> includesAll: aCollection [ 
	^ self entities includesAll: aCollection
]

{ #category : #testing }
MooseAbstractGroup >> includesAllOf: aCollection [ 
	^ self entities includesAll: aCollection
]

{ #category : #'entity collection' }
MooseAbstractGroup >> includesID: elementID [ 
	 
	^self entityStorage includesID: elementID
]

{ #category : #accessing }
MooseAbstractGroup >> indexOf: aMooseEntity [

	^ self entities indexOf: aMooseEntity
]

{ #category : #initialization }
MooseAbstractGroup >> initialize [ 
	 
	super initialize.
	storage := MooseGroupStorage empty
]

{ #category : #initialization }
MooseAbstractGroup >> initializeWithAll: aCollection [

	self initialize.
	storage := MooseGroupStorage new: aCollection size.
	self addAll: aCollection
]

{ #category : #enumerating }
MooseAbstractGroup >> inject: neutral into: aBinaryBlock [ 
	 
	^self entities inject: neutral into: aBinaryBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> insertInto: aSequenceableCollection from: anInteger to: anotherInteger [ 
	^ self entities insertInto: aSequenceableCollection from: anInteger to: anotherInteger
]

{ #category : #'entity collection' }
MooseAbstractGroup >> intersection: aCollection [
	^ self species withAll: (self entities intersection: aCollection)
]

{ #category : #testing }
MooseAbstractGroup >> isCollection [ 
	 
	^true
]

{ #category : #testing }
MooseAbstractGroup >> isEmpty [ 
	 
	^self entityStorage isEmpty
]

{ #category : #testing }
MooseAbstractGroup >> isNotEmpty [
	"Answer whether the receiver contains any elements."

	^ self isEmpty not
]

{ #category : #iterators }
MooseAbstractGroup >> iterator [
	^ self entityStorage iterator
]

{ #category : #accessing }
MooseAbstractGroup >> last [ 
	 
	^self entities last
]

{ #category : #enumerating }
MooseAbstractGroup >> last: n [
	^ self entities last: n
]

{ #category : #enumerating }
MooseAbstractGroup >> maxValue: aBlock [
	^ self entities maxValue: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> minValue: aBlock [
	^ self entities minValue: aBlock
]

{ #category : #accessing }
MooseAbstractGroup >> mooseModel [
	^ self ifEmpty: [ nil ] ifNotEmpty: [ self anyOne mooseModel ]
]

{ #category : #accessing }
MooseAbstractGroup >> ninth [ 

	^ self entities ninth
]

{ #category : #testing }
MooseAbstractGroup >> notEmpty [
	^ self entities isNotEmpty
]

{ #category : #accessing }
MooseAbstractGroup >> numberOfEntityUsing: aTrait [

	^ (self rawAllUsing: aTrait) size
]

{ #category : #accessing }
MooseAbstractGroup >> numberOfItems [
	<FMProperty: #numberOfItems type: #Number>
	<FMComment: 'The total number of items in the group'>
	^ self size
]

{ #category : #enumerating }
MooseAbstractGroup >> occurrencesOf: anObject [ 
	 
	^self entities occurrencesOf: anObject
]

{ #category : #copying }
MooseAbstractGroup >> postCopy [  
	super postCopy.
	storage := storage copy. 
]

{ #category : #printing }
MooseAbstractGroup >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream print: self size.
	aStream nextPut: $)
]

{ #category : #groups }
MooseAbstractGroup >> rawAllUsing: aTrait [
	"This is an optimization of #allUsing: when we do not need to manipulate a MooseGroup as result."

	| seen |
	aTrait isTrait ifFalse: [ MooseAllUsingOnClass signal ].
	seen := IdentitySet new.
	^ Array streamContents: [ :stream |
		  aTrait allUsers flattened do: [ :directUser |
			  directUser withAllSubclasses do: [ :user |
				  (seen includes: user) ifFalse: [
					  seen add: user.
					  stream nextPutAll: (self entityStorage selectAllWithType: user) ] ] ] ]
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> readStream [
	^ self entities readStream
]

{ #category : #enumerating }
MooseAbstractGroup >> reject: aBlock [ 
	 
	^self entities reject: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> reject: rejectBlock thenCollect: collectBlock [
	^ (self reject: rejectBlock) collect: collectBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> reject: aBlockSelect thenDo: aBlockThenDo [

	^ self entities reject: aBlockSelect thenDo: aBlockThenDo
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> remove: anItem [ 
	 
	^self subclassResponsibility
]

{ #category : #'adding/removing' }
MooseAbstractGroup >> removeAll: aCollection [ 
	 
	^self subclassResponsibility
]

{ #category : #'entity collection' }
MooseAbstractGroup >> removeEntity: anEntity [
	^ self entityStorage remove: anEntity
]

{ #category : #loading }
MooseAbstractGroup >> resetMooseNameFor: anEntity [
	self entityStorage resetMooseNameFor: anEntity.
	" this is safe, but probably a bit overdone "
	self flush
]

{ #category : #accessing }
MooseAbstractGroup >> rootEntities [

	^ self propertyNamed: #rootEntities ifAbsentPut: [ self entities select: [ :entity | entity isQueryable and: [ entity isRoot ] ] ]
]

{ #category : #accessing }
MooseAbstractGroup >> second [ 
	 
	^self entities second
]

{ #category : #enumerating }
MooseAbstractGroup >> select: aBlock [ 
	 
	^self entities select: aBlock
]

{ #category : #enumerating }
MooseAbstractGroup >> select: aBlockSelect thenDo: aBlockThenDo [

	^ self entities select: aBlockSelect thenDo: aBlockThenDo
]

{ #category : #enumerating }
MooseAbstractGroup >> selectFirst: anInteger [ 
	 
	self flag: #patched. "VW uses sliceTo:, which is a copyFrom:To: with checked indices. Not the case here"
	^self class withAll: (self entities copyFrom: 1 to: anInteger)
]

{ #category : #enumerating }
MooseAbstractGroup >> selectWithNameSimilarTo: anEntity [
	^ self select: [:each | 
		each ~= anEntity and: [
			(each name pairsSimilarityWith: anEntity name) > 0.5]]
]

{ #category : #accessing }
MooseAbstractGroup >> seventh [

	^ self entities seventh
]

{ #category : #accessing }
MooseAbstractGroup >> sixth [

	^ self entities sixth
]

{ #category : #accessing }
MooseAbstractGroup >> size [	 
	^ self entityStorage size
]

{ #category : #sorting }
MooseAbstractGroup >> sorted [

	^ self entities sorted
]

{ #category : #arithmetic }
MooseAbstractGroup >> sumNumbers: aBlockClosure [ 
	^ self entities sumNumbers: aBlockClosure 
]

{ #category : #accessing }
MooseAbstractGroup >> third [ 
	 
	^self entities third
]

{ #category : #'entity collection' }
MooseAbstractGroup >> union: aCollection [
	^ self species withAll: (self entities union: aCollection)
]

{ #category : #enumerating }
MooseAbstractGroup >> with: aCollection do: aBlockClosure [ 
	^self entities with: aCollection do: aBlockClosure 
]

{ #category : #enumerating }
MooseAbstractGroup >> withIndexDo: aBlockClosure [ 
	self entities withIndexDo: aBlockClosure 
]

{ #category : #accessing }
MooseAbstractGroup >> withoutStubs [

	^ (self reject: #isStub) asMooseGroup
]

{ #category : #'set operations' }
MooseAbstractGroup >> | aCollection [
	^ self union: aCollection
]
