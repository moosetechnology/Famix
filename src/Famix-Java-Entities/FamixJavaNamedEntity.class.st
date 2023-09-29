Class {
	#name : #FamixJavaNamedEntity,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamedEntity + FamixTWithAnnotationInstances + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamedEntity classTrait + FamixTWithAnnotationInstances classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixJavaNamedEntity class >> isAbstract [

	<generated>
	^ self == FamixJavaNamedEntity
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
