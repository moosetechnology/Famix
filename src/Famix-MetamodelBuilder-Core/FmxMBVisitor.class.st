"
I am a visitor for instances of #FamixMetamodelGenerator and subclasses.

I offer methods to which will be called by visited class that accept me.

My methods are empty to serve as base implementation if you want to only override specific methods.
My methods do NOT take care of accepting me on their childrens. See #FmxMBVisitorWalker if you want that property.


A minimum builder needs to subclass FamixMetamodelGenerator, and override the class side method #package
use the #FmxMBPrintVisitor class for a working example.

general case:

```st
b := aFamixMetamodelGeneratorClass builderWithDefinitions.
v := aFmxMBVisitorClass new.
b acceptVisitor: v
```

```st
aFmxMBVisitorClass visit: (aFamixMetamodelGeneratorClass builderWithDefinitions)
```
"
Class {
	#name : 'FmxMBVisitor',
	#superclass : 'Object',
	#category : 'Famix-MetamodelBuilder-Core-Visitors',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Visitors'
}

{ #category : 'visiting' }
FmxMBVisitor class >> visit: aFmxEntity [

	| visitor |
	visitor := self new.
	aFmxEntity acceptVisitor: visitor.
	^ visitor
]

{ #category : 'visiting' }
FmxMBVisitor >> visitBehavioral: aBehavioral [

	
]

{ #category : 'visiting' }
FmxMBVisitor >> visitBuilder: aBuilder [

	
]

{ #category : 'visiting' }
FmxMBVisitor >> visitClass: aClass [

	self visitBehavioral: aClass
]

{ #category : 'visiting' }
FmxMBVisitor >> visitClassEntity: aClass [

	^ self visitClass: aClass
]

{ #category : 'visiting' }
FmxMBVisitor >> visitClassGroup: aClass [

	^ self visitClass: aClass
]

{ #category : 'visiting' }
FmxMBVisitor >> visitEntityCreator: aTrait [

	self visitTrait: aTrait
]

{ #category : 'visiting' }
FmxMBVisitor >> visitImportingContext: aClass [

	^ self visitClass: aClass
]

{ #category : 'visiting' }
FmxMBVisitor >> visitModel: aClass [

	^ self visitClass: aClass
]

{ #category : 'visiting' }
FmxMBVisitor >> visitProperty: aRelation [

	
]

{ #category : 'visiting' }
FmxMBVisitor >> visitRelation: aRelation [

	self visitProperty: aRelation
]

{ #category : 'visiting' }
FmxMBVisitor >> visitTrait: aTrait [

	self visitBehavioral: aTrait
]

{ #category : 'visiting' }
FmxMBVisitor >> visitTraitEntity: aTrait [

	self visitTrait: aTrait
]

{ #category : 'visiting' }
FmxMBVisitor >> visitTypedProperty: aTypedProperty [

	self visitProperty: aTypedProperty
]
