Trait {
	#name : #FamixTClassWithVisibility,
	#traits : 'FamixTClass + FamixTHasVisibility',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTClassWithVisibility classSide >> annotation [

	<FMClass: #TClassWithVisibility super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedAttributes [

	| inheritedAttrs |
	inheritedAttrs := OrderedCollection new.
	self allSuperclassesDo: [ :each | 
		each attributes do: [ :attr | 
			attr isPrivate ifFalse: [ inheritedAttrs add: attr ] ] ].
	^ inheritedAttrs
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedMethods [

	| inheritedMethods |
	inheritedMethods := OrderedCollection new.
	self allSuperclassesDo: [ :each | 
		each methods do: [ :method | 
			method isPrivate ifFalse: [ inheritedMethods add: method ] ] ].
	^ inheritedMethods
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedSignatures [

	| inheritedSignatures |
	inheritedSignatures := Set new.
	self superclassHierarchy do: [ :each | 
		each methods do: [ :method | 
			method isPrivate ifFalse: [ 
				inheritedSignatures add: method signature ] ] ].
	^ inheritedSignatures
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedSignaturesToMethod [

	| inheritedSignaturesToMethod |
	inheritedSignaturesToMethod := Dictionary new.
	self allSuperclassesDo: [ :each | 
		each methods do: [ :method | 
			method isPrivate ifFalse: [ 
				inheritedSignaturesToMethod
					at: method signature
					ifAbsentPut: [ method ] ] ] ].
	^ inheritedSignaturesToMethod
]
