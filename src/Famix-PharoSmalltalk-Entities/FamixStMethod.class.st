"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentPackage` | `FamixTPackageable` | `childEntities` | `FamixTPackage` | Package containing the entity in the code structure (if applicable)|
| `parentType` | `FamixTMethod` | `methods` | `FamixTWithMethods` | Type declaring the method. It provides the implementation for belongsTo.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | `annotationTypesContainer` | `FamixTAnnotationType` | The container in which the AnnotationTypes may be declared|
| `implicitVariables` | `FamixTWithImplicitVariables` | `parentBehaviouralEntity` | `FamixTImplicitVariable` | Implicit variables used locally by this behaviour.|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|
| `typeDeclaration` | `FamixTTypedEntity` | `typedEntity` | `FamixTTypeDeclaration` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationInstances` | `FamixTWithAnnotationInstances` | `annotatedEntity` | `FamixTAnnotationInstance` | This property corresponds to the set of annotations associated to the entity|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAbstract` | `Boolean` | false | Entity can be declared abstract|
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `kind` | `String` | nil | Tag indicating a setter, getter, constant, constructor method|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `protocol` | `String` | nil | Protocol of the method|
| `signature` | `String` | nil | Signature of the message being sent|

"
Class {
	#name : #FamixStMethod,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTCanBeAbstract + FamixTCanBeClassSide + FamixTHasKind + FamixTMethod + FamixTPackageable + FamixTWithAnnotationInstances + FamixTWithAnnotationTypes + FamixTWithComments',
	#classTraits : 'FamixTCanBeAbstract classTrait + FamixTCanBeClassSide classTrait + FamixTHasKind classTrait + FamixTMethod classTrait + FamixTPackageable classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithAnnotationTypes classTrait + FamixTWithComments classTrait',
	#instVars : [
		'#protocol => FMProperty'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStMethod class >> annotation [

	<FMClass: #Method super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> accessedAttributes [
	
	"Returns the set of attributes of my class accessed by me (method). 
	Used to support the calculation of LCOM"
	
	^ (self queryOutgoingAccesses opposites withinParentUsing: FamixTClass) asSet select: #isAttribute
]

{ #category : #accessing }
FamixStMethod >> category [
	<FMProperty: #category type: #String>
	<FMComment: 'Category of the method'>
	
	^ self attributeAt: #category ifAbsentPut: [ nil ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> category: aString [

	self attributeAt: #category put: aString

	
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> compiledMethod [
	"Return the compiled method associated to the receiver or nil"
	
	^ self smalltalkClass compiledMethodAt: self name asSymbol
	
	
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> computeCyclomaticComplexity [

	^ (self isStub or: [ self smalltalkClass isNil ])
		ifTrue: [ self notExistentMetricValue ]
		ifFalse: [ (RBVisitorForFamixMetrics for: self) cyclomaticNumber ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> computeNumberOfConditionals [
	^ self isStub
		ifTrue: [ self notExistentMetricValue ]
		ifFalse: [ (RBVisitorForFamixMetrics for: self) numberOfConditionals ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> computeNumberOfMessageSends [
	^ self isStub
		ifTrue: [ self notExistentMetricValue ]
		ifFalse: [ (RBVisitorForFamixMetrics for: self) numberOfMessageSends ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> computeNumberOfStatements [
	^ self isStub
		ifTrue: [ self notExistentMetricValue ]
		ifFalse: [ (RBVisitorForFamixMetrics for: self) numberOfStatements ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> hasEmptyBody [
	"Copied from FAMIX2.
	 The closest we can get in FAMIX2 to determine if a body is empty is to check if the method
	 performs no invocations and/or accesses. The only thing left to do would be the declaration
	 of local variables (that are not accesses afterwards).

	Note that an abstract method with only 'self subclassResponsibility' is not regarded as an 
	empty method in this scheme (which is questionable)."
	"note that the presence of statements should be checked too for that..."
	^ self numberOfAccesses = 0 and: [ self numberOfOutgoingInvocations = 0 ]
]

{ #category : #'Famix-Extensions' }
FamixStMethod >> invokedBehaviours [
	^ self queryAllOutgoingInvocations opposites
]

{ #category : #'Famix-Extensions' }
FamixStMethod >> invokedMethods [
	<FMProperty: #invokedMethods type: #FamixStMethod> <derived> <multivalued>
	<FMComment: 'The methods invoked by the receiver'>
	
	^ self invokedBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isCalledInternally [
	^self incomingInvocations
		anySatisfy:
			[:each | each sender isMethod and: [each sender belongsTo == self belongsTo]]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isInitializer [
	| protocolCond nameCond |
	protocolCond := self protocol ifNotNil: [ '*initialize*' match: self protocol ] ifNil: [ false ].
	nameCond := self name ifNotNil: [ '*initialize*' match: self name ] ifNil: [ false ].
	^ (protocolCond or: nameCond) or: [ self isConstructor ]  
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isInternalImplementation [
	<FMProperty: #isInternalImplementation type: #Boolean>
	<derived>
	<FMComment: 'Public Interface Layer Method'>

	^ (self isInitializer not and: [ self isCalledInternally ])
		and: [ self isPureAccessor not ]
]

{ #category : #testing }
FamixStMethod >> isOverridden [
	"If we have a stub and we don't have the container, we can't have the information"

	<FMProperty: #isOverridden type: #Boolean>
	<derived>
	<FMComment: 'The method is overrided in a sub class'>
	(self parentType isNil and: [ self isStub ])
		ifTrue: [ ^ false ].
	^ self parentType subclassHierarchyGroup
		anySatisfy: [ :each | each implements: self signature ]
]

{ #category : #testing }
FamixStMethod >> isOverriding [
	<FMProperty: #isOverriding type: #Boolean>
	<derived>
	<FMComment: 'The method is overrinding a method defined in a super class'>
	^ self parentType directSuperclasses
		anySatisfy: [ :each | each understands: self signature ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> isSurelyInvokedBy: aFAMIXMethod [

	| outgoingInvo |
	((self isAbstract or: [ aFAMIXMethod isAbstract ]) or: [ 
		 (outgoingInvo := aFAMIXMethod queryAllOutgoingInvocations) isEmpty ]) 
		ifFalse: [ 
			outgoingInvo do: [ :invo | 
				(invo signature = self signature and: [ invo isASureInvocation ]) 
					ifTrue: [ 
						| invocationRVar |
						invocationRVar := invo getReceivingFamixClass.
						(invocationRVar isNotNil and: [ 
							 (invocationRVar lookUp: self signature) = self ]) ifTrue: [ 
							^ true ] ] ] ].
	^ false
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfAccesses [
	<FMProperty: #numberOfAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses from a method'>
	
	^ self 
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [ self accesses size ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfConditionals [
	<FMProperty: #numberOfConditionals type: #Number>
	<FMComment: 'The number of conditionals in a method'>
	^ self
		lookUpPropertyNamed: #numberOfConditionals
		computedAs: [ self computeNumberOfConditionals ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfConditionals: aNumber [
	self cacheAt: #numberOfConditionals put: aNumber
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message from a method'>
	^ self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [ self computeNumberOfMessageSends ]
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfMessageSends: aNumber [
	self cacheAt: #numberOfMessageSends put: aNumber
]

{ #category : #'Famix-Extensions-private' }
FamixStMethod >> numberOfStatements [
	<FMProperty: #numberOfStatements type: #Number>
	<FMComment: 'The number of statements in a method'>
	^ self
		lookUpPropertyNamed: #numberOfStatements
		computedAs: [ self computeNumberOfStatements ]
]

{ #category : #protocol }
FamixStMethod >> overriddenMethod [
"currently does not take into account traits"
	^ (self parentType superclass ifNotNil: [ :superclass |
		   superclass lookUp: self signature ]) 
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> printProtocol [

	^ '" ' , self protocol , ' "' , String cr
]

{ #category : #accessing }
FamixStMethod >> protocol [

	<FMProperty: #protocol type: #String>
	<generated>
	<FMComment: 'Protocol of the method'>
	^ protocol
]

{ #category : #accessing }
FamixStMethod >> protocol: anObject [
	<generated>
	protocol := anObject
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> smalltalkClass [ 
	"Return the smalltalk class associated with the receiver. Note that it may be different than doing self parentType because the class and metaclass can be merged."
	
	^   ('*_class' match: self parentType name)
			ifTrue: [self parentType smalltalkClass]
			ifFalse: [self isClassSide 
							ifTrue: [self parentType smalltalkClass class]
							ifFalse: [self parentType smalltalkClass]]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> sourceText [

	self flag: 'This code should be delegated to the anchor'.
	^ [ self printProtocol , self compiledMethod sourceCode ]
		  on: Error
		  do: [ "probably class is not in the system" super sourceText ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> timeStamp [
	<FMProperty: #timeStamp type: #String>
	<FMComment: 'TimeStamp of the method with author and time of the last change'>
	<package: 'Smalltalk'>
	^ self attributeAt: #timeStamp ifAbsentPut: [ '' ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStMethod >> timeStamp: aTimeStamp [

	self attributeAt: #timeStamp put: aTimeStamp
]
