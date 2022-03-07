Class {
	#name : #CppMethod,
	#superclass : #CppBehaviouralEntity,
	#traits : '(FamixTHasModifiers + FamixTMethod + FamixTHasKind + FamixTWithTypes withPrecedenceOf: FamixTHasModifiers)',
	#classTraits : '(FamixTHasModifiers classTrait + FamixTMethod classTrait + FamixTHasKind classTrait + FamixTWithTypes classTrait withPrecedenceOf: FamixTHasModifiers classTrait)',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppMethod class >> annotation [

	<FMClass: #Method super: #CppBehaviouralEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
CppMethod >> clientTypes [
	<FMProperty: #clientTypes type: #FamixTType>
	<multivalued>
	<derived>
	<FMComment: 'All types that depend on the receiver'>
	^ (self queryAllIncoming atScope: FamixTType) withoutSelfLoops

]

{ #category : #testing }
CppMethod >> isConstructor [
	^ #constructor = self kind or: [ self parentType ifNotNil: [ :type | self name = type name ] ]
]

{ #category : #testing }
CppMethod >> isDead [
	<FMProperty: #isDead type: #Boolean>
	<derived>
	<FMComment: 'Is the entity dead (not invoked in the system)'>
	(self isConstructor or: [ self isDestructor ]) ifTrue: [ ^ false ].

	^ self isContainerEntity
		ifTrue: [ self lookUpPropertyNamed: #isDead computedAs: [ self hasIncomingDependencies not or: [ self queryAllIncoming withoutSelfLoops isEmpty ] ] ]
		ifFalse: [ false ]
]

{ #category : #testing }
CppMethod >> isDestructor [
	^ #destructor = self kind or: [ self parentType ifNotNil: [ :type | self name = ('~' , type name) ] ]
]

{ #category : #accessing }
CppMethod >> isDestructor: aBoolean [
	aBoolean
		ifTrue: [ self kind: #destructor ]
		ifFalse: [ self isDestructor
				ifTrue: [ self kind: nil ] ]
]
