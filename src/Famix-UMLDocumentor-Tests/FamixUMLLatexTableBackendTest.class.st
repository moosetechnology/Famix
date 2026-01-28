Class {
	#name : 'FamixUMLLatexTableBackendTest',
	#superclass : 'FamixUMLAbstractBackendTest',
	#category : 'Famix-UMLDocumentor-Tests-Generation',
	#package : 'Famix-UMLDocumentor-Tests',
	#tag : 'Generation'
}

{ #category : 'accessing' }
FamixUMLLatexTableBackendTest >> allLines [

	^backend instVarNamed: #allLines
]

{ #category : 'accessing' }
FamixUMLLatexTableBackendTest >> allLines: aCollection [

	backend instVarNamed: #allLines put: aCollection
]

{ #category : 'accessing' }
FamixUMLLatexTableBackendTest >> backendClass [ 

	^FamixUMLLatexTableBackend 

]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateClasses [
	| umlModel |
	umlModel := {
		self classNamed: 'Class-A' .
		self classNamed: 'Class-B' .
	}.

	backend generateClasses: umlModel .

	self assert: self allLines size equals: 2.
	self assert: (self allLines anySatisfy: [:line | line name = 'Class-A']).
	self assert: (self allLines anySatisfy: [:line | line name = 'Class-B']).
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateClassesNoProperties [
	| umlModel |
	umlModel := {
		self property: 'prop1' type: 'integer' .
		self property: 'prop2' type: 'whatever'
	}.

	backend generateClasses: umlModel .

	self assert: self allLines size equals: 0
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateClassesNoStub [
	| umlModel |
	umlModel := {
		self classNamed: 'Class-A' .
		(self classNamed: 'Class-B') isStub: true
	}.

	backend generateClasses: umlModel .

	self assert: self allLines size equals: 1.
	self assert: self allLines anyOne name equals: 'Class-A'
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateInheritance [

	self allLines: { FamixUMLLatexLine new name: 'AClass' }.

	backend generateInheritance: (self link: FamixUMLInheritance from: 'AClass' to: 'SuperClass').

	self assert: self allLines size equals: 1.
	self assert: self allLines anyOne superclass equals: 'SuperClass'
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateInheritanceNotFound [

	self allLines: { FamixUMLLatexLine new name: 'AClass' }.

	backend generateInheritance: (self link: FamixUMLInheritance from: 'OtherClass' to: 'SuperClass').

	self assert: self allLines size equals: 1.
	self assert: self allLines anyOne superclass isNil
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateUse [

	self allLines: { FamixUMLLatexLine new name: 'AClass' }.

	backend generateUse: (self link: FamixUMLUse from: 'AClass' to: 'ATrait').

	self assert: self allLines size equals: 1.
	self assert: self allLines anyOne traits size equals: 1.
	self assert: self allLines anyOne traits anyOne equals: 'ATrait'
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateUseMultiple [

	self allLines: { FamixUMLLatexLine new name: 'AClass' }.

	backend generateUse: (self link: FamixUMLUse from: 'AClass' to: 'ATrait-1').
	backend generateUse: (self link: FamixUMLUse from: 'AClass' to: 'ATrait-2').

	self assert: self allLines size equals: 1.
	self assert: self allLines anyOne traits size equals: 2.
	self assert: (self allLines anyOne traits allSatisfy: [:t | t beginsWith: 'ATrait-'])
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testGenerateUseNotFound [

	self allLines: { FamixUMLLatexLine new name: 'AClass' }.

	backend generateUse: (self link: FamixUMLUse from: 'OtherClass' to: 'ATrait').

	self assert: self allLines size equals: 1.
	self assert: self allLines anyOne traits isNil
]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testLineFor [
	| lineA lineB |
	lineA := FamixUMLLatexLine new name: 'Class-A'.
	lineB := FamixUMLLatexLine new name: 'Class-B'.

	self allLines: { lineA . lineB }.

	self assert: (backend lineFor: 'Class-A') equals: lineA.

]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testLineForNotFound [
	| aLine |

	aLine  := backend lineFor: 'AClass'.

	self assert: aLine class equals: FamixUMLLatexLine.
	self assert: aLine name isNil.
	self assert: aLine superclass isNil.
	self assert: aLine traits isNil.

]

{ #category : 'tests' }
FamixUMLLatexTableBackendTest >> testOutputAllLines [
	| lineA lineB |
	lineA := FamixUMLLatexLine new name: 'Class-A'.
	lineB := FamixUMLLatexLine new
		name: 'Class-B' ;
		superclass: 'Class-A'.
	self allLines: { lineA . lineB }.

	backend outputAllLines.

	self
		assert: backend outputStream contents
		equals: 
'\begin{tabular}{llp{5cm}}
\hline
Class & Super-class & Traits used \\
\hline
Class-A &  &  \\
Class-B & Class-A &  \\
\hline
\end{tabular}
'

]
