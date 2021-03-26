Trait {
	#name : #FamixTWithInheritances,
	#instVars : [
		'#superInheritances => FMMany type: #FamixTInheritance opposite: #subclass',
		'#subInheritances => FMMany type: #FamixTInheritance opposite: #superclass'
	],
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTWithInheritances classSide >> annotation [

	<FMClass: #TWithInheritances super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithInheritances >> addSubInheritance: anInheritance [ 
	subInheritances add: anInheritance
]

{ #category : #accessing }
FamixTWithInheritances >> addSuperInheritance: anInheritance [ 
	superInheritances add: anInheritance
]

{ #category : #enumerating }
FamixTWithInheritances >> allSubclassesDo: aBlock [
	self subInheritances do: [ :each | aBlock value: each subclass ].
	self subInheritances do: [ :each | each subclass allSubclassesDo: aBlock ]
]

{ #category : #enumerating }
FamixTWithInheritances >> allSuperclassesDo: aBlock [
	self superInheritances do: [:each | aBlock value: each superclass].
	self superInheritances do: [:each | each superclass allSuperclassesDo: aBlock]

]

{ #category : #enumerating }
FamixTWithInheritances >> directSubclasses [
	"returns a collection with all subclasses of this class"

	^ self subInheritances collect: #subclass
]

{ #category : #enumerating }
FamixTWithInheritances >> directSuperclasses [
	"returns a collection with all superclasses of this class"

	^ self superInheritances collect: #superclass
]

{ #category : #metrics }
FamixTWithInheritances >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'The nesting of a class inside the hierarchy'>
	^ self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [ | currentMaxDepth |
			(self directSuperclasses isEmpty or: [ self isStub ])
				ifTrue: [ 0 ]
				ifFalse: [ currentMaxDepth := 0.
					self allSuperclassesDo: [ :aClass | currentMaxDepth := currentMaxDepth max: aClass hierarchyNestingLevel ].
					currentMaxDepth + 1 ] ]
]

{ #category : #metrics }
FamixTWithInheritances >> hierarchyNestingLevel: aNumber [
	self cacheAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #testing }
FamixTWithInheritances >> inheritsFrom: aClass [
	self allSuperclassesDo: [ :each | each = aClass ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #enumerating }
FamixTWithInheritances >> isHierarchyRoot [
	^ self superclassHierarchyGroup allSatisfy: [ :each | each isNil or: [ each isStub ] ]
]

{ #category : #enumerating }
FamixTWithInheritances >> isHierarchyRootWithin: aClassGroup [
	^ (self superclassHierarchyGroup intersection: aClassGroup) isEmpty
]

{ #category : #metrics }
FamixTWithInheritances >> numberOfDirectSubclasses [
	<FMProperty: #numberOfDirectSubclasses type: #Number>
	<FMComment: 'The number of direct subclasses'>
	<derived>
	^ self cacheAt: #numberOfDirectSubclasses ifAbsentPut: [ self directSubclasses size ]
]

{ #category : #metrics }
FamixTWithInheritances >> numberOfDirectSubclasses: aNumber [
	self cacheAt: #numberOfDirectSubclasses put: aNumber
]

{ #category : #metrics }
FamixTWithInheritances >> numberOfSubclasses [
	<FMProperty: #numberOfSubclasses type: #Number>
	<derived>
	<FMComment: 'The number of subclasses of a class'>
	^ self lookUpPropertyNamed: #numberOfSubclasses computedAs: [ self subInheritances size ]
]

{ #category : #metrics }
FamixTWithInheritances >> numberOfSubclasses: aNumber [
	self cacheAt: #numberOfSubclasses put: aNumber
]

{ #category : #accessing }
FamixTWithInheritances >> subInheritances [
	"Relation named: #subInheritances type: #FamixTInheritance opposite: #superclass"

	<generated>
	<FMComment: 'Subinheritance relationships, i.e. known subclasses of this type.'>
	<derived>
	^ subInheritances
]

{ #category : #accessing }
FamixTWithInheritances >> subInheritances: anObject [

	<generated>
	subInheritances value: anObject
]

{ #category : #enumerating }
FamixTWithInheritances >> subclassHierarchy [
	| subclasses |
	subclasses := OrderedCollection new.
	self allSubclassesDo: [:each | subclasses add: each].
	^ subclasses
]

{ #category : #metrics }
FamixTWithInheritances >> subclassHierarchyDepth [
	<FMProperty: #subclassHierarchyDepth type: #Number>
	<derived>
	<FMComment: 'The depth of the class hierarchy for which I am the root'>
	^ self directSubclasses
		ifEmpty: [ 0 ]
		ifNotEmpty: [ | currentMaxDepth |
			currentMaxDepth := 0.
			self allSubclassesDo: [ :aClass | currentMaxDepth := currentMaxDepth max: aClass subclassHierarchyDepth ].
			1 + currentMaxDepth ]
]

{ #category : #metrics }
FamixTWithInheritances >> subclassHierarchyDepth: aNumber [
	self cacheAt: #subclassHierarchyDepth put: aNumber
]

{ #category : #enumerating }
FamixTWithInheritances >> subclassHierarchyGroup [
	<navigation: 'All subclasses'>
	^ MooseGroup withAll: self subclassHierarchy asSet withDescription: 'All subclasses of ' , self mooseName
]

{ #category : #accessing }
FamixTWithInheritances >> superInheritances [
	"Relation named: #superInheritances type: #FamixTInheritance opposite: #subclass"

	<generated>
	<FMComment: 'Superinheritance relationships, i.e. known superclasses of this type.'>
	<derived>
	^ superInheritances
]

{ #category : #accessing }
FamixTWithInheritances >> superInheritances: anObject [

	<generated>
	superInheritances value: anObject
]

{ #category : #enumerating }
FamixTWithInheritances >> superclass [
	^ self superInheritances ifEmpty: [ nil ] ifNotEmpty: [ self superInheritances anyOne superclass ]
]

{ #category : #enumerating }
FamixTWithInheritances >> superclassHierarchy [
	| superclasses |
	superclasses := OrderedCollection new.
	self allSuperclassesDo: [:each |  superclasses add: each].
	^ superclasses
]

{ #category : #enumerating }
FamixTWithInheritances >> superclassHierarchyGroup [
	<navigation: 'All superclasses'>
	^ MooseGroup
		withAll: self superclassHierarchy asSet
		withDescription: 'All superclasses of ' , self mooseName
]

{ #category : #enumerating }
FamixTWithInheritances >> withSubclassHierarchy [
	^ self subclassHierarchy 
		addFirst: self realType;
		flag: 'Manage TypeAlias for C metamodel';
		"addAll: self realType allTypeAliases;"
		yourself.
]

{ #category : #enumerating }
FamixTWithInheritances >> withSubclassesDo: aBlock [
	aBlock value: self.
	self allSubclassesDo: aBlock
]

{ #category : #'Famix-Implementation' }
FamixTWithInheritances >> withSuperclassHierarchy [
	self flag: #'We should add something to handle the typeAliases in C++, etc.'.
	^ self realType superclassHierarchy 
		addFirst: self realType;
		"addAll: self realType allTypeAliases;"
		yourself
]

{ #category : #enumerating }
FamixTWithInheritances >> withSuperclassesDo: aBlock [
	aBlock value: self.
	self allSuperclassesDo: aBlock
]
