"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeDeclaration` | `FamixTTypedEntity` | `typedEntity` | `FamixTTypeDeclaration` | Association linking this entity to its declared type.|



"
Trait {
	#name : #FamixTTypedEntity,
	#instVars : [
		'#typeDeclaration => FMOne type: #FamixTTypeDeclaration opposite: #typedEntity'
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

	self mooseModel ifNil: [ FamixDeclaredTypeAutomationError signal ].

	self typeDeclaration:
		(self mooseModel newTypeDeclaration declaredType: aType)
]

{ #category : #testing }
FamixTTypedEntity >> entityHasOutgoingTypeDeclarations [

	^ self hasDeclaredType
]

{ #category : #testing }
FamixTTypedEntity >> hasDeclaredType [

	^ self typeDeclaration isNotNil and: [
		  self typeDeclaration declaredType isNotNil ]
]

{ #category : #accessing }
FamixTTypedEntity >> typeDeclaration [
	"Relation named: #typeDeclaration type: #FamixTTypeDeclaration opposite: #typedEntity"

	<generated>
	<FMComment: 'Association linking this entity to its declared type.'>
	^ typeDeclaration
]

{ #category : #accessing }
FamixTTypedEntity >> typeDeclaration: anObject [

	<generated>
	typeDeclaration := anObject
]
