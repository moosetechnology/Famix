"
## Description

I represent a change that would create add methods to a class during a Famix generation.

## Examples

```st
	FmxMethodAdditions className: FmxMethodAddition isClassSide: false methodsAndProtocols: (Dictionary with: 'accessing' -> { 'y ^y' . 'x ^x'}}
```
 
## Internal Representation and Key Implementation Points

    Instance Variables
	methodsAndProtocols:		<aDicitonary>		A dictionary matching a protocol with source code to generate as methods in the protocol
"
Class {
	#name : 'FmxMethodAdditions',
	#superclass : 'FmxLazyClassChange',
	#instVars : [
		'methodsAndProtocols'
	],
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'instance creation' }
FmxMethodAdditions class >> className: aSymbol isClassSide: aBoolean methodsAndProtocols: aCollection [
	^ self new
		className: aSymbol;
		isClassSide: aBoolean;
		methodsAndProtocols: aCollection;
		yourself
]

{ #category : 'adding' }
FmxMethodAdditions >> addCode: sourceCode protocol: protocol [

	(methodsAndProtocols at: protocol ifAbsentPut: [ OrderedCollection new ]) add: sourceCode
]

{ #category : 'accessing' }
FmxMethodAdditions >> apply [

	| class |
	class := self realClass.
	methodsAndProtocols keysAndValuesDo: [ :protocol :codes | codes do: [ :code | class compile: code classified: protocol ] ]
]

{ #category : 'initialization' }
FmxMethodAdditions >> initialize [
	super initialize.
	methodsAndProtocols := Dictionary new
]

{ #category : 'accessing' }
FmxMethodAdditions >> methodsAndProtocols: aCollection [

	methodsAndProtocols := aCollection
]

{ #category : 'printing' }
FmxMethodAdditions >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: '[';
		print: methodsAndProtocols;
		nextPutAll: ']'
]
