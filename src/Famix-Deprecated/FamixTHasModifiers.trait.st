Trait {
	#name : #FamixTHasModifiers,
	#instVars : [
		'#modifiers => FMProperty'
	],
	#category : #'Famix-Deprecated-Modifiers'
}

{ #category : #meta }
FamixTHasModifiers classSide >> annotation [

	<FMClass: #THasModifiers super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTHasModifiers >> addModifier: aString [
	self modifiers add: aString
]

{ #category : #accessing }
FamixTHasModifiers >> bePrivate [
	^ self isPrivate: true
]

{ #category : #accessing }
FamixTHasModifiers >> beProtected [

	^ self isProtected: true
]

{ #category : #accessing }
FamixTHasModifiers >> bePublic [
	^ self isPublic: true
]

{ #category : #testing }
FamixTHasModifiers >> isAbstract [
	<FMProperty: #isAbstract type: #Boolean> <derived>
	<FMComment: 'Flag true for abstract entities. Language dependent.'>
	
	^ self modifiers includes: #abstract
]

{ #category : #accessing }
FamixTHasModifiers >> isAbstract: aBoolean [
	^ self modifierSet: aBoolean for: #abstract
]

{ #category : #accessing }
FamixTHasModifiers >> isFinal [
	<FMProperty: #isFinal type: #Boolean> <derived>
	<FMComment: 'Flag true for entities defined as being final. Language dependent.'>	

	^ self modifiers includes: #final
]

{ #category : #accessing }
FamixTHasModifiers >> isFinal: aBoolean [
	^ self modifierSet: aBoolean for: #final
]

{ #category : #accessing }
FamixTHasModifiers >> isPackageVisibility: aBoolean [
	^ self modifierSet: aBoolean for: #package
]

{ #category : #accessing }
FamixTHasModifiers >> isPrivate: aBoolean [
	^ self modifierSet: aBoolean for: #private
]

{ #category : #accessing }
FamixTHasModifiers >> isProtected: aBoolean [

	^ self modifierSet: aBoolean for: #protected
]

{ #category : #accessing }
FamixTHasModifiers >> isPublic: aBoolean [
	^ self modifierSet: aBoolean for: #public
]

{ #category : #accessing }
FamixTHasModifiers >> modifierSet: aBoolean for: aSymbol [
	^ aBoolean ifTrue: [self addModifier: aSymbol] ifFalse: [self removeModifier: aSymbol]
]

{ #category : #accessing }
FamixTHasModifiers >> modifiers [

	<FMProperty: #modifiers type: #String>
	<multivalued>
	<FMComment: 'Generic container for language dependent modifiers.'>
	^ modifiers ifNil: [ modifiers := Set new ]
]

{ #category : #accessing }
FamixTHasModifiers >> modifiers: anObject [
	<generated>
	modifiers := anObject
]

{ #category : #accessing }
FamixTHasModifiers >> removeModifier: aString [
	self modifiers remove: aString ifAbsent: []
]
