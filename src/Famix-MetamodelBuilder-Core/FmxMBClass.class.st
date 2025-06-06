Class {
	#name : #FmxMBClass,
	#superclass : #FmxMBBehavior,
	#instVars : [
		'classGeneralization',
		'isAbstractClass',
		'propertiesForEqualityCheck'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBClass >> acceptVisitor: aVisitor [
	
	<ignoreForCoverage>
	^ aVisitor visitClass: self.
]

{ #category : #accessing }
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

{ #category : #accessing }
FmxMBClass >> allLocalTraits [
	^ self traitsFromRelations , super allLocalTraits
]

{ #category : #accessing }
FmxMBClass >> allTransitiveTraitsIncludingClassGeneralization [

	| result |
	result := super allTransitiveTraitsIncludingClassGeneralization.
	self classGeneralization ifNotNil: [ :class | class ~= Object ifTrue: [ result addAll: class allTransitiveTraitsIncludingClassGeneralization ] ].
	^ result
]

{ #category : #accessing }
FmxMBClass >> classGeneralization [
	^ classGeneralization
]

{ #category : #accessing }
FmxMBClass >> classGeneralization: anObject [
	
	classGeneralization := anObject.
	^ anObject
]

{ #category : #generating }
FmxMBClass >> generate [

	| aClass aSuperclass aClassName |
	self willGenerate ifFalse: [ ^ self ].

	aClassName := self fullName.

	aSuperclass := self classGeneralization
		               ifNil: [ self defaultSuperclass ]
		               ifNotNil: [ self classGeneralization realClass ].

	aClass := self builder environment
		          createClassNamed: aClassName asSymbol
		          superclass: aSuperclass
		          traitNames: self allTraitNames
		          slots: self slotDefinitions
		          in: self packageName
		          overwrite: true.

	aClass tagWith: self tag.
	self builder environment setComment: self commentWithRelations for: aClass.

	self realClass: aClass.

	self generateAccessors.
	self generateAnnotationIn: aClass superclass: nil.
	self generateIsAbstractMethodIfNecessaryIn: aClass.

	self generateTestingMethodsIn: aClass.
	self generateRootMetamodelMethodIn: aClass.

	self generateMethodsToRemoveFromTraitCompositionFor: aClass.
	self generatePrecedenceInTraitComposition: aClass.

	self generateNavigationGroupsFor: aClass.
	self generateAddToCollectionFor: aClass.
	
	self generateEqualsMethodFor: aClass.
	self generateHashMethodFor: aClass.
]

{ #category : #'generating-methods' }
FmxMBClass >> generateEqualsMethodFor: aClass [

	propertiesForEqualityCheck ifNotNil: [
		| variableName |
		variableName := 'a' , aClass name.
		self builder environment
			compile: (String streamContents: [ :stream |
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
						 2 to: propertiesForEqualityCheck size do: [ :idx |
						 stream << '] ' ] ] ])
			in: aClass instanceSide
			classified: #comparing ]
]

{ #category : #'generating-methods' }
FmxMBClass >> generateHashMethodFor: aClass [

	propertiesForEqualityCheck ifNotNil: [
		self builder environment
			compile: (String streamContents: [ :stream |
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
								 << ' hash ' ] ] ])
			in: aClass instanceSide
			classified: #comparing ]
]

{ #category : #generating }
FmxMBClass >> generateIsAbstractMethodIfNecessaryIn: aClass [

	self isAbstractClass ifTrue: [ 
		aClass classSide
			compile: ('isAbstract

	<generated>
	^ self == {1}' format: { aClass name asString })
			classified: 'testing' ]
]

{ #category : #generating }
FmxMBClass >> generateRemotes [
	| aClass aClassName |
	aClassName := self fullName.

	aClass := self class environment at: aClassName asSymbol ifAbsent: [ self builder environment classNamed: aClassName asSymbol ].

	self realClass: aClass.

	self generateRemoteAccessors
]

{ #category : #'generating-methods' }
FmxMBClass >> generateRootMetamodelMethodIn: aClass [
	self isRoot ifFalse: [ ^ self ].

	self builder model
		ifNotNil: [ :model | 
			aClass classSide
				compile:
					('metamodel

	<generated>
	^ {1} metamodel' format: {model fullName})
				classified: 'meta' ]
]

{ #category : #'generating-methods' }
FmxMBClass >> generateTestingMethodsIn: aClass [
	self isRoot
		ifTrue: [ builder testingSelectorsMapping
				keysAndValuesDo: [ :concernedClass :selectors | 
					"In case a testing selector is relatif to a Trait that is not used in the current MM, then we do not need to generate the testing selector."
					(concernedClass isMetamodelTrait and: [ builder classes noneSatisfy: [ :class | class allTransitiveTraits includes: concernedClass ] ])
						ifFalse: [ selectors
								do: [ :sel | 
									| selectorsFromTraits |
									selectorsFromTraits := self traitGeneralizations flatCollect: #testingSelectors.
									(selectorsFromTraits includes: sel) ifFalse: [ aClass instanceSide compile: ('{1}\\	<generated>\	^ false' withCRs format: {sel}) classified: #testing ] ] ] ] ].

	super generateTestingMethodsIn: aClass
]

{ #category : #testing }
FmxMBClass >> isAbstractClass [

	^ isAbstractClass ifNil: [ false ]
]

{ #category : #accessing }
FmxMBClass >> isAbstractClass: aBoolean [

	isAbstractClass := aBoolean
]

{ #category : #testing }
FmxMBClass >> isMetamodelClass [

	^ true
]

{ #category : #testing }
FmxMBClass >> isRoot [
	^ self classGeneralization isNil
]

{ #category : #generating }
FmxMBClass >> optionalPragma [

	^ self isAbstractClass
		  ifTrue: [ 
			  '
	<abstract>' ]
		  ifFalse: [ super optionalPragma ]
]

{ #category : #generalization }
FmxMBClass >> subclassOf: aClass [
	
	self generalization: aClass
]

{ #category : #accessing }
FmxMBClass >> traitsFromRelations [
	"returns traits defined by relations"

	^ (self relations collect: [ :each | each side trait ] thenSelect: #isNotNil) asSet
]

{ #category : #generalization }
FmxMBClass >> withEqualityCheckOn: aCollectionOfPropertySymbol [

	propertiesForEqualityCheck := aCollectionOfPropertySymbol
]
