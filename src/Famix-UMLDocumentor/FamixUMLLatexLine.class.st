Class {
	#name : 'FamixUMLLatexLine',
	#superclass : 'Object',
	#instVars : [
		'name',
		'superclass',
		'traits'
	],
	#category : 'Famix-UMLDocumentor-Backend',
	#package : 'Famix-UMLDocumentor',
	#tag : 'Backend'
}

{ #category : 'accessing' }
FamixUMLLatexLine >> name [

	^ name
]

{ #category : 'accessing' }
FamixUMLLatexLine >> name: anObject [

	name := anObject
]

{ #category : 'printing' }
FamixUMLLatexLine >> printTo: aStream [

	aStream
		<< name ;
		<< ' & '.
	superclass ifNotNil: [ aStream << superclass ].
	aStream << ' & '.
	traits ifNotNil: [
		traits
			do: [ :trait | aStream << trait ]
			separatedBy: [ aStream << ', ' ]
	].
	aStream
		<< ' \\' ;
		cr
]

{ #category : 'accessing' }
FamixUMLLatexLine >> superclass [

	^ superclass
]

{ #category : 'accessing' }
FamixUMLLatexLine >> superclass: anObject [

	superclass := anObject
]

{ #category : 'accessing' }
FamixUMLLatexLine >> traits [

	^ traits
]

{ #category : 'accessing' }
FamixUMLLatexLine >> traits: anObject [

	traits := anObject
]
