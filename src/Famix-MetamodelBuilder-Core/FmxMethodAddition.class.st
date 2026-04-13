"
## Description

I represent a change that would create a method to a class during a Famix generation

## Examples

```st
	FmxMethodAddition className: FmxMethodAddition isClassSide: false sourceCode: 'x ^ x' protocol: 'accessing'
```
"
Class {
	#name : 'FmxMethodAddition',
	#superclass : 'FmxLazyClassChange',
	#instVars : [
		'protocol',
		'sourceCode'
	],
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'instance creation' }
FmxMethodAddition class >> className: aSymbol isClassSide: aBoolean sourceCode: aString protocol: protocol [

	^ self new
		  className: aSymbol;
		  isClassSide: aBoolean;
		  sourceCode: aString;
		  protocol: protocol;
		  yourself
]

{ #category : 'accessing' }
FmxMethodAddition >> apply [

	self realClass compile: sourceCode classified: protocol
]

{ #category : 'printing' }
FmxMethodAddition >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: '[';
		nextPutAll: (protocol ifNil: [ 'empty' ]);
		nextPutAll: ' - ';
		nextPutAll: (sourceCode ifNil: [ 'empty' ]);
		nextPutAll: ']'
]

{ #category : 'accessing' }
FmxMethodAddition >> protocol [

	^ protocol
]

{ #category : 'accessing' }
FmxMethodAddition >> protocol: anObject [

	protocol := anObject
]

{ #category : 'accessing' }
FmxMethodAddition >> sourceCode [

	^ sourceCode
]

{ #category : 'accessing' }
FmxMethodAddition >> sourceCode: anObject [

	sourceCode := anObject
]
