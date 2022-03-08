"
TODO
"
Class {
	#name : #CppCSVParser,
	#superclass : #CppCSVGrammar,
	#instVars : [
		'model',
		'filesLocationsMap',
		'postParsingActions',
		'entitiesMap'
	],
	#category : #'Cpp-Parser'
}

{ #category : #utilities }
CppCSVParser >> addPostParsingAction: aBlock [
	postParsingActions add: aBlock
]

{ #category : #accessing }
CppCSVParser >> classe [
	^ super classe
		==> [ :parsed | 
			| newClass block |
			newClass := self entitiesMap at: parsed third ifAbsentPut: [ CppType named: parsed second model: self model ].
			newClass
				sourceAnchor:
					(self
						createSourceAnchorForFileId: parsed fifth
						line: parsed sixth
						column: parsed seventh
						lineEnd: nil);
				parentPackage: (self obtainClassPackageFromParsed: parsed at: 11);
				isAbstract: parsed eighth asNumber = 1.
			self
				place: parsed
				position: 14
				in: newClass
				with: #numberOfLinesOfCode:.
			block := [ newClass typeContainer: (self entitiesMap at: parsed fourth) ].
			[ block value ]
				on: KeyNotFound
				do: [ self addPostParsingAction: block ].
			self entitiesMap at: parsed first put: newClass ]
]

{ #category : #utilities }
CppCSVParser >> clearTypeName: aTypeName [
	| following |
	"First we clean the special characters"
	following := $* asPParser / $& asPParser / ($[ asPParser , $] asPParser negate star , $] asPParser).
	^ ('const' asPParser optional , following negate plus flatten , following star) ==> [ :p | p second trim ] parse: aTypeName
]

{ #category : #accessing }
CppCSVParser >> createPackageAt: key [
	^ self entitiesMap at: key put: (CppPackage named: key model: self model)
]

{ #category : #sourceAnchor }
CppCSVParser >> createSourceAnchorForFileId: aFileId line: aLine column: aColumn lineEnd: aLineEnd [
	^ aFileId
		ifEmpty: [ nil ]
		ifNotEmpty: [ CppFileAnchor new
				fileName: (filesLocationsMap at: aFileId);
				startLine:
					([ aLine asNumber ]
						on: Error
						do: [ nil ]);
				startColumn:
					([ aColumn asNumber ]
						on: Error
						do: [ nil ]);
				endLine:
					([ aLineEnd asNumber ]
						on: Error
						do: [ nil ]);
				mooseModel: self model;
				yourself ]
]

{ #category : #accessing }
CppCSVParser >> csvLine [
	^ super csvLine ==> [ :p | p second ]
]

{ #category : #utilities }
CppCSVParser >> doReportedOperations [
	^ postParsingActions do: [ :aBlock | aBlock value ]
]

{ #category : #accessing }
CppCSVParser >> edge [
	^ super edge
		==> [ :parsed | 
			| from to |
			from := self entitiesMap at: parsed second first.
			to := self entitiesMap at: parsed second second.
			parsed third isString
				ifFalse: [ 
					|computedValue|
					computedValue := (parsed third value: from value: to).
					computedValue ifNotNil: [  
						computedValue mooseModel: self model;
						sourceAnchor:
								(self
										createSourceAnchorForFileId: parsed second third
										line: parsed second fourth
										column: parsed second fifth
										"Here we consider the end line the same than the start line because we do not have the information"
										lineEnd: parsed second fourth);
						yourself ]  ] ]
]

{ #category : #accessing }
CppCSVParser >> edgeBaseClass [
	^ super edgeBaseClass
		==>
			(self
				edgeBlock: [ :from :to | 
					CppInheritance new
						subclass: from;
						superclass: to;
						yourself ])
]

{ #category : #utilities }
CppCSVParser >> edgeBlock: aBlock [
	"Method that create an evaluation block for parsers from a provided block that just have to create the right entity with the provided from and to (avoid to find entities, define model and create anchor)"

	^ [ :parsed | aBlock ]
]

{ #category : #accessing }
CppCSVParser >> edgeCall [
	^ super edgeCall ==> (self edgeBlock: [ :from :to | CppInvocation source: from target: {to} ])
]

{ #category : #accessing }
CppCSVParser >> edgeMemberObject [
	"memberObject is an inferred dependency from a class declaring an instance variable to the type of instance variable. we can compute it directly from the information available in the model, hence we ignore it"
	self flag: 'for the moment we ignore memberObject edge until we find a more elegant solution to hand it.'.
	^ super edgeMemberObject ==> (self edgeBlock: [:from :to |  ])
]

{ #category : #accessing }
CppCSVParser >> edgeVarRead [
	^ super edgeVarRead
		==>
			(self
				edgeBlock: [ :from :to | 
					CppAccess new
						accessor: from;
						variable: to;
						isWrite: false;
						yourself ])
]

{ #category : #accessing }
CppCSVParser >> edgeVarWrite [
	^ super edgeVarWrite
		==>
			(self
				edgeBlock: [ :from :to | 
					CppAccess new
						accessor: from;
						variable: to;
						isWrite: true;
						yourself ])
]

{ #category : #accessing }
CppCSVParser >> edgeVirtCall [
	^ super edgeVirtCall
		==>
			(self
				edgeBlock: [ :from :to | 
					(CppInvocation source: from target: {to})
						propertyNamed: #virtual put: true;
						yourself ])
]

{ #category : #accessing }
CppCSVParser >> entitiesMap [
	^ entitiesMap
]

{ #category : #accessing }
CppCSVParser >> enum [
	^ super enum
		==> [ :parsed | 
			| newClass block |
			newClass := self entitiesMap at: parsed third ifAbsentPut: [ CppType named: (parsed second allButFirst: 5) model: self model ].
			newClass
				sourceAnchor:
					(self
						createSourceAnchorForFileId: parsed fifth
						line: parsed sixth
						column: parsed seventh
						lineEnd: nil).
			newClass parentPackage: (self obtainClassPackageFromParsed: parsed at: 8).
			"we have a case where a type contains itself and hence it container and the contained are the same
			the following check avoid getting into this situation"
			block := [ newClass = (self entitiesMap at: parsed fourth) ifFalse: [ newClass typeContainer: (self entitiesMap at: parsed fourth) ] ].
			[ block value ]
				on: KeyNotFound
				do: [ self addPostParsingAction: block ].
			self entitiesMap at: parsed first put: newClass ]
]

{ #category : #accessing }
CppCSVParser >> fileLocation [
	^ super fileLocation ==> [ :parsed | self savePath: parsed second forId: parsed first ]
]

{ #category : #accessing }
CppCSVParser >> function [
	^ super function
		==> [ :parsed | 
			| behavioural parent |
			parent := self entitiesMap at: parsed fourth.
			self multipleFileAnchorFor: parent withChildrenSourceID: parsed fifth.
			behavioural := (parent isType ifTrue: [ CppMethod new parentType: parent ] ifFalse: [ CppFunction new functionOwner: parent ])
				name: (parsed second copyUpTo: $();
				signature: parsed second;
				declaredType: (self entitiesMap at: parsed third);
				mooseModel: self model;
				sourceAnchor:
					(self
						createSourceAnchorForFileId: parsed fifth
						line: parsed sixth
						column: parsed seventh
						lineEnd: parsed eighth);
				yourself.
			self
				place: parsed
				position: 10
				in: behavioural
				with: #cyclomaticComplexity:.
			self
				place: parsed
				position: 12
				in: behavioural
				with: #numberOfLinesOfCode:.
			self entitiesMap at: parsed first put: behavioural.
			(parsed second beginsWith: '(static ')
				ifTrue: [ behavioural isStub: true.
					self flag: #TODO	"Ask Gaelle to correct the parser problem" ] ]
]

{ #category : #initialization }
CppCSVParser >> initialize [
	super initialize.
	filesLocationsMap := Dictionary new.
	entitiesMap := Dictionary new.
	postParsingActions := OrderedCollection new
]

{ #category : #accessing }
CppCSVParser >> model [
	^ model
]

{ #category : #accessing }
CppCSVParser >> model: anObject [
	model := anObject
]

{ #category : #sourceAnchor }
CppCSVParser >> multipleFileAnchorFor: parent withChildrenSourceID: fileId [
	"Do nothing if the fileId is an empty string"

	fileId ifNotEmpty: [ parent sourceAnchor ifNotNil: [ :sa | parent sourceAnchor: (sa addFileAnchorWithPath: (filesLocationsMap at: fileId)) ] ]
]

{ #category : #accessing }
CppCSVParser >> namespace [
	^ super namespace
		==> [ :parsed | 
			self entitiesMap
				at: parsed first
				put:
					((CppNamespace named: parsed second model: self model)
						parentScope: (self entitiesMap at: parsed third ifAbsent: [ nil ]);
						sourceAnchor:
							(self
								createSourceAnchorForFileId: parsed fourth
								line: parsed fifth
								column: parsed sixth
								lineEnd: nil);
						yourself) ]
]

{ #category : #accessing }
CppCSVParser >> obtainClassPackageFromParsed: parsed at: pos [
	^ self entitiesMap at: (parsed at: pos) ifAbsent: []
]

{ #category : #accessing }
CppCSVParser >> package [
	^ super package
		==> [ :parsed | 
			| package parent |
			parsed third
				ifNotEmpty: [ parent := self entitiesMap at: parsed third ifAbsent: [ self createPackageAt: parsed third ] ].
			package := self entitiesMap at: parsed first ifAbsent: [ self createPackageAt: parsed first ].
			package name: (parsed second ifEmpty: [ parsed first ]).
			parent
				ifNotNil: [ 
					parent == package
						ifFalse: [ 
							self assert: parent isPackage.
							package parentPackage: parent ] ] ]
]

{ #category : #accessing }
CppCSVParser >> place: parsed position: aPosition in: entity with: aSelector [
	[ entity perform: aSelector with: ((parsed at: aPosition) asInteger ifNil: [ SubscriptOutOfBounds signal ]) ]
		on: SubscriptOutOfBounds
		do: [  ]
]

{ #category : #querying }
CppCSVParser >> productionNames [
	| dico |
	dico := super productionNames.
	#(#entitiesMap #filesLocationsMap #model #postParsingActions) do: [ :aValue | dico removeKey: (dico keyAtValue: aValue) ].
	^ dico
]

{ #category : #utilities }
CppCSVParser >> savePath: aPath forId: anId [
	"When we receive a path, we need to make it relatif to the root we have."

	| path |
	"The next line appears in the ref. I don't know what to do but the best is not to return the root folder"
	path := aPath = '<built-in>'
		ifTrue: [ aPath ]
		ifFalse: [ "We receive pathes that are one level too high in the hierarchy compared to what the model knows.
			For that we remove the first character in case it is a $/ and we select what is after the first path segment."
			aPath allButFirst copyAfter: $/ ].

	filesLocationsMap at: anId put: path
]

{ #category : #accessing }
CppCSVParser >> start [
	^ super start ==> [ :p | self doReportedOperations ]
]

{ #category : #accessing }
CppCSVParser >> type [
	^ super type
		==> [ :parsed | 
			| name |
			name := self clearTypeName: parsed second.
			self entitiesMap
				at: parsed first
				put:
					(self model
						detect: [ :entity | entity isType and: [ entity mooseName = name ] ]
						ifNone:
							[ "In the nck, the types can contains their namespace at the beginning of their name. We need to remove that."
							CppType named: (name splitOn: '::') last model: self model ]) ]
]

{ #category : #accessing }
CppCSVParser >> variable [
	^ super variable
		==> [ :parsed | 
			| parent |
			parent := self entitiesMap at: parsed fourth.
			self entitiesMap
				at: parsed first
				put:
					((parent isType
						ifTrue: [ 
							CppAttribute new
								parentType: parent;
								yourself ]
						ifFalse: [ 
							CppGlobalVariable new
								parentScope: parent;
								yourself ])
						name: parsed second;
						declaredType: (self entitiesMap at: parsed third);
						mooseModel: self model;
						sourceAnchor:
								(self
										createSourceAnchorForFileId: parsed fifth
										line: parsed sixth
										column: parsed seventh
										"Here we consider the end line the same than the start line because we do not have the information"
										lineEnd: parsed sixth);
						yourself) ]
]
