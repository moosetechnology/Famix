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
FamixJavaParameterizedType >> allSubclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSubclassesDo: aBlock ]
]

{ #category : #enumerating }
FamixJavaParameterizedType >> allSuperclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSuperclassesDo: aBlock ]
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
