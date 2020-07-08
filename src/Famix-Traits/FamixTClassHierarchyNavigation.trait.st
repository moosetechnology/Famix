Trait {
	#name : #FamixTClassHierarchyNavigation,
	#category : #'Famix-Traits-Support'
}

{ #category : #meta }
FamixTClassHierarchyNavigation classSide >> annotation [

	<FMClass: #TClassHierarchyNavigation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> addedMethods [
	| inheritedMethodNames |
	inheritedMethodNames := self inheritedMethods
		collect: [:each | each signature].
	^self methods
		reject: [:each | inheritedMethodNames includes: each signature]
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedAttributes [
	| inheritedAttrs |
	inheritedAttrs := OrderedCollection new.
	self allSuperclassesDo: [ :each | each attributes do: [ :attr | attr isPrivate ifFalse: [ inheritedAttrs add: attr ] ] ].
	^ inheritedAttrs
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedMethods [
	| inheritedMethods |
	inheritedMethods := OrderedCollection new.
	self allSuperclassesDo: [ :each | each methods do: [ :method | method isPrivate ifFalse: [ inheritedMethods add: method ] ] ].
	^ inheritedMethods
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedSignatures [
	| inheritedSignatures |
	inheritedSignatures := Set new.
	self superclassHierarchy do: [ :each | each methods do: [ :method | method isPrivate ifFalse: [ inheritedSignatures add: method signature ] ] ].
	^ inheritedSignatures
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedSignaturesToMethod [
	| inheritedSignaturesToMethod |
	inheritedSignaturesToMethod := Dictionary new.
	self allSuperclassesDo: [:each | 
			each methods do: [:method | 
				method isPrivate ifFalse: [
					inheritedSignaturesToMethod at: method signature ifAbsentPut: [method]]]].
	^ inheritedSignaturesToMethod
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfAttributesInherited [
	<FMProperty: #numberOfAttributesInherited type: #Number>
	<derived>
	<FMComment: 'The number of attributes in a class inherited from super classes'>	
	
	^self
		lookUpPropertyNamed: #numberOfAttributesInherited
		computedAs: [self inheritedAttributes size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfAttributesInherited: aNumber [
	self privateState cacheAt: #numberOfAttributesInherited put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsAdded [
	<FMProperty: #numberOfMethodsAdded type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class added with respect to super classes'>	
	
	^self
		lookUpPropertyNamed: #numberOfMethodsAdded
		computedAs: [self addedMethods size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsAdded: aNumber [
	self privateState cacheAt: #numberOfMethodsAdded put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInHierarchy [
	<FMProperty: #numberOfMethodsInHierarchy type: #Number>
	<derived>
	<FMComment: 'The number of methods of a class included the inherited ones'>	
	
	| totNom |
	totNom := self methods size.
	self superclassHierarchyGroup
		do: [:aClass | totNom := totNom + aClass methods size].
	^totNom
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInHierarchy: aNumber [
	self privateState cacheAt: #numberOfMethodsInHierarchy put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInherited [
	<FMProperty: #numberOfMethodsInherited type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class inherited from super classes'>	

	^self
		lookUpPropertyNamed: #numberOfMethodsInherited
		computedAs: [self inheritedMethods size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInherited: aNumber [
	self privateState cacheAt: #numberOfMethodsInherited put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsOverriden [
	<FMProperty: #numberOfMethodsOverriden type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class overriden with respect to super classes'>
			
	^self
		lookUpPropertyNamed: #numberOfMethodsOverriden
		computedAs: [self numberOfMethods - self numberOfMethodsAdded]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsOverriden: aNumber [
	self privateState cacheAt: #numberOfMethodsOverriden put: aNumber
]
