"
## Properties
======================

| Name | Type | Comment |
| `isSomething` | Boolean | |

"
Class {
	#name : #FamixTest6Spam,
	#superclass : #FamixTest6Bacon,
	#instVars : [
		'#isSomething => FMProperty defaultValue: false'
	],
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6Spam class >> annotation [

	<FMClass: #Spam super: #FamixTest6Bacon>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTest6Spam >> isSomething [

	<FMProperty: #isSomething type: #Boolean defaultValue: false>
	<generated>
	^ isSomething ifNil: [ isSomething := false ]
]

{ #category : #accessing }
FamixTest6Spam >> isSomething: anObject [
	<generated>
	isSomething := anObject
]
