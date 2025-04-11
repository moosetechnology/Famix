"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|



"
Trait {
	#name : #FamixTTypedEntity,
	#instVars : [
		'#typing => FMOne type: #FamixTEntityTyping opposite: #typedEntity'
	],
	#category : #'Famix-Traits-Type'
}

{ #category : #meta }
FamixTTypedEntity classSide >> annotation [

	<FMClass: #TTypedEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTTypedEntity >> declaredType [
	"This method exists for compatibility reasons after reifying #declaredType with Type declaration.
	It can be kept as a shortcut to build type declarations."

	^ self typing ifNotNil: [ self typing declaredType ]
]

{ #category : #testing }
FamixTTypedEntity >> entityHasOutgoingTypeDeclarations [

	^ self hasDeclaredType
]

{ #category : #testing }
FamixTTypedEntity >> hasDeclaredType [

	^ self declaredType isNotNil
]

{ #category : #accessing }
FamixTTypedEntity >> typing [
	"Relation named: #typing type: #FamixTEntityTyping opposite: #typedEntity"

	<generated>
	<FMComment: 'Association linking this entity to its declared type.'>
	^ typing
]

{ #category : #accessing }
FamixTTypedEntity >> typing: anObject [

	<generated>
	typing := anObject
]
