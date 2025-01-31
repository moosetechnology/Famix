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

	^ self typeDeclaration ifNotNil: [ self typeDeclaration declaredType ]
]

{ #category : #accessing }
FamixTTypedEntity >> declaredType: aType [
	"This method exists for compatibility reasons after reifying #declaredType with Type declaration.
	It can be kept as a shortcut to build type declarations."

	Warning signal:
		'You tried to use #declaredType: to create a direct relation between you typed entity and its type.
	This relation has been reified. You need to create an association named a TypeDeclaration.
	Your typed entity is the source and the type is the target.
	
	If you proceed, the TypeDeclaration will be automatically created, based on the metamodel of this typed entity'.

	self class mooseDescription metamodel classes
		detect: [ :cls | cls name = #TypeDeclaration ]
		ifFound: [ :fm3Class |
			self typeDeclaration:
				(fm3Class implementingClass new declaredType: aType) ]
		ifNone: [ FamixDeclaredTypeAutomationError signal ]
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
