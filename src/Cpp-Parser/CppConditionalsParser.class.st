"
TODO
"
Class {
	#name : #CppConditionalsParser,
	#superclass : #CppConditionalsGrammar,
	#instVars : [
		'method',
		'parsedString',
		'sourceAnchor'
	],
	#category : #'Cpp-Parser-Block'
}

{ #category : #accessing }
CppConditionalsParser >> block [
	^ super block info
		==> [ :info | 
			CppBlock new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				innerBlocks: info element second;
				yourself ]
]

{ #category : #accessing }
CppConditionalsParser >> blockContent [
	^ super blockContent ==> [ :p | (p collect: #second thenSelect: #notNil) flatCollect: #value ]
]

{ #category : #accessing }
CppConditionalsParser >> case [
	^ super case info
		==> [ :info | 
			CppBlock new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				yourself ]
]

{ #category : #accessing }
CppConditionalsParser >> comment [
	^ super comment ==> [ :p | nil ]
]

{ #category : #accessing }
CppConditionalsParser >> condition [
	^ super condition info
		==> [ :info | 
			CppCondition new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				yourself ]
]

{ #category : #helpers }
CppConditionalsParser >> createAnchorFromInfo: info [
	^ CppRelativeSourceAnchor new
		startPos: info start;
		endPos: info stop;
		relatedAnchor: self sourceAnchor;
		initializeStartAndEndLineFrom: parsedString; "We do it here to not have to parse again the file."
		yourself
]

{ #category : #accessing }
CppConditionalsParser >> doWhile [
	^ super doWhile info
		==> [ :info | 
			{(CppWhile new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				innerBlocks: (self selectBlocksfrom: info element);
				yourself)} ]
]

{ #category : #accessing }
CppConditionalsParser >> for [
	^ super for info
		==> [ :info | 
			{(CppFor new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				innerBlocks: (self selectBlocksfrom: info element);
				yourself)} ]
]

{ #category : #accessing }
CppConditionalsParser >> ifElse [
	^ super ifElse info
		==> [ :info | 
			{(CppIf new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				innerBlocks: (self selectBlocksfrom: info element deepFlatten);
				yourself)} ]
]

{ #category : #accessing }
CppConditionalsParser >> method [
	^ method
]

{ #category : #accessing }
CppConditionalsParser >> method: anObject [
	method := anObject
]

{ #category : #accessing }
CppConditionalsParser >> oneLineStatement [
	^ super oneLineStatement ==> [ :info | nil ]
]

{ #category : #parsing }
CppConditionalsParser >> parse [
	^ self parse: self sourceAnchor sourceText
]

{ #category : #parsing }
CppConditionalsParser >> parse: aString [
	('Parsing blocks of ' , self method mooseName asString) record.
	parsedString := aString.
	^ super parse: aString
]

{ #category : #accessing }
CppConditionalsParser >> parsedString [
	^ parsedString
]

{ #category : #querying }
CppConditionalsParser >> productionNames [
	^ super productionNames \ {#method}
]

{ #category : #helpers }
CppConditionalsParser >> selectBlocksfrom: collection [
	^ collection select: #isCPPSBlock
]

{ #category : #accessing }
CppConditionalsParser >> sourceAnchor [
	^ sourceAnchor
]

{ #category : #accessing }
CppConditionalsParser >> sourceAnchor: anObject [
	sourceAnchor := anObject
]

{ #category : #accessing }
CppConditionalsParser >> start [
	^ super start ==> [ :p | (p select: #isNotNil) flatCollect: #value ]
]

{ #category : #accessing }
CppConditionalsParser >> statement [
	^ super statement info
		==> [ :info | 
			CppBlock new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				yourself ]
]

{ #category : #accessing }
CppConditionalsParser >> string [
	^ super string ==> [ :p | nil ]
]

{ #category : #accessing }
CppConditionalsParser >> switchCases [
	^ super switchCases info
		==> [ :info | 
			{(CppSwitch new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				innerBlocks: (self selectBlocksfrom: info element deepFlatten);
				yourself)} ]
]

{ #category : #accessing }
CppConditionalsParser >> water [
	^ super water ==> [ :p | nil ]
]

{ #category : #accessing }
CppConditionalsParser >> while [
	^ super while info
		==> [ :info | 
			{(CppWhile new
				parentBehavioural: self method;
				sourceAnchor: (self createAnchorFromInfo: info);
				innerBlocks: (self selectBlocksfrom: info element);
				yourself)} ]
]
