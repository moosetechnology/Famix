"
A Referenceable is an entity that can be the target of a Reference.
	
It is usually a type but depending on the language it can be other things such as methods, functions, and even modules or packages in the case of Python.

History:
In the past the opposite of Referenceable was `#referredType` but we extended it to any kind of entity.
The reason is that in Python we can reference methods, functions, class, modules, packages, lambdas... Or in Java we can reference methods.
We found 3 solutions to manage this:
- Extend Reference to cover all kind of references: Selected solution
- Add a ""PythonQuoteAssociation"" for all other references than the ones targeting the types: This was not selected since it seems incoherente to have everything in an association except types
- Add an association for each kind of targets: This was not selected because it seemed too much work for little gain

## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|



"
Trait {
	#name : #FamixTReferenceable,
	#instVars : [
		'#incomingReferences => FMMany type: #FamixTReference opposite: #referredEntity'
	],
	#category : #'Famix-Traits-Reference'
}

{ #category : #meta }
FamixTReferenceable classSide >> annotation [

	<FMClass: #TReferenceable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTReferenceable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTReferenceable: self
]

{ #category : #accessing }
FamixTReferenceable >> addIncomingReference: aReference [ 
	incomingReferences add: aReference
]

{ #category : #accessing }
FamixTReferenceable >> incomingReferences [
	"Relation named: #incomingReferences type: #FamixTReference opposite: #referredEntity"

	<generated>
	<FMComment: 'References to this entity by other entities.'>
	<derived>
	^ incomingReferences
]

{ #category : #accessing }
FamixTReferenceable >> incomingReferences: anObject [

	<generated>
	incomingReferences value: anObject
]
