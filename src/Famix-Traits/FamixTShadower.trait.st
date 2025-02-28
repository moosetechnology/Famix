"
An entity that is a shadower is an entity that can redefine another entity and the new implementation with the same name takes precedence over the old one when calling it by its name later. 
	
	For example in Python it is possible to have this:
	
	```python
def return3():
    return 3

print(return3())

from moduleAtRoot8 import functionReturningSomething as return3

print(return3())

def return3():
    return 3

print(return3())
```

In this case, return3 is shadowed twice. Once by the alias of an import and a second time by another function.

The opposite of a shadower is a shadowable.


## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `shadowedEntity` | `FamixTShadower` | `shadowingEntities` | `FamixTShadowable` | Entity that is been shadowed by myself in my defining scope.|



"
Trait {
	#name : #FamixTShadower,
	#instVars : [
		'#shadowedEntity => FMOne type: #FamixTShadowable opposite: #shadowingEntities'
	],
	#category : #'Famix-Traits-Shadowing'
}

{ #category : #meta }
FamixTShadower classSide >> annotation [

	<FMClass: #TShadower super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTShadower >> shadowedEntity [
	"Relation named: #shadowedEntity type: #FamixTShadowable opposite: #shadowingEntities"

	<generated>
	<FMComment: 'Entity that is been shadowed by myself in my defining scope.'>
	^ shadowedEntity
]

{ #category : #accessing }
FamixTShadower >> shadowedEntity: anObject [

	<generated>
	shadowedEntity := anObject
]
