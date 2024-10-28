"
An entity that is shadowable is an entity that can be redefined and the new implementation with the same name takes precedence over the old one when calling it by its name later. 
	
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

The opposite of a shadowable is a shadower.


## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `shadowingEntity` | `FamixTShadowable` | `shadowedEntity` | `FamixTShadower` | Entity shadowing me in my defining scope.|



"
Trait {
	#name : #FamixTShadowable,
	#instVars : [
		'#shadowingEntity => FMOne type: #FamixTShadower opposite: #shadowedEntity'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTShadowable classSide >> annotation [

	<FMClass: #TShadowable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTShadowable >> shadowingEntity [
	"Relation named: #shadowingEntity type: #FamixTShadower opposite: #shadowedEntity"

	<generated>
	<FMComment: 'Entity shadowing me in my defining scope.'>
	^ shadowingEntity
]

{ #category : #accessing }
FamixTShadowable >> shadowingEntity: anObject [

	<generated>
	shadowingEntity := anObject
]
