Class {
	#name : #FamixJavaException,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTException',
	#classTraits : 'FamixTException classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaException class >> annotation [

	<FMClass: #Exception super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #printing }
FamixJavaException >> displayStringOn: aStream [

	self exceptionClass displayStringOn: aStream
]

{ #category : #accessing }
FamixJavaException >> mooseNameOn: aStream [
	aStream nextPutAll: (self class name withoutPrefix: 'FamixJava').
	aStream nextPut: $-.
	self exceptionClass ifNotNil: [ :ec | ec mooseNameOn: aStream ]
]
