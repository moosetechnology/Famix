Class {
	#name : #FamixJavaClass,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTClassMetrics + FamixTCanBeAbstract + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTCanImplement + FamixTClass + FamixTClassMetrics + FamixTHasVisibility + FamixTImportable + FamixTLCOMMetrics + FamixTPackageable + FamixTWithImports',
	#classTraits : 'FamixJavaTClassMetrics classTrait + FamixTCanBeAbstract classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTCanImplement classTrait + FamixTClass classTrait + FamixTClassMetrics classTrait + FamixTHasVisibility classTrait + FamixTImportable classTrait + FamixTLCOMMetrics classTrait + FamixTPackageable classTrait + FamixTWithImports classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaClass class >> annotation [

	<FMClass: #Class super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #private }
FamixJavaClass >> addMethodOverriding: aMethod in: aCollection [

	self directSubclasses do: [ :subClass |
		subClass methods
			detect: [ :method | method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ]
			ifNone: [ subClass addMethodOverriding: aMethod in: aCollection ] ]
]

{ #category : #enumerating }
FamixJavaClass >> allImplementedInterfacesHierarchy [

	| allImplementedInterfaces |
	allImplementedInterfaces := OrderedCollection new.

	self allImplementedInterfacesHierarchyDo: [ :interface |
		allImplementedInterfaces add: interface ].

	^ allImplementedInterfaces
]

{ #category : #enumerating }
FamixJavaClass >> allImplementedInterfacesHierarchyDo: aBlock [

	self directImplementedInterfaces do: [ :directInterface |
		directInterface withSuperclassesDo: aBlock ]
]

{ #category : #accessing }
FamixJavaClass >> incomingAccesses [
	^ self 
		cacheAt: #incomingAccesses
		ifAbsentPut: [ attributes flatCollect: [ :each | each incomingAccesses ] ]
]

{ #category : #testing }
FamixJavaClass >> isADirectSubclassOf: aClass [
	^ aClass class = FamixJavaClass
		ifTrue: [ aClass directSubclasses includes: self ]
		ifFalse: [ false ]
]

{ #category : #testing }
FamixJavaClass >> isADirectSuperclassOf: aClass [
	^ aClass class = FamixJavaClass
		ifTrue: [ aClass superclass = self ]
		ifFalse: [ false ]
]

{ #category : #testing }
FamixJavaClass >> isASubclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass subclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #testing }
FamixJavaClass >> isASuperclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass superclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #testing }
FamixJavaClass >> isAccessedBy: anAccess [ 
	 
	^anAccess accesses == self
]

{ #category : #testing }
FamixJavaClass >> isIgnored [

	"If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed"

	self deprecated: 'This method is not supported in VerveineJ'.
	^ self isAnnotatedWith: 'Ignore'
]

{ #category : #testing }
FamixJavaClass >> isInheritedBy: anInheritance [ 
	 
	^anInheritance superclass == self
]

{ #category : #private }
FamixJavaClass >> lookUpInInterfaces: aMethodSignature [

	self allImplementedInterfacesHierarchyDo: [ :interface |
		(interface lookUp: aMethodSignature) ifNotNil: [ :method | ^ method ] ].

	^ self superclass ifNotNil: [ :superclass |
		  superclass lookUpInInterfaces: aMethodSignature ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
]

{ #category : #accessing }
FamixJavaClass >> numberOfComments [
	"Overrides to include method comments in the numberOfComments of the class"
	^ self
		lookUpPropertyNamed: #numberOfComments
		computedAs: [ self children asArray
			inject: self comments size into: [ :sum :child | child numberOfComments + sum ] ]

]

{ #category : #'Famix-Extensions' }
FamixJavaClass >> structuralChildren [
	^ (OrderedCollection withAll: self methods), self attributes
]
