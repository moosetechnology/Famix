"
## Properties
======================

| Name | Type | Comment |
| `eggs` | Number | |
| `isFood` | Boolean | |

"
Class {
	#name : #FamixTest6Bacon,
	#superclass : #FamixTest6Entity,
	#instVars : [
		'#isFood => FMProperty defaultValue: true',
		'#eggs => FMProperty defaultValue: 12'
	],
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6Bacon class >> annotation [

	<FMClass: #Bacon super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTest6Bacon >> eggs [

	<FMProperty: #eggs type: #Number defaultValue: 12>
	<generated>
	^ eggs ifNil: [ eggs := 12 ]
]

{ #category : #accessing }
FamixTest6Bacon >> eggs: anObject [
	<generated>
	eggs := anObject
]

{ #category : #accessing }
FamixTest6Bacon >> isFood [

	<FMProperty: #isFood type: #Boolean defaultValue: true>
	<generated>
	^ isFood ifNil: [ isFood := true ]
]

{ #category : #accessing }
FamixTest6Bacon >> isFood: anObject [
	<generated>
	isFood := anObject
]
