"
Description
--------------------

I am an abstract class defining the basic behavior of Moose objects.

Moose Object have a variable #entityAttributes to store information that cannot be computed and that has no variable dedicated (allows to save memory and to make entities more extensible).
They also have a cache to speed up most algos. 
They are initialized with an ID. The ID should be unique inside an image. This means that when we export and re-import an entity, the ID can change.

Note: (Cyril F) In the future I would like to push down mooseID on MooseEntity becaure I think that groups should not have an ID, but we need to refactor some things to do that.


Extension mechanism
--------------------

The entityAttribute instance variable provides a mechanism for extending the state of entities. Using this mechanism, a package can extend an entity to add more state. This extension will only be visible when the package is loaded. This is an important mechanism to enable extensibility and modularity. 

For example, if you have YourEntity that subclasses MooseEntity, you can extend it with:

YourEntity>>yourExtendingAttribute
	^ self attributeAt: #yourExtendingAttribute
YourEntity>>yourExtendingAttribute: aValue
	^ self attributeAt: #yourExtendingAttribute put: aValue

Public API and Key Messages
--------------------

- mooseDescription - returns the corresponding FM3Class instance
- mooseName - returns a symbol that should qualify the current entity. It does not have to be unique
- mooseID is an Integer that uniquely identifies this entity within the entire Moose environment. 
	It should not change nor be nil. It is generated automatically during the creation of the MooseEntity.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	cache:						<aDictionary>	A dictionary useful to cache some values long to compute.
	entityAttributes:		<anArray>			A collection used as an extension mecanism of the MooseObject. It allows to store more info for an entity.
	mooseID:					<anInteger>		The unique ID of the object in Moose.
	mooseName:				<aString>			Name of teh entity in Moose. Should be unique in the MooseModel in the case of FamixTNamedEntity.
						
						
Attributes is a collection keeping for a key a certain value. Attributes will never be flushed, they should stay except if the user explicitly remove them!
attributes uses an array and low level code for performences reasons.

Cached properties/result is just a cache associating anything to a symbol. This cache should not contain anything that cannot be recomputed because it can be flushed.


"
Class {
	#name : #MooseObject,
	#superclass : #Object,
	#instVars : [
		'mooseID',
		'mooseName',
		'cache',
		'entityAttributes'
	],
	#classVars : [
		'MooseID'
	],
	#classInstVars : [
		'cache'
	],
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseObject class >> allDeclaredProperties [
	"All properties described in the metamodel"

	^ self mooseDescription allProperties
]

{ #category : #accessing }
MooseObject class >> allPropertySelectors [
	"Return a dictionary with all properties of this kind of entity, including metamodel properties, metrics, and navigation groups. Keys are abstract names of properties, values are implementing selectors"

	| props |
	props := IdentityDictionary new.
	self allDeclaredProperties do: [ :prop | props at: prop name put: prop implementingSelector ].
	self navigationPragmas do: [ :p | props at: p selector put: p selector ].
	^ props
]

{ #category : #meta }
MooseObject class >> annotation [
	<FMClass: #Object super: #Object>
	<package: #Moose>
	<abstract>
]

{ #category : #accessing }
MooseObject class >> cache [
	^ cache ifNil: [ self initializeCache ]
]

{ #category : #private }
MooseObject class >> freshID [
	"Answer a fresh ID, which is unique within Moose."

	nil == MooseID ifTrue: [ MooseID := 0 ].
	MooseID := 1 + MooseID.
	MooseID > SmallInteger maxVal
		ifTrue: [ Notification
				signal:
					'Moose''s internal element IDs are exceeding the range of SmallInteger, '
						, 'this may cause system slow down.<n> Please contact moose-dev@iam.unibe.ch for more information.' ].
	^ MooseID
]

{ #category : #accessing }
MooseObject class >> initializeCache [
	"Usually we use #at:ifAbsentPut: to declare new properties, but in MooseQuery to reduce too much the perfs to instantiate the block as second argument. Thus, we initialize this info direction at the cache creation and use a simple #at: instead"

	^ cache := SmallDictionary new
		at: #usedStatefulTraits put: super usedStatefulTraits;
		at: #superclassesAndFamixTraits put: super usedStatefulTraits , self withAllSuperclasses;
		yourself
]

{ #category : #testing }
MooseObject class >> isAbstract [
	^ self = MooseObject
]

{ #category : #testing }
MooseObject class >> isOfType: aClassFAMIX [
	^ self superclassesAndFamixTraits includes: aClassFAMIX
]

{ #category : #accessing }
MooseObject class >> navigationPragmas [
	^ Pragma allNamed: #navigation: from: self to: MooseObject
]

{ #category : #accessing }
MooseObject class >> relatedGroupType [
	" The entities can specify what is the prefered type of MooseGroup they want to be stored in.
	They do that using a class side method with uniqueName that contains pragma <mooseGroup>. 
	Because such methods are stored mostly in traits and a class can have more than prefered group
	type, the most specialize one selected."

	| definingMethods selectedMethods selectedMethod |
	definingMethods :=(Pragma allNamed: #mooseGroup from: self class to: Object) collect: #method.
	definingMethods ifEmpty: [ ^ MooseSpecializedGroup ].

	"We need to find the most specialized method, so we select the lower in the hierarchy."
	selectedMethods := definingMethods groupedBy: [ :each | each methodClass withAllSuperclasses size ].
	selectedMethods := selectedMethods at: selectedMethods keys max.

	"In case multiple of such methods are found, we take the one that is the closest to be a local method. This means that if a method come from a trait of the class, it will be selected over a method that comes from a trait of a trait."
	selectedMethod := (selectedMethods sorted: [ :method1 :method2 | method1 origin allTraits includes: method2 origin ]) first.
	^ self perform: selectedMethod selector
]

{ #category : #private }
MooseObject class >> resetIDGeneration [ 
	"Resets the internal ID generation." 
	 
	MooseID := nil
]

{ #category : #initialization }
MooseObject class >> resetMooseEntityCache [
	cache := nil
]

{ #category : #private }
MooseObject class >> setMooseID: anInteger [
	"This method is used in the unit test"
	
	MooseID := anInteger 
]

{ #category : #testing }
MooseObject class >> superclassesAndFamixTraits [
	^ self cache directAt: #superclassesAndFamixTraits
]

{ #category : #accessing }
MooseObject class >> undefinedName [

	^ #noname
]

{ #category : #testing }
MooseObject class >> usedStatefulTraits [
	^ self cache directAt: #usedStatefulTraits
]

{ #category : #accessing }
MooseObject >> allCachedValues [
	^ cache values
]

{ #category : #'meta information' }
MooseObject >> allDeclaredProperties [
	"Do not use the class side version

This method allows us to look for its properties in the metadescription.
And, the metadescription might be different in the instance and in the class side since we can define for each instance its metamodel (with more or less properties)"
	^ self mooseDescription allProperties
]

{ #category : #'meta information' }
MooseObject >> allPropertySelectors [
	^ self class allPropertySelectors
]

{ #category : #private }
MooseObject >> announcer [
	^ self attributeAt: #announcer ifAbsentPut: [ Announcer new ]
]

{ #category : #private }
MooseObject >> announcer: anAnnouncer [
	^ self attributeAt: #announcer put: anAnnouncer
]

{ #category : #accessing }
MooseObject >> attributeAt: name ifAbsent: aBlock [
	1 to: entityAttributes size do: [ :n | name == (entityAttributes at: n) key ifTrue: [ ^ (entityAttributes at: n) value ] ].
	^ aBlock value
]

{ #category : #accessing }
MooseObject >> attributeAt: name ifAbsentPut: aBlock [
	1 to: entityAttributes size do: [ :n | name == (entityAttributes at: n) key ifTrue: [ ^ (entityAttributes at: n) value ] ].
	entityAttributes := entityAttributes copyWith: name -> aBlock value.
	^ entityAttributes last value
]

{ #category : #accessing }
MooseObject >> attributeAt: name put: value [
	1 to: entityAttributes size do: [ :n | name == (entityAttributes at: n) key ifTrue: [ ^ (entityAttributes at: n) value: value ] ].
	entityAttributes := entityAttributes copyWith: name -> value.
	^ entityAttributes last value
]

{ #category : #accessing }
MooseObject >> cacheAt: name ifAbsent: aBlock [
	^ cache at: name ifAbsent: [ aBlock value ]
]

{ #category : #accessing }
MooseObject >> cacheAt: name ifAbsent: absentBlock ifPresent: presentBlock [
	^ cache at: name ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : #accessing }
MooseObject >> cacheAt: name ifAbsentPut: aBlock [
	^ cache at: name ifAbsentPut: aBlock
]

{ #category : #accessing }
MooseObject >> cacheAt: name ifPresent: aBlock [
	^ cache at: name ifPresent: [ :value | aBlock cull: value ]
]

{ #category : #accessing }
MooseObject >> cacheAt: name ifPresent: presentBlock ifAbsentPut: aBlock [
	^ cache at: name ifPresent: presentBlock ifAbsentPut: aBlock
]

{ #category : #accessing }
MooseObject >> cacheAt: name put: value [
	^ cache at: name put: value
]

{ #category : #accessing }
MooseObject >> description [
	^ self attributeAt: #privateDescription ifAbsent: [ self mooseName , ' (' , self mooseDescription name , ')' ]
]

{ #category : #accessing }
MooseObject >> description: text [
	self attributeAt: #privateDescription put: text
]

{ #category : #printing }
MooseObject >> displayFullString [
	"Return a name corresponding to the moose name but also for the associations instead of returning #noname"

	^ String streamContents: [ :stream | self displayFullStringOn: stream ]
]

{ #category : #printing }
MooseObject >> displayFullStringOn: aStream [
	self mooseNameOn: aStream
]

{ #category : #printing }
MooseObject >> displayStringOn: aStream [
	self mooseNameOn: aStream
]

{ #category : #accessing }
MooseObject >> entityAttributes [
	^ entityAttributes
]

{ #category : #accessing }
MooseObject >> entityCache [
	^ cache
]

{ #category : #initialization }
MooseObject >> flush [
	cache initialize
]

{ #category : #groups }
MooseObject >> groupFor: aSelector [
	"Return a group containing elements corresponding to aSelector"

	"aSelector = allPackages, allClasses, allMethods, ... "

	^ MooseSpecializedGroup
		withAll: (self perform: aSelector) asCollection
		withDescription: aSelector asString capitalized , ' in ' , self mooseName
]

{ #category : #testing }
MooseObject >> hasMooseModel [
	^ self mooseModel isNotNil
]

{ #category : #testing }
MooseObject >> includesKey: selector [
	^ cache includesKey: selector
]

{ #category : #initialization }
MooseObject >> initialize [
	super initialize.

	mooseID := self class freshID.
	self resetPrivateState
]

{ #category : #printing }
MooseObject >> inspectorToString [

	^ String streamContents: [ :s | self displayStringOn: s ]
]

{ #category : #testing }
MooseObject >> isMooseModel [
	^ false
]

{ #category : #testing }
MooseObject >> isMooseObject [
	^ true
]

{ #category : #testing }
MooseObject >> isOfType: aClassFAMIX [
	^ self class isOfType: aClassFAMIX
]

{ #category : #accessing }
MooseObject >> localMooseModel [
	^ self mooseModel
]

{ #category : #properties }
MooseObject >> lookUpPropertyNamed: selector computedAs: aBlock [
	^ self cacheAt: selector ifAbsentPut: aBlock
]

{ #category : #accessing }
MooseObject >> metamodel [
	^ self mooseModel
		ifNil: [ super metamodel ]
		ifNotNil: [ :aModel | aModel metamodel ]

]

{ #category : #inspector }
MooseObject >> miInspectionFame: aBuilder [

	<inspectorPresentationOrder: 3 title: 'Fame'>
	^ aBuilder newTable
		  items: self mooseDescription allComplexProperties;
		  sortingBlock: #fullName ascending;
		  addColumn:
			  (SpStringTableColumn
				   title: 'Name'
				   evaluated: [ :item | item name ]) beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'Type'
				   evaluated: [ :item | item type name ]) beSortable;
		  addColumn:
			  (SpStringTableColumn title: 'Opposite' evaluated: [ :item |
					   item opposite
						   ifNil: [ '' ]
						   ifNotNil: [ :opposite | opposite name ] ]) beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'Derived?'
				   evaluated: [ :item | item isDerived ]) beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'Container?'
				   evaluated: [ :item | item isContainer ]) beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'IsTarget?'
				   evaluated: [ :item | item isTarget ]) beSortable;
		  addColumn: (SpStringTableColumn
				   title: 'IsSource?'
				   evaluated: [ :item | item isSource ]) beSortable;
		  beResizable
]

{ #category : #accessing }
MooseObject >> mooseDescription [
	^ self mooseModel
		ifNil: [ super mooseDescription ]
		ifNotNil: [ :model | model mooseDescriptionFor: self class ]
]

{ #category : #accessing }
MooseObject >> mooseID [
	"Returns an unique identifier of this entity.  This method is mandatory, and must 
	return	 an Integer that uniquely identifies this entity within the entire Moose environment.
	The return value must not be nil, and must never change."

	"nil = mooseID ifTrue: [mooseID := MooseModel freshID]."

	^ mooseID
]

{ #category : #printing }
MooseObject >> mooseName [
	"The return value must not be nil, and must never change.
	The implementation should be fast, as this key may be used
	extensively by MooseGroup or similar facilities.
	
	Do not override this method.
	Instead, use mooseNameOn: to customize the result."

	self hasMooseModel
		ifFalse: [ "do not cache yet"
			| stream |
			stream := (String new: 64) writeStream.
			self mooseNameOn: stream.
			^ stream contents asSymbol ].
	^ mooseName
		ifNil: [ | stream |
			stream := (String new: 64) writeStream.
			self mooseNameOn: stream.
			mooseName := stream contents asSymbol ]
]

{ #category : #printing }
MooseObject >> mooseNameOn: aStream [
	"Hook to customize the rendered text of an entity. Do not specialize mooseName, but change/specialize this method if necessary."

	self mooseID
		ifNil: [ aStream nextPutAll: 'nil mooseID!!!' ]
		ifNotNil: [ self name ifNil: [ aStream print: self mooseID ] ifNotNil: [ aStream nextPutAll: self name ] ]
]

{ #category : #printing }
MooseObject >> mooseNameWithDots [
	self deprecated: ':: has been replaced by . in mooseName. This method is now useless'.
	^ self mooseName ifNotNil: [ :mName | mName copyReplaceAll: '::' with: '.' ]
]

{ #category : #accessing }
MooseObject >> name [
	^ self class undefinedName
]

{ #category : #accessing }
MooseObject >> navigationPragmas [
	^ self class navigationPragmas
]

{ #category : #'meta information' }
MooseObject >> navigationSelectors [
	^ self navigationPragmas collect: #methodSelector
]

{ #category : #properties }
MooseObject >> notExistentMetricValue [
	
	^-1
]

{ #category : #printing }
MooseObject >> printOn: aStream [
	super printOn: aStream.
	aStream
		space;
		print:
			([ self mooseName ]
				on: Error
				do: [ 'Error printing the object' ])
]

{ #category : #private }
MooseObject >> privateClearMooseName [
	" this method causes the cache to fail if called directly. Use resetMooseName instead. "

	mooseName := nil
]

{ #category : #private }
MooseObject >> privateSetMooseModel: aMooseModel [
	"Do nothing in Object"
]

{ #category : #private }
MooseObject >> properties [ 
	 
	"for read only uses, i.e. don't change the returned value"
	
	^self allCachedValues
]

{ #category : #properties }
MooseObject >> propertyNamed: propertyName [ 
	"Returns the value of the property named propertyName, raises an error if the property does not exist"

	^ self propertyNamed: propertyName ifAbsent: [ NotFound signalFor: 'Property named ', propertyName  ]
]

{ #category : #properties }
MooseObject >> propertyNamed: propertyName ifAbsent: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	^ self
		cacheAt: propertyName asSymbol
		ifAbsent: [ ([ self mmGetProperty: (self mooseDescription propertyNamed: propertyName) ]
				on: Error
				do: [ :ex | nil ]) ifNil: [ aBlock value ] ]
]

{ #category : #properties }
MooseObject >> propertyNamed: name ifAbsentPut: value [
	^ self cacheAt: name ifAbsentPut: value
]

{ #category : #properties }
MooseObject >> propertyNamed: propertyName ifNil: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	^ self
		cacheAt: propertyName asSymbol
		ifAbsent: [ ([ self mmGetProperty: (self mooseDescription propertyNamed: propertyName) ]
				on: Error
				do: [ :ex | nil ]) ifNil: [ aBlock value ] ]
]

{ #category : #properties }
MooseObject >> propertyNamed: name put: value [
	^ self cacheAt: name put: value
]

{ #category : #accessing }
MooseObject >> removeAttribute: aSymbol [
	| each |
	1 to: entityAttributes size do: [ :n | 
		aSymbol == (each := entityAttributes at: n) key
			ifTrue: [ entityAttributes := entityAttributes copyWithout: each.
				^ true ] ].
	^ false
]

{ #category : #accessing }
MooseObject >> removeCache: name [
	cache removeKey: name ifAbsent: [  ]
]

{ #category : #accessing }
MooseObject >> removeFromModel [
	^ self mooseModel
		ifNil: [ self ]
		ifNotNil: [ :model | model removeEntity: self ]
]

{ #category : #initialization }
MooseObject >> resetMooseName [
	"If needed I reset my moose name in the MooseModel. I return true if my MooseName was updated and false if it was not."

	(self hasUniqueMooseNameInModel and: [ self hasMooseModel ]) ifFalse: [ ^ false ].

	self mooseModel resetMooseNameFor: self.

	^ true
]

{ #category : #initialization }
MooseObject >> resetPrivateState [
	entityAttributes := #().
	cache := SmallDictionary new
]

{ #category : #private }
MooseObject >> suspendAllAnnouncementsDuring: aBlock [
	| currentAnnouncer |	
	currentAnnouncer := self announcer.
	[ 	self announcer: Announcer new.
		aBlock value ]
			ensure: [ self announcer: currentAnnouncer ]
]
