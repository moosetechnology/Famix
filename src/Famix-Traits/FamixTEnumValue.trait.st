"
It models the values defined in an FamixTEnum. These are attributes of enums with default values.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	parentEnum	<(MultivalueLink of: FamixTEnum)>

## Relations
======================

### Parents
- Relation: #parentEnum Type: #FamixTWithEnumValues Opposite: #enumValues Comment: The Enum declaring this value. It offers the implementation of belongsTo
### Incoming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Trait {
	#name : #FamixTEnumValue,
	#instVars : [
		'#parentEnum => FMOne type: #FamixTWithEnumValues opposite: #enumValues'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-EnumValue'
}

{ #category : #meta }
FamixTEnumValue classSide >> annotation [

	<FMClass: #TEnumValue super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #testing }
FamixTEnumValue >> isEnumValue [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTEnumValue >> mooseNameOn: aStream [
	(self belongsTo isNotNil and: [ self belongsTo name isNotNil ])
		ifTrue: [ self belongsTo mooseNameOn: aStream.
			aStream << self mooseNameSeparator ].
	super mooseNameOn: aStream
]

{ #category : #accessing }
FamixTEnumValue >> mooseNameSeparator [
	^ '::'
]

{ #category : #accessing }
FamixTEnumValue >> parentEnum [
	"Relation named: #parentEnum type: #FamixTWithEnumValues opposite: #enumValues"

	<generated>
	<FMComment: 'The Enum declaring this value. It offers the implementation of belongsTo'>
	<container>
	^ parentEnum
]

{ #category : #accessing }
FamixTEnumValue >> parentEnum: anObject [

	<generated>
	parentEnum := anObject
]

{ #category : #navigation }
FamixTEnumValue >> parentEnumGroup [
	<generated>
	<navigation: 'ParentEnum'>
	^ MooseSpecializedGroup with: self parentEnum
]

{ #category : #accessing }
FamixTEnumValue >> parentType [ 

	^ self parentEnum
]
