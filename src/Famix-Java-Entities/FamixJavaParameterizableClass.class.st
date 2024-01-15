"
## Relations
======================

### Other
- Relation: #parameterizedTypes Type: #FamixTParameterizedType Opposite: #parameterizableClass


"
Class {
	#name : #FamixJavaParameterizableClass,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTWithParameterizedTypes',
	#classTraits : 'FamixTWithParameterizedTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterizableClass class >> annotation [

	<FMClass: #ParameterizableClass super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #enumerating }
FamixJavaParameterizableClass >> allSubclassesDo: aBlock [
	"override traversal to include subtypes of parameterized types"

	| recursion |
	recursion := [ :each | 
	             aBlock value: each subclass.
	             each subclass allSubclassesDo: aBlock ].
	self subInheritances do: recursion.
	self parameterizedTypes do: [ :type | 
		type subInheritances do: recursion ]
]

{ #category : #accessing }
FamixJavaParameterizableClass >> parameters [
	<FMProperty: #parameters type: #FamixJavaParameterType> <multivalued> <derived>
	<FMComment: 'Parameter types of this class.'>
	
	^self types select: [:each | each isParameterType]
]

{ #category : #accessing }
FamixJavaParameterizableClass >> parameters: aCollection [

	self attributeAt: #parameters put: aCollection
]
