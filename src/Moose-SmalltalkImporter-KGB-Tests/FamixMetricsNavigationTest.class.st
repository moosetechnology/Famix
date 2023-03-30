Class {
	#name : #FamixMetricsNavigationTest,
	#superclass : #AbstractFamixNavigationTest,
	#category : #'Moose-SmalltalkImporter-KGB-Tests'
}

{ #category : #tests }
FamixMetricsNavigationTest >> testNumberOfClasses [
	self assert: self p6InteractedReferee numberOfClasses equals: 2.
	self assert: self p3InteractedReferencer numberOfClasses equals: 4.
	self assert: self pExtensions numberOfClasses equals: 0
]

{ #category : #tests }
FamixMetricsNavigationTest >> testNumberOfClientPackages [
	self assert: self p6InteractedReferee numberOfClientPackages equals: 3.
	self assert: self p11FullReferee numberOfClientPackages equals: 4.
	self assert: self p1FullReferencer numberOfClientPackages equals: 0
]

{ #category : #tests }
FamixMetricsNavigationTest >> testRelativeImportanceForSystem [
	self assert: self p6InteractedReferee relativeImportanceForSystem equals: 3 / 14.
	self assert: self p11FullReferee relativeImportanceForSystem equals: 4 / 14.
	self assert: self p1FullReferencer relativeImportanceForSystem equals: 0
]
