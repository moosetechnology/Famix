"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `brand` | `String` | '' | |
| `eggs` | `Number` | 12 | |
| `isFood` | `Boolean` | true | |

"
Class {
	#name : 'FamixTest6Bacon',
	#superclass : 'FamixTest6Entity',
	#instVars : [
		'#brand => FMProperty defaultValue: \'\'',
		'#eggs => FMProperty defaultValue: 12',
		'#isFood => FMProperty defaultValue: true'
	],
	#category : 'Famix-Test6-Entities-Entities',
	#package : 'Famix-Test6-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest6Bacon class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Bacon super: #FamixTest6Entity>
	<package: #'Famix-Test6-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest6Bacon >> brand [

	<FMProperty: #brand type: #String defaultValue: ''>
	<ignoreForCoverage>
	<generated>
	^ brand ifNil: [ brand := '' ]
]

{ #category : 'accessing' }
FamixTest6Bacon >> brand: anObject [
	<ignoreForCoverage>
	<generated>
	brand := anObject
]

{ #category : 'accessing' }
FamixTest6Bacon >> eggs [

	<FMProperty: #eggs type: #Number defaultValue: 12>
	<ignoreForCoverage>
	<generated>
	^ eggs ifNil: [ eggs := 12 ]
]

{ #category : 'accessing' }
FamixTest6Bacon >> eggs: anObject [
	<ignoreForCoverage>
	<generated>
	eggs := anObject
]

{ #category : 'accessing' }
FamixTest6Bacon >> isFood [

	<FMProperty: #isFood type: #Boolean defaultValue: true>
	<ignoreForCoverage>
	<generated>
	^ isFood ifNil: [ isFood := true ]
]

{ #category : 'accessing' }
FamixTest6Bacon >> isFood: anObject [
	<ignoreForCoverage>
	<generated>
	isFood := anObject
]
