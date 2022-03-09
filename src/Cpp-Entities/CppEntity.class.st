Class {
	#name : #CppEntity,
	#superclass : #MooseEntity,
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
CppEntity class >> metamodel [

	<generated>
	^ CppModel metamodel
]

{ #category : #testing }
CppEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isCPPSBlock [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
CppEntity >> isType [

	<generated>
	^ false
]
