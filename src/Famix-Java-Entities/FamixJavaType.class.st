"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `incomingTypings` | `FamixTType` | `declaredType` | `FamixTEntityTyping` | Relations to the entities that have this as type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lowerBoundedWildcards` | `FamixJavaTBound` | `lowerBound` | `FamixJavaTBounded` | Wildcards lower bounded by this bound.|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `upperBoundedWildcards` | `FamixJavaTBound` | `upperBound` | `FamixJavaTBounded` | Wildcards upper bounded by this bound.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaType,
	#superclass : #FamixJavaContainerEntity,
	#traits : 'FamixJavaTBound + FamixTType + FamixTWithMethods',
	#classTraits : 'FamixJavaTBound classTrait + FamixTType classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaType class >> annotation [

	<FMClass: #Type super: #FamixJavaContainerEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Extensions' }
FamixJavaType >> allAnnotationTypes [
	^ self allAnnotationInstances collectAsSet: #annotationType
]

{ #category : #accessing }
FamixJavaType >> anySuperclass [
"Mircea: this used to return interfaces too. fixed now. 
	also added superclass that does the same thing"

	self
		allSuperclassesDo: [ :each | 
			each isInterface
				ifFalse: [ ^ each ] ].
	^ nil
]

{ #category : #testing }
FamixJavaType >> hasMethodWithSignature: aStringOrSymbol [
	| symbol |
	symbol := aStringOrSymbol asSymbol.
	^self methods anySatisfy: [:each | each signature asSymbol = symbol]
]

{ #category : #testing }
FamixJavaType >> hasMethodsAnnotatedWith: aString [
	^ self methods anySatisfy: [ :each | each isAnnotatedWith: aString ]
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> implementationOf: signature [
	self withSuperclassesDo: [ :class | | found |
			found := class methods
				detect: [ :method | method signature = signature ]
				ifNone: [ nil ].
			found ifNotNil: [ ^found ] ].
	^ nil
]

{ #category : #'Famix-Java' }
FamixJavaType >> implementedInterfaces [

	^ self directSuperclasses select: #isInterface
]

{ #category : #testing }
FamixJavaType >> isAnonymousClass [

	^ self typeContainer isNotNil and: [ 
		  self typeContainer isMethod or: [ 
			  self name isAllDigits or: [ '*_anonymous_*' match: self name ] ] ]
]

{ #category : #testing }
FamixJavaType >> isInnerClass [

	<FMProperty: #isInnerClass type: #Boolean>
	<derived>
	<FMComment:
	'True if the method is considered as an innerclass (i.e. is contained elsewhere than a java package: class, method, enum,...)'>
	^ self typeContainer
		  ifNotNil: [ :c | c isPackage not ]
		  ifNil: [ false ]
]

{ #category : #testing }
FamixJavaType >> isInterface [
	^ false
]

{ #category : #testing }
FamixJavaType >> isLonelyWithin: aClassGroup [
	^ ( self subclassHierarchyGroup intersection: aClassGroup ) isEmpty and: [
		( self superclassHierarchyGroup intersection: aClassGroup ) isEmpty ]
]

{ #category : #testing }
FamixJavaType >> isParameterType [
	^ false
]

{ #category : #'Famix-Extensions-operations' }
FamixJavaType >> lookUp: aMethodSignature [
	"Returns the first method that has as signature #aMethodSignature. 
	The search starts from the receiver's methods and traveses the inherited methods from the receiver's superclasses heirarchy.
	If such a method has not been found, it returns nil"

	| c toSearchIt searchedM |
	c := self.
	searchedM := nil.
	toSearchIt := true.
	[ c isNotNil and: [ toSearchIt ] ]
		whileTrue: [ searchedM := c methods
				detect: [ :m | m signature = aMethodSignature ]
				ifNone: [ nil ].
			searchedM
				ifNil: [ c := c superclass ]
				ifNotNil: [ toSearchIt := false ] ].
	^ searchedM
]

{ #category : #accessing }
FamixJavaType >> parentScope [
	"Polymorphic alias to mimic GlobalVariable#parentScope and similar"

	^ self typeContainer
]

{ #category : #printing }
FamixJavaType >> printOn: aStream [

	self name ifNotNil: [ aStream nextPutAll: self name ].
	self typeContainer ifNotNil: [ :parent |
		aStream nextPutAll: ' in '.
		parent mooseNameOn: aStream ].
	aStream
		nextPutAll: ' (';
		nextPutAll: (self class name withoutPrefix: 'FamixJava');
		nextPut: $)
]

{ #category : #'Famix-Implementation' }
FamixJavaType >> withSuperclassHierarchyGroup [
	<navigation: 'With all superclasses'>
	^ MooseGroup
		withAll: self withSuperclassHierarchy asSet
		withDescription: 'With all superclasses of ' , self mooseName
]
