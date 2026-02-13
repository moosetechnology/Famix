"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isInitializationBlock` | `Boolean` | false | If true, the entity is an initialization block. If false, the entity represents the definition of the attributes of a class|

"
Class {
	#name : 'FamixJavaInitializer',
	#superclass : 'FamixJavaMethod',
	#instVars : [
		'#isInitializationBlock => FMProperty defaultValue: false'
	],
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaInitializer class >> annotation [

	<FMClass: #Initializer super: #FamixJavaMethod>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : 'visitor' }
FamixJavaInitializer >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaInitializer: self
]

{ #category : 'trait protocol conflict' }
FamixJavaInitializer >> isConstructor [

	<FMProperty: #isConstructor type: #Boolean>
	<FMComment: 'Is the method a constructor for its class?'>
	<derived>
	^ self name = self parentType name and: [
		  self typing isNil or: [ self declaredType name = 'void' ] ]
]

{ #category : 'accessing' }
FamixJavaInitializer >> isInitializationBlock [

	<FMProperty: #isInitializationBlock type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'If true, the entity is an initialization block.
If false, the entity represents the definition of the attributes of a class'>
	^ isInitializationBlock ifNil: [ isInitializationBlock := false ]
]

{ #category : 'accessing' }
FamixJavaInitializer >> isInitializationBlock: anObject [
	<generated>
	isInitializationBlock := anObject
]

{ #category : 'testing' }
FamixJavaInitializer >> isInitializer [

	^ true
]

{ #category : 'accessing' }
FamixJavaInitializer >> name [

	"<FMProperty: #name type: #String defaultValue: '<Initializer>'>
	<FMComment: 'Basic name of the entity, not full reference.'>"
	^ name ifNil: [ name := '<Initializer>' ]
]

{ #category : 'accessing' }
FamixJavaInitializer >> name: anObject [

	name := anObject
]
