Class {
	#name : #FamixMBVisitorConfiguration,
	#superclass : #Object,
	#instVars : [
		'visitorTrait',
		'packageName'
	],
	#category : #'Famix-Visitor'
}

{ #category : #accessing }
FamixMBVisitorConfiguration >> packageName [

	^ packageName
]

{ #category : #accessing }
FamixMBVisitorConfiguration >> packageName: aPackageName [

	packageName := aPackageName
]
