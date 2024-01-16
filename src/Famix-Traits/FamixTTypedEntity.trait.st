"
## Relations
======================

### Other
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any


"
Trait {
	#name : #FamixTTypedEntity,
	#instVars : [
		'#declaredType => FMOne type: #FamixTType opposite: #typedEntities'
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
	"Relation named: #declaredType type: #FamixTType opposite: #typedEntities"

	<generated>
	<FMComment: 'Type of the entity, if any'>
	^ declaredType
]

{ #category : #accessing }
FamixTTypedEntity >> declaredType: anObject [

	<generated>
	declaredType := anObject
]

{ #category : #'moose query' }
FamixTTypedEntity >> entityHasOutgoingTypeDeclarations [
	^ self hasDeclaredType
]

{ #category : #testing }
FamixTTypedEntity >> hasDeclaredType [
	^ self declaredType isNotNil
]
