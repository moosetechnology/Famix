Class {
	#name : 'FamixPackageGroup',
	#superclass : 'MooseSpecializedGroup',
	#category : 'Famix-Traits-Groups',
	#package : 'Famix-Traits',
	#tag : 'Groups'
}

{ #category : 'navigation' }
FamixPackageGroup >> allClasses [
	^ self flatCollect: [ :p | p localClasses ]
]

{ #category : 'navigation' }
FamixPackageGroup >> allMethods [
	^ self flatCollect: [ :p | p methods ]
]

{ #category : 'navigation' }
FamixPackageGroup >> allPackages [
	^ self
]
