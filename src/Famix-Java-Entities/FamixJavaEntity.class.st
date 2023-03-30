"
file := 'ArgoUML-0-34.mse' asFileReference readStream.

repo := MooseModel importFrom: file withMetamodel: FamixJavaModel metamodel.

model := MooseModel new.
model silentlyAddAll: repo elements.
model entityStorage forRuntime.
model
"
Class {
	#name : #FamixJavaEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixJavaEntity class >> isAbstract [

	<generated>
	^ self == FamixJavaEntity
]

{ #category : #meta }
FamixJavaEntity class >> metamodel [

	<generated>
	^ FamixJavaModel metamodel
]

{ #category : #testing }
FamixJavaEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isEnumValue [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isException [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isInterface [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isLocalVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaEntity >> isType [

	<generated>
	^ false
]
