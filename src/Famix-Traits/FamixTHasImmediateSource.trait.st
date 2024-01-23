"
An immediate source is the source code of the entity stored directly into its sourceAnchor instead of accessing it (for example in a file) through its sourceAnchor

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
| `source` | `String` | nil | Actual source code of the source entity|

"
Trait {
	#name : #FamixTHasImmediateSource,
	#instVars : [
		'#source => FMProperty'
	],
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTHasImmediateSource classSide >> annotation [

	<FMClass: #THasImmediateSource super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #'instance creation' }
FamixTHasImmediateSource classSide >> source: aString [
	^ self new
		source: aString;
		yourself
]

{ #category : #'instance creation' }
FamixTHasImmediateSource classSide >> source: aString model: aMooseModel [
	^ (self source: aString)
		mooseModel: aMooseModel;
		yourself
]

{ #category : #testing }
FamixTHasImmediateSource >> hasSource [
	^ self source isEmptyOrNil not
]

{ #category : #accessing }
FamixTHasImmediateSource >> source [

	<FMProperty: #source type: #String>
	<generated>
	<FMComment: 'Actual source code of the source entity'>
	^ source
]

{ #category : #accessing }
FamixTHasImmediateSource >> source: anObject [
	<generated>
	source := anObject
]

{ #category : #accessing }
FamixTHasImmediateSource >> sourceText [

	^ self source
]
