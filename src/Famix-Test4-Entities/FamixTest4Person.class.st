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
| `firstName` | `String` | nil | |
| `lastName` | `String` | nil | |

"
Class {
	#name : #FamixTest4Person,
	#superclass : #FamixTest4Entity,
	#instVars : [
		'#firstName => FMProperty',
		'#lastName => FMProperty',
		'#books => FMMany type: #FamixTest4Book opposite: #person'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Person class >> annotation [

	<FMClass: #Person super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixTest4Person class >> isAbstract [

	<generated>
	^ self == FamixTest4Person
]

{ #category : #comparing }
FamixTest4Person >> = aFamixTest4Person [

	<generated>
	^ aFamixTest4Person firstName = self firstName and: [ aFamixTest4Person lastName = self lastName] 
]

{ #category : #adding }
FamixTest4Person >> addBook: anObject [
	<generated>
	^ self books add: anObject
]

{ #category : #accessing }
FamixTest4Person >> books [
	"Relation named: #books type: #FamixTest4Book opposite: #person"

	<generated>
	<derived>
	^ books
]

{ #category : #accessing }
FamixTest4Person >> books: anObject [

	<generated>
	books value: anObject
]

{ #category : #navigation }
FamixTest4Person >> booksGroup [
	<generated>
	<navigation: 'Books'>
	^ MooseSpecializedGroup withAll: self books asSet
]

{ #category : #accessing }
FamixTest4Person >> firstName [

	<FMProperty: #firstName type: #String>
	<generated>
	^ firstName
]

{ #category : #accessing }
FamixTest4Person >> firstName: anObject [
	<generated>
	firstName := anObject
]

{ #category : #comparing }
FamixTest4Person >> hash [

	<generated>
	^ self firstName hash bitXor: self lastName hash 
]

{ #category : #accessing }
FamixTest4Person >> lastName [

	<FMProperty: #lastName type: #String>
	<generated>
	^ lastName
]

{ #category : #accessing }
FamixTest4Person >> lastName: anObject [
	<generated>
	lastName := anObject
]
