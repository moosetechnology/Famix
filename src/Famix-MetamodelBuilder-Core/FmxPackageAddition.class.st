"
Description
--------------------

I represent a change that would create a package during a Famix generation.

Examples
--------------------

	FmxPackageAddition named: 'Famix-Example-Entities'
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	packageName:		<aString>		Name of the package to create.
"
Class {
	#name : 'FmxPackageAddition',
	#superclass : 'FmxCodeChange',
	#instVars : [
		'packageName'
	],
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'instance creation' }
FmxPackageAddition class >> named: aName [
	^ self new
		packageName: aName;
		yourself
]

{ #category : 'accessing' }
FmxPackageAddition class >> priority [
	"This is what has the less impact of all."

	^ 0
]

{ #category : 'accessing' }
FmxPackageAddition >> apply [

	self packageOrganizer ensurePackage: self packageName
]

{ #category : 'testing' }
FmxPackageAddition >> isRequired [

	^ (self packageOrganizer hasPackage: self packageName) not
]

{ #category : 'accessing' }
FmxPackageAddition >> packageName [ 

	^ packageName
]

{ #category : 'initialization' }
FmxPackageAddition >> packageName: aPackageName [
	packageName := aPackageName
]

{ #category : 'printing' }
FmxPackageAddition >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: (packageName ifNil: [ #unamed ]);
		nextPut: $)
]
