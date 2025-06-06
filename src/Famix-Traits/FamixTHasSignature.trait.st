"
The signature of any behavioural entity

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `signature` | `String` | nil | Signature of the message being sent|

"
Trait {
	#name : #FamixTHasSignature,
	#instVars : [
		'#signature => FMProperty'
	],
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTHasSignature classSide >> annotation [

	<FMClass: #THasSignature super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTHasSignature >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTHasSignature: self
]

{ #category : #accessing }
FamixTHasSignature >> signature [

	<FMProperty: #signature type: #String>
	<generated>
	<FMComment: 'Signature of the message being sent'>
	^ signature
]

{ #category : #accessing }
FamixTHasSignature >> signature: anObject [
	<generated>
	signature := anObject
]
