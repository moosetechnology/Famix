"
TODO
"
Class {
	#name : #CppConditionalsGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'while',
		'block',
		'blockClosing',
		'blockContent',
		'blockOpening',
		'blockOrStatement',
		'case',
		'caseDeclaration',
		'cases',
		'comment',
		'condition',
		'conditionClosing',
		'conditionContent',
		'conditionOpening',
		'controlStructure',
		'doWhile',
		'else',
		'elseIf',
		'for',
		'ifElse',
		'oneLineStatement',
		'statement',
		'statementEnding',
		'string',
		'switchCases',
		'water'
	],
	#category : #'Cpp-Parser-Block'
}

{ #category : #accessing }
CppConditionalsGrammar >> block [
	^ blockOpening, blockContent, blockClosing
]

{ #category : #accessing }
CppConditionalsGrammar >> blockClosing [
	^ $} asParser
]

{ #category : #accessing }
CppConditionalsGrammar >> blockContent [
	^ (blockClosing not , (comment / string / controlStructure / water)) plus
]

{ #category : #accessing }
CppConditionalsGrammar >> blockOpening [
	^ ${ asParser
]

{ #category : #accessing }
CppConditionalsGrammar >> blockOrStatement [ 
	^ block / statement
]

{ #category : #accessing }
CppConditionalsGrammar >> case [
	^ caseDeclaration , ((block negate , caseDeclaration not, blockClosing not) plus , block) star , (caseDeclaration / blockClosing) negate plus 
]

{ #category : #accessing }
CppConditionalsGrammar >> caseDeclaration [
	^ ('case ' asParser , $: asParser negate plus) / 'default' asParser , $: asParser
]

{ #category : #switchs }
CppConditionalsGrammar >> cases [
	^ case plus
]

{ #category : #accessing }
CppConditionalsGrammar >> comment [
	^ '//' asParser, #newline asParser negate star
]

{ #category : #accessing }
CppConditionalsGrammar >> condition [
	^ conditionOpening, conditionContent, conditionClosing
]

{ #category : #accessing }
CppConditionalsGrammar >> conditionClosing [
	^ $) asParser
]

{ #category : #accessing }
CppConditionalsGrammar >> conditionContent [
	^ (conditionClosing not , (comment / string / condition / water)) star
]

{ #category : #accessing }
CppConditionalsGrammar >> conditionOpening [
	^ $( asParser
]

{ #category : #accessing }
CppConditionalsGrammar >> controlStructure [
	^ (for / while / ifElse / doWhile / switchCases) memoized
]

{ #category : #loops }
CppConditionalsGrammar >> doWhile [
	^ 'do' asParser trim, block, 'while' asParser trim, condition
]

{ #category : #ifs }
CppConditionalsGrammar >> else [
	^ 'else' asParser trim , blockOrStatement
]

{ #category : #ifs }
CppConditionalsGrammar >> elseIf [
	^ ('else if' asParser trim , condition trim , blockOrStatement)
]

{ #category : #loops }
CppConditionalsGrammar >> for [
	^ 'for' asParser, condition trim, blockOrStatement
]

{ #category : #ifs }
CppConditionalsGrammar >> ifElse [
	^ 'if' asParser , condition trim , blockOrStatement , elseIf star , else optional
]

{ #category : #accessing }
CppConditionalsGrammar >> oneLineStatement [
	^ (statementEnding negate plus, statementEnding)
]

{ #category : #accessing }
CppConditionalsGrammar >> start [
	^ ((controlStructure / comment / water) plus preProcessor: comment ==> [ :p | '' ])
		preProcessor: (#newline asParser , $# asParser , #newline asParser negate plus) ==> [ :p | '' ]
]

{ #category : #accessing }
CppConditionalsGrammar >> statement [
	^ controlStructure / oneLineStatement
]

{ #category : #accessing }
CppConditionalsGrammar >> statementEnding [
	^ $; asParser
]

{ #category : #accessing }
CppConditionalsGrammar >> string [
	^ $" asParser, ('\"' asParser / ($" asParser negate)) plus, $" asParser
]

{ #category : #switchs }
CppConditionalsGrammar >> switchCases [
	^ 'switch' asParser trim, condition, blockOpening trim, cases , blockClosing trim
]

{ #category : #accessing }
CppConditionalsGrammar >> water [
	^ #any asParser
]

{ #category : #loops }
CppConditionalsGrammar >> while [
	^ 'while' asParser, condition trim, blockOrStatement 
]
