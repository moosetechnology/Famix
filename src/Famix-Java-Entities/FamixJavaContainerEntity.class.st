Class {
	#name : #FamixJavaContainerEntity,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTWithInterfaces + FamixTWithAnnotationTypes + FamixTWithClasses',
	#classTraits : 'FamixJavaTWithInterfaces classTrait + FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaContainerEntity class >> annotation [

	<FMClass: #ContainerEntity super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixJavaContainerEntity class >> isAbstract [

	<generated>
	^ self == FamixJavaContainerEntity
]

{ #category : #adding }
FamixJavaContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : #adding }
FamixJavaContainerEntity >> addInterface: anInterface [
	
	types add: anInterface
]

{ #category : #'Famix-Java' }
FamixJavaContainerEntity >> mooseNameWithDots [
	^ self mooseName ifNotNil: [ '.' join: (self mooseName substrings: '::') ]
]
