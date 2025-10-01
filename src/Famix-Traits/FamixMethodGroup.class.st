Class {
	#name : 'FamixMethodGroup',
	#superclass : 'MooseSpecializedGroup',
	#category : 'Famix-Traits-Groups',
	#package : 'Famix-Traits',
	#tag : 'Groups'
}

{ #category : 'meta' }
FamixMethodGroup class >> annotation [

	<FMClass: #MethodGroup super: #MooseSpecializedGroup>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : 'meta' }
FamixMethodGroup class >> metamodel [

	<generated>
	^ FamixModel metamodel
]

{ #category : 'navigation' }
FamixMethodGroup >> allClasses [

	^ FamixTypeGroup withAll: (self entities flatCollectAsSet: [ :m | m containersOfType: FamixTClass ])
]

{ #category : 'navigation' }
FamixMethodGroup >> allMethods [
	^ self
]

{ #category : 'navigation' }
FamixMethodGroup >> allPackages [

	^ FamixPackageGroup withAll: (self entities flatCollectAsSet: [ :m | m containersOfType: FamixTPackage ])
]

{ #category : 'metrics' }
FamixMethodGroup >> averageNumberOfInvocations [

	<FMProperty: #averageNumberOfInvocations type: #Number>
	<FMComment: 'Average number of invocations per methods'>
	<derived>
	^ self cacheAt: #averageNumberOfInvocations ifAbsentPut: [ self average: [ :each | each numberOfOutgoingInvocations ] ]
]

{ #category : 'metrics' }
FamixMethodGroup >> averageNumberOfLinesOfCode [

	<FMProperty: #averageNumberOfLinesOfCode type: #Number>
	<FMComment: 'Average number of lines of code per methods'>
	<derived>
	^ self cacheAt: #averageNumberOfLinesOfCode ifAbsentPut: [ self average: [ :each | each numberOfLinesOfCode ] ]
]

{ #category : 'metrics' }
FamixMethodGroup >> averageNumberOfParameters [

	<FMProperty: #averageNumberOfParameters type: #Number>
	<FMComment: 'Average number of parameters per methods'>
	<derived>
	^ self cacheAt: #averageNumberOfParameters ifAbsentPut: [ self average: [ :each | each numberOfParameters ] ]
]
