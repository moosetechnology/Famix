Class {
	#name : #FAMIXContainerEntity,
	#superclass : #FAMIXNamedEntity,
	#traits : 'FamixTWithAnnotationTypes + FamixTWithClasses + FamixTWithFunctions + TOODependencyQueries',
	#classTraits : 'FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait + FamixTWithFunctions classTrait + TOODependencyQueries classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXContainerEntity class >> annotation [

	<FMClass: #ContainerEntity super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FAMIXContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : #accessing }
FAMIXContainerEntity >> addFunction: aFunction [ 
	functions add: aFunction
]

{ #category : #'Famix-Java' }
FAMIXContainerEntity >> mooseNameWithDots [
	^ self mooseName ifNotNil: [ '.' join: (self mooseName substrings: '::') ]
]
