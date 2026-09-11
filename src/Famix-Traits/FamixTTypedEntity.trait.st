"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|



"
Trait {
	#name : 'FamixTTypedEntity',
	#instVars : [
		'#typing => FMOne type: #FamixTEntityTyping opposite: #typedEntity'
	],
	#category : 'Famix-Traits-Type',
	#package : 'Famix-Traits',
	#tag : 'Type'
}

{ #category : 'meta' }
FamixTTypedEntity classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTypedEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTTypedEntity >> declaredType [

	^ self typing ifNotNil: [ self typing declaredType ]
]

{ #category : 'testing' }
FamixTTypedEntity >> entityHasOutgoingTypeDeclarations [

	self
		deprecated: 'Use #hasDeclaredType instead.'
		transformWith: '`@receiver entityHasOutgoingTypeDeclarations'
			-> '`@receiver hasDeclaredType'.

	^ self hasDeclaredType
]

{ #category : 'testing' }
FamixTTypedEntity >> hasDeclaredType [

	^ self declaredType isNotNil
]

{ #category : 'accessing' }
FamixTTypedEntity >> typing [
	"Relation named: #typing type: #FamixTEntityTyping opposite: #typedEntity"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Association linking this entity to its declared type.'>
	^ typing
]

{ #category : 'accessing' }
FamixTTypedEntity >> typing: anObject [

	<ignoreForCoverage>
	<generated>
	typing := anObject
]
