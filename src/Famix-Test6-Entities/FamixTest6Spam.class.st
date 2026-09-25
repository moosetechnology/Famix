"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isSomething` | `Boolean` | false | |

"
Class {
	#name : 'FamixTest6Spam',
	#superclass : 'FamixTest6Bacon',
	#instVars : [
		'#isSomething => FMProperty defaultValue: false'
	],
	#category : 'Famix-Test6-Entities-Entities',
	#package : 'Famix-Test6-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest6Spam class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Spam super: #FamixTest6Bacon>
	<package: #'Famix-Test6-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest6Spam >> isSomething [

	<FMProperty: #isSomething type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	^ isSomething ifNil: [ isSomething := false ]
]

{ #category : 'accessing' }
FamixTest6Spam >> isSomething: anObject [
	<ignoreForCoverage>
	<generated>
	isSomething := anObject
]
