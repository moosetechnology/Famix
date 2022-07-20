Class {
	#name : #FamixJavaContainerEntity,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTWithInterfaces + FamixTWithAnnotationTypes + FamixTWithClasses + TOODependencyQueries',
	#classTraits : 'FamixJavaTWithInterfaces classTrait + FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait + TOODependencyQueries classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaContainerEntity class >> annotation [

	<FMClass: #ContainerEntity super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
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
