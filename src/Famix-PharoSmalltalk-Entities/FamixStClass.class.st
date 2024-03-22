"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentPackage` | `FamixTPackageable` | `childEntities` | `FamixTPackage` | Package containing the entity in the code structure (if applicable)|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredType` | `FamixTReference` | References to this entity by other entities.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTType` | `declaredType` | `FamixTTypedEntity` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAbstract` | `Boolean` | false | Entity can be declared abstract|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixStClass,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTCanBeAbstract + FamixTClass + FamixTClassMetrics + FamixTPackageable',
	#classTraits : 'FamixTCanBeAbstract classTrait + FamixTClass classTrait + FamixTClassMetrics classTrait + FamixTPackageable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStClass class >> annotation [

	<FMClass: #Class super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #accessing }
FamixStClass >> allRecursiveTypes [
	"We cannot have children types in Smalltalk but this method is useful to compute some metrics."

	^ #(  )
]

{ #category : #accessing }
FamixStClass >> classSide [
	^ self isClassSide
		ifFalse: [ self mooseModel allClasses entityNamed: (self mooseName , '_class') asSymbol ]
		ifTrue: [ self ]
]

{ #category : #metrics }
FamixStClass >> computeNumberOfLinesOfCode [
	"The source anchor only contains the definition while the source text return the full tonel export. So we count the lines of the full tonel export"

	^ self sourceText
		ifNotEmpty: #lineCount
		ifEmpty: [ self notExistentMetricValue ]
]

{ #category : #accessing }
FamixStClass >> extendedInPackages [
	^ self extendedMethods flatCollectAsSet: [ :m | m atScope: FamixTPackage ]
]

{ #category : #accessing }
FamixStClass >> extendedMethods [
	<FMProperty: #extendedMethods type: #FamixStMethod>
	<FMComment: 'Methods which are class extensions in this class.'>
	<derived>
	^ self methods select: #isExtension
]

{ #category : #accessing }
FamixStClass >> instanceSide [
	^ self isClassSide
		ifTrue: [ self mooseModel allClasses entityNamed: (self mooseName removeSuffix: '_class') asSymbol ]
		ifFalse: [ self ]
]

{ #category : #testing }
FamixStClass >> isAnonymousClass [
	self flag: #todo.	"We need to check how to do that in Pharo smalltalk because I think some of the conditions are for Java"
	^ self typeContainer isNotNil and: [ self typeContainer isMethod or: [ self name isAllDigits or: [ '*_anonymous_*' match: self name ] ] ]
]

{ #category : #testing }
FamixStClass >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^ '*_class' match: self name
]

{ #category : #testing }
FamixStClass >> isExtended [
	^ self methods anySatisfy: #isExtension
]

{ #category : #testing }
FamixStClass >> isInstanceSide [
	^ self isClassSide not
]

{ #category : #testing }
FamixStClass >> isLonelyWithin: aClassGroup [
	^ (self subclassHierarchyGroup intersection: aClassGroup) isEmpty and: [ (self superclassHierarchyGroup intersection: aClassGroup) isEmpty ]
]

{ #category : #testing }
FamixStClass >> isTestCase [
	<FMProperty: #isTestCase type: #Boolean>
	<derived>
	<FMComment: 'True if the method is considered as a Java test'>
	self allSuperclassesDo: [ :each | each name = 'TestCase' ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #accessing }
FamixStClass >> localMethods [
	<FMProperty: #extendedMethods type: #FamixStMethod>
	<FMComment: 'Methods which are local methods of the class and not extensions in this class.'>
	<derived>
	^ self methods reject: #isExtension
]

{ #category : #accessing }
FamixStClass >> lookUp: signature [
	self withSuperclassesDo: [ :class | class methods detect: [ :method | method signature = signature ] ifFound: [ :found | ^ found ] ].
	^ nil
]

{ #category : #'Famix-Implementation' }
FamixStClass >> methodsWithoutSutbsAndConstructors [
	"Removing stub and contructor methods. Used to support the calculation of LCOM."

	^ (self methods select: [ :each | each isStub not and: [ each isConstructor not ] ]) asSet
]

{ #category : #accessing }
FamixStClass >> numberOfComments [
	"Overrides to include method comments in the numberOfComments of the class"

	^ self lookUpPropertyNamed: #numberOfComments computedAs: [
		  self children asArray inject: self comments size into: [ :sum :child |
			  (child class includesTrait: FamixTWithComments)
				  ifTrue: [ child numberOfComments + sum ]
				  ifFalse: [ sum ] ] ]
]

{ #category : #metrics }
FamixStClass >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message sends from a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [self methodsGroup sumNumbers: #numberOfMessageSends]
]

{ #category : #'as yet unclassified' }
FamixStClass >> numberOfMessageSends: aNumber [
	self cacheAt: #numberOfMessageSends put: aNumber
]

{ #category : #metrics }
FamixStClass >> numberOfMethodProtocols [
	<FMProperty: #numberOfMethodProtocols type: #Number>
	<derived>
	<FMComment: 'The number of method protocols in a class'>
	^ self lookUpPropertyNamed: #numberOfMethodProtocols computedAs: [ ((self methods collect: [ :each | each protocol ]) reject: #isNil) asSet size ]
]

{ #category : #metrics }
FamixStClass >> numberOfMethodProtocols: aNumber [
	self cacheAt: #numberOfMethodProtocols put: aNumber
]

{ #category : #'Famix-Implementation' }
FamixStClass >> smalltalkClass [
	"Returns the associated smalltalk class if it exist in the system."

	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: self name ifAbsent: [ nil ]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> sourceText [

	self flag: 'This code should be delegated to the anchor'.
	^ self instanceSide smalltalkClass
		  ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ]
		  ifNil: [ super sourceText ]
]
