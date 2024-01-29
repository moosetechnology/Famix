"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentType` | `FamixTMethod` | `methods` | `FamixTWithMethods` | Type declaring the method. It provides the implementation for belongsTo.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implicitVariables` | `FamixTWithImplicitVariables` | `parentBehaviouralEntity` | `FamixTImplicitVariable` | Implicit variables used locally by this behaviour.|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingImports` | `FamixTImportable` | `importedEntity` | `FamixTImport` | List of imports of this entity|
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `caughtExceptions` | `FamixTWithExceptions` | `catchingEntities` | `FamixTThrowable` | The exceptions caught by the method|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `declaredExceptions` | `FamixTWithExceptions` | `declaringEntities` | `FamixTThrowable` | The exceptions declared by the method|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `thrownExceptions` | `FamixTWithExceptions` | `throwingEntities` | `FamixTThrowable` | The exceptions thrown by the method|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAbstract` | `Boolean` | false | Entity can be declared abstract|
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|
| `isFinal` | `Boolean` | false | Entity can be declared final|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `isSynchronized` | `Boolean` | false | Entity can be declared synchronized|
| `kind` | `String` | nil | Tag indicating a setter, getter, constant, constructor method|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `signature` | `String` | nil | Signature of the message being sent|
| `visibility` | `String` | nil | Visibility of the entity|

"
Class {
	#name : #FamixJavaMethod,
	#superclass : #FamixJavaContainerEntity,
	#traits : 'FamixJavaTCanBeSynchronized + FamixTCanBeAbstract + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasKind + FamixTHasVisibility + FamixTImportable + FamixTMethod + FamixTWithComments + FamixTWithExceptions',
	#classTraits : 'FamixJavaTCanBeSynchronized classTrait + FamixTCanBeAbstract classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasKind classTrait + FamixTHasVisibility classTrait + FamixTImportable classTrait + FamixTMethod classTrait + FamixTWithComments classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaMethod class >> annotation [

	<FMClass: #Method super: #FamixJavaContainerEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaMethod >> accessedAttributes [
	
	"Returns the set of attributes of my class accessed by me (method). 
	Used to support the calculation of LCOM"
	
	^ (self queryOutgoingAccesses opposites withinParentUsing: FamixTClass) asSet select: #isAttribute
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> clientBehaviours [
	<FMProperty: #clientBehaviours type: #FamixJavaMethod> <multivalued> <derived>
	<FMComment: 'All behaviours that depend on the receiver'>
	^ self invokingBehaviours 
]

{ #category : #testing }
FamixJavaMethod >> hasEmptyBody [
	"Copied from FAMIX2.
	 The closest we can get in FAMIX2 to determine if a body is empty is to check if the method
	 performs no invocations and/or accesses. The only thing left to do would be the declaration
	 of local variables (that are not accesses afterwards).

	Note that an abstract method with only 'self subclassResponsibility' is not regarded as an 
	empty method in this scheme (which is questionable)."
	"note that the presence of statements should be checked too for that..."
	^ self numberOfAccesses = 0 and: [ self numberOfOutgoingInvocations = 0 ]
]

{ #category : #testing }
FamixJavaMethod >> hasInnerClassImplementingMethods [
	^ self innerClassesImplementingMethods isNotEmpty
]

{ #category : #'Famix-Java' }
FamixJavaMethod >> implementMethod [
	^ self belongsTo implementedInterfaces
		collect: [ :each | each implementationOf: self signature ]
]

{ #category : #'Famix-Java' }
FamixJavaMethod >> innerClassesImplementingMethods [
	^ self types select: [ :el | el methods anySatisfy: [ :m | m isStub not ] ]
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokedBehaviours [
	^ self queryAllOutgoingInvocations opposites
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokedMethods [
	<FMProperty: #invokedMethods type: #FamixJavaMethod> <derived> <multivalued>
	<FMComment: 'The methods invoked by the receiver'>
	
	^ self invokedBehaviours select: [ :each | each isMethod ]
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokingBehaviours [
	^ self queryAllIncomingInvocations opposites
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> invokingMethods [
	<FMProperty: #invokingMethods type: #FamixJavaMethod> <derived> <multivalued>
	<FMComment: 'The methods invoking the receiver'>

	^ self invokingBehaviours select: [ :each | each isMethod ]
]

{ #category : #testing }
FamixJavaMethod >> isCalledInternally [
	^self incomingInvocations
		anySatisfy:
			[:each | each sender isMethod and: [each sender belongsTo == self belongsTo]]
]

{ #category : #testing }
FamixJavaMethod >> isClassInitializer [
	<FMProperty: #isClassInitializer type: #Boolean>
	<derived>
	<FMComment: 'True if the method is an initializer of the class (i.e. contains the attribute init env)'>
	^ #initializer = self kind or: [ self cacheAt: #isClassInitializer ifAbsent: [ false ] ]
]

{ #category : #testing }
FamixJavaMethod >> isDetectedGetter [

	self deprecated: 'This is legacy and is not used. January 2023'.

	^ self outgoingInvocations isEmpty and: [ 
		  self accesses size = 1 and: [ self accesses first isWrite not ] ]
]

{ #category : #testing }
FamixJavaMethod >> isDetectedSetter [

	self deprecated: 'This is legacy and is not used. January 2023'.

	^ self outgoingInvocations isEmpty and: [ 
		  self accesses size = 1 and: [ self accesses first isWrite ] ]
]

{ #category : #testing }
FamixJavaMethod >> isGetter [
	"No parameter AND
		Has a declared type (not void) AND
			Has no outgoing invocation AND
				Name starts with get OR
					Name starts with is AND returns a boolean"

	^ self kind = #getter or: [
		  self parameters isEmpty and: [
			  self declaredType isNotNil and: [
				  self declaredType name ~= 'void' and: [
					  self outgoingInvocations isEmpty and: [
						  self name isNotNil and: [
							  (self name beginsWith: 'get') or: [
								  (self name beginsWith: 'is') and: [
									  self declaredType name caseInsensitiveLessOrEqual:
										  'boolean' ] ] ] ] ] ] ] ]
]

{ #category : #testing }
FamixJavaMethod >> isImplementing [
	<FMProperty: #isImplementing type: #Boolean>
	<derived>
	<FMComment: 'The method is implementing a method defined in an interface'>
	^ self belongsTo directSuperclasses
		anySatisfy: [ :each | each isInterface and: [ each understands: self signature ] ]
]

{ #category : #testing }
FamixJavaMethod >> isJUnit4Test [
	<FMProperty: #isJUnit4Test type: #Boolean>
	<derived>
	<FMComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self isAnnotatedWith: 'Test'
]

{ #category : #testing }
FamixJavaMethod >> isOverridden [
	"If we have a stub and we don't have the container, we can't have the information"

	<FMProperty: #isOverridden type: #Boolean>
	<derived>
	<FMComment: 'The method is overrided in a sub class'>
	(self parentType isNil and: [ self isStub ])
		ifTrue: [ ^ false ].
	^ self parentType subclassHierarchyGroup
		anySatisfy: [ :each | each hasMethodWithSignature: self signature ]
]

{ #category : #testing }
FamixJavaMethod >> isOverriding [
	<FMProperty: #isOverriding type: #Boolean>
	<derived>
	<FMComment: 'The method is overrinding a method defined in a super class'>
	^ self parentType directSuperclasses
		anySatisfy:
			[ :each | each isInterface not and: [ each understands: self signature ] ]
]

{ #category : #testing }
FamixJavaMethod >> isSetter [
	"Name begins with set AND
		Has 1 parameter AND
			Declared type is void AND
				Has no outgoing invocation"

	^ self kind = #setter or: [
		  self name isNotNil and: [
			  (self name beginsWith: 'set') and: [
				  self parameters size = 1 and: [
					  self declaredType isNotNil and: [
						  self declaredType name = 'void' and: [
							  self outgoingInvocations isEmpty ] ] ] ] ] ]
]

{ #category : #printing }
FamixJavaMethod >> isStub [
	^ super isStub or: [ self parentType isNotNil and: [ self parentType isStub ] ]
]

{ #category : #testing }
FamixJavaMethod >> isSurelyInvokedBy: aFAMIXMethod [
	| outgoingInvo |
	((self isAbstract or: [ aFAMIXMethod isAbstract ]) or: [ (outgoingInvo := aFAMIXMethod queryAllOutgoingInvocations) isEmpty ])
		ifFalse: [ outgoingInvo
				do: [ :invo | 
					(invo signature = self signature and: [ invo isASureInvocation ])
						ifTrue: [ | invocationRVar |
							invocationRVar := invo getReceivingFAMIXClass.
							(invocationRVar isNotNil and: [ (invocationRVar lookUp: self signature) = self ]) ifTrue: [ ^ true ] ] ] ].
	^ false
]

{ #category : #accessing }
FamixJavaMethod >> numberOfAccesses [
	<FMProperty: #numberOfAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses from a method'>
	
	^ self 
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [ self accesses size ]
]

{ #category : #accessing }
FamixJavaMethod >> numberOfComments [
	<FMProperty: #numberOfComments type: #Number>
	<FMComment: 'The number of comment fragments'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size ]
]

{ #category : #'Famix-Extensions-private' }
FamixJavaMethod >> numberOfConditionals [
	<FMProperty: #numberOfConditionals type: #Number>
	<FMComment: 'The number of conditionals in a method'>
	^ self
		lookUpPropertyNamed: #numberOfConditionals
		computedAs: [ 
			self notExistentMetricValue ] 
]

{ #category : #'Famix-Extensions-private' }
FamixJavaMethod >> numberOfConditionals: aNumber [
	self cacheAt: #numberOfConditionals put: aNumber
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> numberOfInvokedMethods [
	<FMProperty: #numberOfInvokedMethods type: #Number>
	<FMComment: 'Return a number corresponding to the number of invoked methods'>
	<derived>
	
	^ self cacheAt: #numberOfInvokedMethods ifAbsentPut: [self invokedMethods size]
]

{ #category : #testing }
FamixJavaMethod >> overriddenMethod [

	^ (self parentType superclass ifNotNil: [ :superclass |
		   superclass lookUp: self signature ]) ifNil: [
		  self parentType lookUpInInterfaces: self signature ]
]

{ #category : #'Famix-Implementation' }
FamixJavaMethod >> overridesMethod [

	self deprecated: 'This method seems to not be used anymore.'.
	"Please consider using #overriddenMethod instead.
	We are not automatically replacing it because the behavior is not identical: 
		#overriddenMethod is a detect and not a collect + it goes through intefaces."

	^ self belongsTo superclassHierarchy
		  collect: [ :each | each implementationOf: self signature ]
		  thenSelect: #isNotNil
]

{ #category : #testing }
FamixJavaMethod >> overridingMethods [

	| overridingMethods |
	overridingMethods := OrderedCollection new.

	self parentType addMethodOverriding: self in: overridingMethods.
	^ overridingMethods
]

{ #category : #accessing }
FamixJavaMethod >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self parentType parentScope
]

{ #category : #printing }
FamixJavaMethod >> printOn: aStream [
	parentType ifNotNil: [ aStream nextPutAll: parentType name ].
	aStream nextPutAll: '>>'.
	signature ifNotNil: [ aStream nextPutAll: signature ].
	aStream nextPutAll: ' (Method)'
]

{ #category : #'Famix-Extensions' }
FamixJavaMethod >> providerBehaviours [
	<FMProperty: #providerBehaviours type: #FamixJavaMethod> <derived> <multivalued>
	<FMComment: 'All behaviours that the receiver depends on'>

	^ self invokedBehaviours 
]
