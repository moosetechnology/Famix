Class {
	#name : 'FmxMBStubEnvironment',
	#superclass : 'FmxMBRingEnvironment',
	#category : 'Famix-MetamodelBuilder-Tests-Helpers',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Helpers'
}

{ #category : 'instance creation' }
FmxMBStubEnvironment class >> for: aBuilder [

	^ self new 
		builder: aBuilder;
		yourself.
]

{ #category : 'accessing' }
FmxMBStubEnvironment >> apply [

	"do nothing"
]

{ #category : 'accessing' }
FmxMBStubEnvironment >> compile: aSource in: aClass classified: aProtocol package: aPackageName [

	| selector |
	
	selector := aClass compile: aSource classified: aProtocol.
	(aClass methodNamed: selector) package: (aClass environment ensurePackageNamed: aPackageName).
]
