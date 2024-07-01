"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `person` | `FamixTest4Book` | `books` | `FamixTest4Person` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `id` | `Number` | nil | |

"
Class {
	#name : #FamixTest4Book,
	#superclass : #FamixTest4Entity,
	#instVars : [
		'#id => FMProperty',
		'#person => FMOne type: #FamixTest4Person opposite: #books'
	],
	#category : #'Famix-Test4-Entities-Entities'
}

{ #category : #meta }
FamixTest4Book class >> annotation [

	<FMClass: #Book super: #FamixTest4Entity>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^ self
]

{ #category : #comparing }
FamixTest4Book >> = aFamixTest4Book [

	<generated>
	^ aFamixTest4Book id = self id
]

{ #category : #comparing }
FamixTest4Book >> hash [

	<generated>
	^ self id hash 
]

{ #category : #accessing }
FamixTest4Book >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : #accessing }
FamixTest4Book >> id: anObject [
	<generated>
	id := anObject
]

{ #category : #accessing }
FamixTest4Book >> person [
	"Relation named: #person type: #FamixTest4Person opposite: #books"

	<generated>
	<container>
	^ person
]

{ #category : #accessing }
FamixTest4Book >> person: anObject [

	<generated>
	person := anObject
]

{ #category : #navigation }
FamixTest4Book >> personGroup [
	<generated>
	<navigation: 'Person'>
	^ MooseSpecializedGroup with: self person
]
