Trait {
	#name : #FamixTHasVisibility,
	#instVars : [
		'#visibility => FMProperty'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTHasVisibility classSide >> annotation [

	<FMClass: #THasVisibility super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTHasVisibility >> bePackageVisibility [

	self visibility: #package
]

{ #category : #accessing }
FamixTHasVisibility >> bePrivate [

	self visibility: #private
]

{ #category : #accessing }
FamixTHasVisibility >> beProtected [

	self visibility: #protected
]

{ #category : #accessing }
FamixTHasVisibility >> bePublic [

	self visibility: #public
]

{ #category : #accessing }
FamixTHasVisibility >> isPackageVisibility [
	<FMProperty: #isPackageVisibility type: #Boolean> <derived>
	<FMComment: 'Flag true for entities that have a package visibility. Language dependent.'>
	
	^ self visibility = #package
]

{ #category : #accessing }
FamixTHasVisibility >> isPackageVisibility: aBoolean [

	aBoolean ifTrue: [ self visibility: #package ]
]

{ #category : #accessing }
FamixTHasVisibility >> isPrivate [
	<FMProperty: #isPrivate type: #Boolean> <derived>
	<FMComment: 'Flag true for entities invisible out of their owner scope. Language dependent.'>
	
		^ self visibility = #private
]

{ #category : #accessing }
FamixTHasVisibility >> isPrivate: aBoolean [

	aBoolean ifTrue: [ self visibility: #private ]
]

{ #category : #accessing }
FamixTHasVisibility >> isProtected [
	<FMProperty: #isProtected type: #Boolean> <derived>
	<FMComment: 'Flag true for protected entities, depending on language semantics.'>
	
	^ self visibility = #protected
]

{ #category : #accessing }
FamixTHasVisibility >> isProtected: aBoolean [

	aBoolean ifTrue: [ self visibility: #protected ]
]

{ #category : #accessing }
FamixTHasVisibility >> isPublic [
	<FMProperty: #isPublic type: #Boolean> <derived>
	<FMComment: 'Flag true for entities accessible from anywhere. Language dependent.'>	

	^ self visibility = #public
]

{ #category : #accessing }
FamixTHasVisibility >> isPublic: aBoolean [

	aBoolean ifTrue: [ self visibility: #public ]
]

{ #category : #accessing }
FamixTHasVisibility >> visibility [

	<FMProperty: #visibility type: #String>
	<generated>
	<FMComment: 'Visibility of the entity'>
	^ visibility
]

{ #category : #accessing }
FamixTHasVisibility >> visibility: anObject [
	<generated>
	visibility := anObject
]
