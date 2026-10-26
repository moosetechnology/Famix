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

	| trait |
	self halt.
	trait := super getTraitNamed: aSymbol.
	^ trait
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
	metamodel additionalProperty: #famixFamelBuilder for: aClass ifAbsentPut: self.
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
	metamodel additionalProperty: #famixFamelBuilder for: aTrait ifAbsentPut: self.
	^ aTrait
]
