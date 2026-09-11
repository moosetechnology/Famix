"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `books` | `FamixTest4Person` | `person` | `FamixTest4Book` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `age` | `Number` | nil | |
| `firstName` | `String` | nil | |
| `lastName` | `String` | nil | |

"
Class {
	#name : 'FamixTest4Person',
	#superclass : 'FamixTest4Entity',
	#instVars : [
		'#firstName => FMProperty',
		'#lastName => FMProperty',
		'#age => FMProperty',
		'#books => FMMany type: #FamixTest4Book opposite: #person'
	],
	#category : 'Famix-Test4-Entities-Entities',
	#package : 'Famix-Test4-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest4Person class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Person super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixTest4Person class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixTest4Person
]

{ #category : 'comparing' }
FamixTest4Person >> = aFamixTest4Person [

	<ignoreForCoverage>
	<generated>
	^ aFamixTest4Person firstName = self firstName and: [ aFamixTest4Person lastName = self lastName and: [ aFamixTest4Person age = self age] ] 
]

{ #category : 'adding' }
FamixTest4Person >> addBook: anObject [

	<ignoreForCoverage>
	<generated>
	^ self books add: anObject
]

{ #category : 'accessing' }
FamixTest4Person >> age [

	<FMProperty: #age type: #Number>
	<ignoreForCoverage>
	<generated>
	^ age
]

{ #category : 'accessing' }
FamixTest4Person >> age: anObject [
	<ignoreForCoverage>
	<generated>
	age := anObject
]

{ #category : 'accessing' }
FamixTest4Person >> books [
	"Relation named: #books type: #FamixTest4Book opposite: #person"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ books
]

{ #category : 'accessing' }
FamixTest4Person >> books: anObject [

	<ignoreForCoverage>
	<generated>
	books value: anObject
]

{ #category : 'accessing' }
FamixTest4Person >> firstName [

	<FMProperty: #firstName type: #String>
	<ignoreForCoverage>
	<generated>
	^ firstName
]

{ #category : 'accessing' }
FamixTest4Person >> firstName: anObject [
	<ignoreForCoverage>
	<generated>
	firstName := anObject
]

{ #category : 'comparing' }
FamixTest4Person >> hash [

	<ignoreForCoverage>
	<generated>
	^ self firstName hash bitXor: self lastName hash bitXor: self age hash 
]

{ #category : 'accessing' }
FamixTest4Person >> lastName [

	<FMProperty: #lastName type: #String>
	<ignoreForCoverage>
	<generated>
	^ lastName
]

{ #category : 'accessing' }
FamixTest4Person >> lastName: anObject [
	<ignoreForCoverage>
	<generated>
	lastName := anObject
]
