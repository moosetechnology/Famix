Class {
	#name : #AbstractFamixNavigationTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-KGB-Tests'
}

{ #category : #accessing }
AbstractFamixNavigationTest class >> resources [
	^ {FamixStNavigationTestResource}
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c10FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee.M2P4C10FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c11FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee.M2P5C11FullRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c12FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee.M2P6C12FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c13FullRefereeInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee.M2P6C13FullRefereeInSideOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c14ReferencerOutSideRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model3ReferencerReferee.M3P7C14ReferencerOutSideRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c15FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model4FullReferencer.M4P8C15FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c16FullReferencerOutSideInSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer.M5P9C16FullReferencerOutSideInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c17FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer.M5P10C17FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c18FullRefereeInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer.M5P10C18FullRefereeInSideOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c19FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee.M6P11C19FullRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c1FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P1C1FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c20FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee.M6P12C20FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c21FullReferencerOutSide [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted.M7P13C21FullReferencerOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c22FullRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted.M7P14C22FullRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c2ReferencerOutSideRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P2C2ReferencerOutSideRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c3ReferencerInSideRefereeOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P2C3ReferencerInSideRefereeOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c4FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P2C4FullRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c5ReferencerInSideRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P3C5ReferencerInSideRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c6FullReferencerInSideOutSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P3C6FullReferencerInSideOutSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c7FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P3C7FullRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c8FullReferencerInSide [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P3C8FullReferencerInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> c9FullRefereeInSide [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee.M2P4C9FullRefereeInSide'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> cObject [ 
	 
	^self model entityNamed: #'Smalltalk.Object'
]

{ #category : #'helpers - utilites' }
AbstractFamixNavigationTest >> getMethod: methodNameString [
	| results |
	results := self model allMethods select: [ :method | method mooseName endsWith: methodNameString ].
	results size = 1 ifFalse: [ self error: 'Not one method named ' , methodNameString ].
	^ results anyOne
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> m1p2c2Mtd1 [  
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P2C2ReferencerOutSideRefereeInSide.m1p2c2Mtd1()'
]

{ #category : #'helpers - classes' }
AbstractFamixNavigationTest >> m1p2c2Mtd2 [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee.M1P2C2ReferencerOutSideRefereeInSide.m1p2c2Mtd2()'
]

{ #category : #'helpers - utilites' }
AbstractFamixNavigationTest >> model [ 
	 
	^FamixStNavigationTestResource current model
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> n1InteractedReferencerReferee [ 
	 
	^self model entityNamed: 
			#'Model1InteractedReferencerReferee'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> n2FullReferee [ 
	 
	^self model entityNamed: 
			#'Model2FullReferee'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> n3ReferencerReferee [
	 
	^self model entityNamed: 
			#'Model3ReferencerReferee'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> n4FullReferencer [ 
	 
	^self model entityNamed: 
			#'Model4FullReferencer'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> n5InteractedReferencer [ 
	 
	^self model entityNamed: 
			#'Model5InteractedReferencer'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> n6InteractedReferee [ 
	 
	^self model entityNamed: 
			#'Model6InteractedReferee'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> n7FullInteracted [ 
	 
	^self model entityNamed: 
			#'Model7FullInteracted'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> nSmalltalkCore [ 
	 
	^self model entityNamed: #'Smalltalk'
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p10InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P10InteractedReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p11FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P11FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p12FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P12FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p13FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P13FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p14FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P14FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p1FullReferencer [ 
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P1FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p2InteractedReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P2InteractedReferencerReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p3InteractedReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P3InteractedReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p4FullInteracted [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P4FullInteracted'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p5FullReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P5FullReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p6InteractedReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P6InteractedReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p7ReferencerReferee [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P7ReferencerReferee'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p8FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P8FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> p9FullReferencer [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-P9FullReferencer'. 
]

{ #category : #'helpers - packages' }
AbstractFamixNavigationTest >> pExtensions [
	 
	^self model entityNamed: #'Moose-TestResources-KGB-PExtensions'. 
]
