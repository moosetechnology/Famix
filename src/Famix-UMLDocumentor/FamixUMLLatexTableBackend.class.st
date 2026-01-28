Class {
	#name : 'FamixUMLLatexTableBackend',
	#superclass : 'FamixUMLTextBackend',
	#instVars : [
		'allLines'
	],
	#category : 'Famix-UMLDocumentor-Backend',
	#package : 'Famix-UMLDocumentor',
	#tag : 'Backend'
}

{ #category : 'api' }
FamixUMLLatexTableBackend >> export: entities [

	self generateClasses: entities.
	self generateInheritances: entities.
	self generateUses: entities.
	
	self outputAllLines.

	^[outputStream close ; contents]
	on: MessageNotUnderstood
	do: [ "for ZnCharacterWriteStream which does not answer to #contents :-("
		''
	]
]

{ #category : 'generating' }
FamixUMLLatexTableBackend >> generateClasses: entities [

	allLines := entities
		select: [ :each | (each class = FamixUMLClass) and: [ each isStub not ] ]
		thenCollect: [ :each |
			FamixUMLLatexLine new
				name: each name
		]
]

{ #category : 'generating' }
FamixUMLLatexTableBackend >> generateFooter [

	outputStream
		<< '\hline' ;
		cr ;
		<< '\end{tabular}' ;
		cr
]

{ #category : 'generating' }
FamixUMLLatexTableBackend >> generateHeader [

	outputStream
		<< '\begin{tabular}{llp{5cm}}' ;
		cr ;
		<< '\hline' ;
		cr ;
		<< 'Class & Super-class & Traits used \\' ;
		cr ;
		<< '\hline' ;
		cr
]

{ #category : 'generating' }
FamixUMLLatexTableBackend >> generateInheritance: inheritance [

	(self lineFor: inheritance source)
		superclass: inheritance target
]

{ #category : 'generating' }
FamixUMLLatexTableBackend >> generateUse: aUseLink [

	| line |
	line := self lineFor: aUseLink source.
	line traits
		ifNil: [ line traits: (OrderedCollection with: aUseLink target) ]
		ifNotNil: [ :traits | traits add: aUseLink target ]
]

{ #category : 'as yet unclassified' }
FamixUMLLatexTableBackend >> lineFor: aName [
	"If the line is not found, we create a new empty one that may serve as a Null Object pattern"

	^allLines
		detect: [ :each | each name = aName ]
		ifNone: [ FamixUMLLatexLine new ]
]

{ #category : 'api' }
FamixUMLLatexTableBackend >> outputAllLines [

	self generateHeader.

	(allLines sort: [ :a :b | a name < b name ])
		do: [ :line | line printTo: outputStream ].

	self generateFooter.

]
