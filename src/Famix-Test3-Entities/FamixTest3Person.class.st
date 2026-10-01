"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `books` | `FamixTest3Person` | `person` | `FamixTest3Book` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `age` | `Number` | nil | |
| `firstName` | `String` | nil | |
| `lastName` | `String` | nil | |

"
Class {
	#name : 'FamixTest3Person',
	#superclass : 'FamixTest3Entity',
	#instVars : [
		'#firstName => FMProperty',
		'#lastName => FMProperty',
		'#age => FMProperty',
		'#books => FMMany type: #FamixTest3Book opposite: #person'
	],
	#category : 'Famix-Test3-Entities-Entities',
	#package : 'Famix-Test3-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest3Person class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Person super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest3Person class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest3Person
]

{ #category : 'comparing' }
FamixTest3Person >> = aFamixTest3Person [

	<ignoreForCoverage>
	<generated>
	^ aFamixTest3Person firstName = self firstName and: [ aFamixTest3Person lastName = self lastName and: [ aFamixTest3Person age = self age] ] 
]

{ #category : 'adding' }
FamixTest3Person >> addBook: anObject [

	<ignoreForCoverage>
	<generated>
	^ self books add: anObject
]

{ #category : 'accessing' }
FamixTest3Person >> age [

	<FMProperty: #age type: #Number>
	<ignoreForCoverage>
	<generated>
	^ age
]

{ #category : 'accessing' }
FamixTest3Person >> age: anObject [
	<ignoreForCoverage>
	<generated>
	age := anObject
]

{ #category : 'accessing' }
FamixTest3Person >> books [
	"Relation named: #books type: #FamixTest3Book opposite: #person"

	<ignoreForCoverage>
	<generated>
	^ books
]

{ #category : 'accessing' }
FamixTest3Person >> books: anObject [

	<ignoreForCoverage>
	<generated>
	books value: anObject
]

{ #category : 'accessing' }
FamixTest3Person >> firstName [

	<FMProperty: #firstName type: #String>
	<ignoreForCoverage>
	<generated>
	^ firstName
]

{ #category : 'accessing' }
FamixTest3Person >> firstName: anObject [
	<ignoreForCoverage>
	<generated>
	firstName := anObject
]

{ #category : 'comparing' }
FamixTest3Person >> hash [

	<ignoreForCoverage>
	<generated>
	^ self firstName hash bitXor: self lastName hash bitXor: self age hash 
]

{ #category : 'accessing' }
FamixTest3Person >> lastName [

	<FMProperty: #lastName type: #String>
	<ignoreForCoverage>
	<generated>
	^ lastName
]

{ #category : 'accessing' }
FamixTest3Person >> lastName: anObject [
	<ignoreForCoverage>
	<generated>
	lastName := anObject
]
