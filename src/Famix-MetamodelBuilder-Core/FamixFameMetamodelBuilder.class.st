"
This metamodel builder build a `FMMetaModel` instead of a inner representation used to create the classes.
One should then use a `FMMaterializer` to create the classes.

I am a demo for now. API is unstable, maybe use

```st
generator := FamixTest3Generator new.
generator builder: (FamixFameMetamodelBuilder forGenerator: generator).
generator adoptBuilder: generator builder.
generator generate
```
"
Class {
	#name : 'FamixFameMetamodelBuilder',
	#superclass : 'FamixMetamodelBuilder',
	#instVars : [
		'metamodel'
	],
	#category : 'Famix-MetamodelBuilder-Core-Basic',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Basic'
}

{ #category : 'private' }
FamixFameMetamodelBuilder >> ensurePackageNamed: aString [

	^ metamodel
		  packageNamed: aString
		  ifAbsentPut: [ FM3Package named: aString ]
]

{ #category : 'initialization' }
FamixFameMetamodelBuilder >> getTraitNamed: aSymbol [
	"Check if I contain a trait of this name. If yes, return it. 
	If no, check if one of my subMM has a trait of this name. If one is found, return it. If more is found raise an error. If non is found, create a new trait of this name and return it."

	| remoteTraits |
	remoteTraits := Dictionary new.
	self allSubBuilders do: [ :builder |
		builder traits
			detect: [ :each | each name = aSymbol ]
			ifFound: [ :trait | remoteTraits at: builder put: trait ] ].
	remoteTraits size = 1 ifTrue: [
		| trait |
		trait := remoteTraits values anyOne.
		metamodel additionalProperty: #famixFameRemoteBuilder for: trait ifAbsentPut: self.
		^ trait ].
	remoteTraits size > 1 ifTrue: [
		self error: ('Multiple remote traits named {1} where found in sub metamodels. Found in: {2}.
In order to fix the issue you should use #remoteTrait:withPrefix: in your generator to select yourself the right trait to use. If you want to create an entity of this name in your model and not use the trait of this name from a sub metamodel, declare this trait before referencing it.'
				 format: {
						 aSymbol.
						 (', ' join: (remoteTraits keys collect: [ :builder | builder generator asString ])) }) ].

	^ self traitNamed: aSymbol
]

{ #category : 'initialization' }
FamixFameMetamodelBuilder >> initialize [

	super initialize.
	metamodel := FMMetaModel new
]

{ #category : 'initialization' }
FamixFameMetamodelBuilder >> newClass [

	| aClass |
	aClass := FM3Class new.
	aClass package: (self ensurePackageNamed: self configuration packageName).
	self classes add: aClass.
	metamodel add: aClass.
	metamodel additionalProperty: #famixFameBuilder for: aClass ifAbsentPut: self.
	^ aClass
]

{ #category : 'initialization' }
FamixFameMetamodelBuilder >> newClassGroup [

	self error: 'new implementation here'
]

{ #category : 'initialization' }
FamixFameMetamodelBuilder >> newTrait [

	| aTrait |
	aTrait := FM3Trait new.
	aTrait package:
		(self ensurePackageNamed: self configuration packageName).
	self traits add: aTrait.
	metamodel add: aTrait.
	metamodel additionalProperty: #famixFameBuilder for: aTrait ifAbsentPut: self.
	^ aTrait
]
