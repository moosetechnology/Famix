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

{ #category : #enumerating }
FamixJavaParameterizableClass >> subclassHierarchy [
	"has to redefine this method to override the one from TWithInheritance"
	| superclasses |
	superclasses := OrderedCollection new.
	self parameterizedTypes do: [ :parameterizedType | 
		parameterizedType allSubclassesDo: [ :each | superclasses add: each ] ].
	^ superclasses
]

{ #category : #enumerating }
FamixJavaParameterizableClass >> superclassHierarchy [
	"has to redefine this method to override the one from TWithInheritance"
	| superclasses |
	superclasses := OrderedCollection new.
	self parameterizedTypes do: [ :parameterizedType | 
		parameterizedType allSuperclassesDo: [ :each | 
			superclasses add: each ] ].
	^ superclasses
]
