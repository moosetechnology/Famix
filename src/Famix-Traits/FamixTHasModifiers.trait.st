"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `modifiers` | `String` | nil | Generic container for language dependent modifiers.|

"
Trait {
	#name : #FamixTHasModifiers,
	#instVars : [
		'#modifiers => FMProperty'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTHasModifiers classSide >> annotation [

	<FMClass: #THasModifiers super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTHasModifiers >> modifiers [

	<FMProperty: #modifiers type: #String>
	<generated>
	<multivalued>
	<FMComment: 'Generic container for language dependent modifiers.'>
	^ modifiers
]

{ #category : #accessing }
FamixTHasModifiers >> modifiers: anObject [
	<generated>
	modifiers := anObject
]
