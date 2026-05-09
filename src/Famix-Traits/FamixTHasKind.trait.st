"
This is an indicator that a method is a setter, getter, constant, or constructor

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `kind` | `String` | nil | Tag indicating a setter, getter, constant method|

"
Trait {
	#name : 'FamixTHasKind',
	#instVars : [
		'#kind => FMProperty'
	],
	#category : 'Famix-Traits-PrimitiveProperties',
	#package : 'Famix-Traits',
	#tag : 'PrimitiveProperties'
}

{ #category : 'meta' }
FamixTHasKind classSide >> annotation [

	<FMClass: #THasKind super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'visitor' }
FamixTHasKind >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTHasKind: self
]

{ #category : 'accessing' }
FamixTHasKind >> beConstant [

	self kind: #constant
]

{ #category : 'accessing' }
FamixTHasKind >> beConstructor [

	self deprecated:
		'#isConctructor is now a property of FamixTCanBeConstructor.
Please make sure your entity uses this trait and overrides #isConstructor instead.
#isConstructor should compute if the entity is constructor based on language-specific criteria'.

	self kind: #constructor
]

{ #category : 'accessing' }
FamixTHasKind >> beGetter [

	self kind: #getter
]

{ #category : 'accessing' }
FamixTHasKind >> beSetter [

	self kind: #setter
]

{ #category : 'testing' }
FamixTHasKind >> isConstant [

	<FMProperty: #isConstant type: #Boolean>
	<derived>
	<FMComment: 'True if the method simply returns a constant'>
	^ #constant = self kind
]

{ #category : 'testing' }
FamixTHasKind >> isConstructor [

	self deprecated:
		'#isConctructor is now a property of FamixTMethod directly.
Please make sure your Method entity overrides #isConstructor.
It should compute if the method is a constructor based on language-specific criteria'.

	^ #constructor = self kind or: [
		  self cacheAt: #isConstructor ifAbsent: [ false ] ]
]

{ #category : 'testing' }
FamixTHasKind >> isConstructor: aBoolean [

	self deprecated:
		'#isConctructor is now a property of FamixTCanBeConstructor.
Please make sure your entity uses this trait and overrides #isConstructor instead.
#isConstructor should compute if the entity is constructor based on language-specific criteria'.

	aBoolean
		ifTrue: [ self beConstructor ]
		ifFalse: [ self isConstructor ifTrue: [ self kind: nil ] ]
]

{ #category : 'testing' }
FamixTHasKind >> isGetter [

	<FMProperty: #isGetter type: #Boolean>
	<derived>
	<FMComment: 'True if the method is a getter of an attribute'>
	^ #getter = self kind
]

{ #category : 'testing' }
FamixTHasKind >> isPureAccessor [

	^ self isGetter or: [ 
		  self isSetter or: [ 
			  self cacheAt: #isPureAccessor ifAbsent: [ false ] ] ]
]

{ #category : 'testing' }
FamixTHasKind >> isSetter [

	<FMProperty: #isSetter type: #Boolean>
	<derived>
	<FMComment: 'True if the method is a setter on an attribute'>
	^ #setter = self kind
]

{ #category : 'accessing' }
FamixTHasKind >> kind [

	<FMProperty: #kind type: #String>
	<generated>
	<FMComment: 'Tag indicating a setter, getter, constant method'>
	^ kind
]

{ #category : 'accessing' }
FamixTHasKind >> kind: anObject [
	<generated>
	kind := anObject
]
