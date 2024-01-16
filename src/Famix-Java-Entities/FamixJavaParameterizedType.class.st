"
## Relations
======================

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `interfaceImplementations` | `FamixTImplementation` | `implementingClass` | Implementation relationships|
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `implementations` | `FamixTImplementation` | `interface` | Implementation relationships.|
| `subInheritances` | `FamixTInheritance` | `superclass` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Type | Opposite | Comment |
| `arguments` | `FamixTParameterizedTypeUser` | `argumentsInParameterizedTypes` | |
| `parameterizableClass` | `FamixTWithParameterizedTypes` | `parameterizedTypes` | Base type of this parameterized type.|



"
Class {
	#name : #FamixJavaParameterizedType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTCanImplement + FamixTImplementable + FamixTParameterizedType + FamixTWithInheritances + FamixTWithParameterizedTypeUsers',
	#classTraits : 'FamixTCanImplement classTrait + FamixTImplementable classTrait + FamixTParameterizedType classTrait + FamixTWithInheritances classTrait + FamixTWithParameterizedTypeUsers classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterizedType class >> annotation [

	<FMClass: #ParameterizedType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #enumerating }
FamixJavaParameterizedType >> allSuperclassesDo: aBlock [
	"override traversal to include supertypes of parameterizable class"

	| recursion |
	recursion := [ :each | 
	             aBlock value: each superclass.
	             each superclass allSuperclassesDo: aBlock ].
	self superInheritances do: recursion.
	self parameterizableClass ifNotNil: [ :class | 
		class superInheritances do: recursion ]
]

{ #category : #printing }
FamixJavaParameterizedType >> displayStringOn: aStream [
	self mooseNameOn: aStream
]

{ #category : #testing }
FamixJavaParameterizedType >> isParameterizedType [
	^ true
]

{ #category : #accessing }
FamixJavaParameterizedType >> mooseNameOn: aStream [

	self name ifNotNil: [ :n | aStream << n ] ifNil: [ 
		parameterizableClass
			ifNotNil: [ :pc | pc mooseNameOn: aStream ]
			ifNil: [ aStream nextPutAll: self class undefinedName ] ].
	aStream nextPut: $<.
	self arguments
		do: [ :each | each mooseNameOn: aStream ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $>
]
