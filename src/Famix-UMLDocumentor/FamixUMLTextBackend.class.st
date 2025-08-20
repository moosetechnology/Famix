"
I output the model in a text form

I can outpout in a stream or in a file
"
Class {
	#name : #FamixUMLTextBackend,
	#superclass : #FamixUMLAbstractBackend,
	#instVars : [
		'outputStream'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #api }
FamixUMLTextBackend >> export: entities [

	self generateHeader.

	super export: entities.

	self generateFooter.
	
	^[outputStream close ; contents]
	on: MessageNotUnderstood
	do: [ "for ZnCharacterWriteStream do3s not answer to #contents :-("
		''
	]
]

{ #category : #generating }
FamixUMLTextBackend >> generateAssociation: association [
1halt.
	outputStream 
		<< association asString
]

{ #category : #generating }
FamixUMLTextBackend >> generateClass: aClass [

	self generateClassHeader: aClass.
	super generateClass: aClass.
	self generateClassFooter: aClass.
]

{ #category : #generating }
FamixUMLTextBackend >> generateClass: aClass property: property [

	outputStream
		<< '  ' ;
		<< property type ;
		<< ' : ' ;
		<< property name ;
		cr
]

{ #category : #generating }
FamixUMLTextBackend >> generateClassFooter: aUMLClass [

	outputStream
		cr.
]

{ #category : #generating }
FamixUMLTextBackend >> generateClassHeader: aClass [

	outputStream
		<< 'aUMLClass: ' ;
		<< aClass name
]

{ #category : #generating }
FamixUMLTextBackend >> generateFooter [

]

{ #category : #generating }
FamixUMLTextBackend >> generateHeader [

]

{ #category : #generating }
FamixUMLTextBackend >> generateInheritance: inheritance [

	outputStream
		<< inheritance source ;
		<< ' subclass-of: ' ;
		<< inheritance target ;
		cr
]

{ #category : #generating }
FamixUMLTextBackend >> generateUse: aUseLink [

	outputStream
		<< aUseLink source ;
		<< ' uses-trait: ' ;
		<< aUseLink target ;
		cr
]

{ #category : #initialization }
FamixUMLTextBackend >> initialize [

	super initialize.

	self outputStream: (WriteStream with: String new).
]

{ #category : #accessing }
FamixUMLTextBackend >> outputStream [

	^ outputStream
]

{ #category : #accessing }
FamixUMLTextBackend >> outputStream: anObject [

	outputStream := anObject
]

{ #category : #api }
FamixUMLTextBackend >> toFile: filename [

	outputStream := filename asFileReference writeStream
]
