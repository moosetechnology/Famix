"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `person` | `FamixTest3Book` | `books` | `FamixTest3Person` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `id` | `Number` | nil | |

"
Class {
	#name : 'FamixTest3Book',
	#superclass : 'FamixTest3Entity',
	#instVars : [
		'#id => FMProperty',
		'#person => FMOne type: #FamixTest3Person opposite: #books'
	],
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3Book class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Book super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : 'comparing' }
FamixTest3Book >> = aFamixTest3Book [

	<ignoreForCoverage>
	<generated>
	^ aFamixTest3Book id = self id
]

{ #category : 'comparing' }
FamixTest3Book >> hash [

	<ignoreForCoverage>
	<generated>
	^ self id hash 
]

{ #category : 'accessing' }
FamixTest3Book >> id [

	<FMProperty: #id type: #Number>
	<ignoreForCoverage>
	<generated>
	^ id
]

{ #category : 'accessing' }
FamixTest3Book >> id: anObject [
	<ignoreForCoverage>
	<generated>
	id := anObject
]

{ #category : 'accessing' }
FamixTest3Book >> person [
	"Relation named: #person type: #FamixTest3Person opposite: #books"

	<ignoreForCoverage>
	<generated>
	<container>
	^ person
]

{ #category : 'accessing' }
FamixTest3Book >> person: anObject [

	<ignoreForCoverage>
	<generated>
	person := anObject
]
