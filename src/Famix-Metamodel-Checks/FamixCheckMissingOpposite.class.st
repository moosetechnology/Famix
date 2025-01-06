Class {
	#name : #FamixCheckMissingOpposite,
	#superclass : #Object,
	#instVars : [
		'fmClass',
		'trait',
		'fmRelation'
	],
	#category : #'Famix-Metamodel-Checks'
}

{ #category : #'instance creation' }
FamixCheckMissingOpposite class >> fmClass: aFMClass fmRelation: aFMRelation [

	^self new
		fmClass: aFMClass ;
		fmRelation: aFMRelation ;
		yourself
]

{ #category : #accessing }
FamixCheckMissingOpposite >> errorMessage [

	^String streamContents: [ :stream |
		stream
			<< 'No plausible opposite for relation ' ;			
			<< fmRelation name ;
			<< ' in Famix class' ;
			<< fmClass name ;
			<< ' (coming from ' ;
			<< trait name ;
			<< ')' ;
			cr ;
			<< 'A Famix class of type ' ;
			<< trait name ;
			<< ' is expected'
	]
]

{ #category : #accessing }
FamixCheckMissingOpposite >> fmClass [

	^ fmClass
]

{ #category : #accessing }
FamixCheckMissingOpposite >> fmClass: anObject [

	fmClass := anObject
]

{ #category : #accessing }
FamixCheckMissingOpposite >> fmRelation [

	^ fmRelation
]

{ #category : #accessing }
FamixCheckMissingOpposite >> fmRelation: anObject [

	fmRelation := anObject
]

{ #category : #accessing }
FamixCheckMissingOpposite >> trait [

	^ trait
]

{ #category : #accessing }
FamixCheckMissingOpposite >> trait: anObject [

	trait := anObject
]
