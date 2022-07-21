Class {
	#name : #FamixJavaTraitsChecker,
	#superclass : #Object,
	#category : #'Famix-Java-Generator'
}

{ #category : #'as yet unclassified' }
FamixJavaTraitsChecker >> checkTraitsFor: aClass [

	^ aClass allTraits size = aClass allTraits asSet size
]

{ #category : #'as yet unclassified' }
FamixJavaTraitsChecker >> detectDoubleFor: aClassOrTrait [ 
	^self detectDoubleFor: aClassOrTrait  in: aClassOrTrait allTraits 
]

{ #category : #'as yet unclassified' }
FamixJavaTraitsChecker >> detectDoubleFor: aClassOrTrait in: aCollection [
	^aCollection select: [ :c | (aCollection occurrencesOf: c) >1 ]
]
