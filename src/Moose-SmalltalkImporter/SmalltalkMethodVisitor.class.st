Class {
	#name : #SmalltalkMethodVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'theClass',
		'importer',
		'methodScope',
		'famixMethod'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #'instance creation' }
SmalltalkMethodVisitor class >> on: importer [

	^ self new
		  importer: importer;
		  yourself
]

{ #category : #private }
SmalltalkMethodVisitor >> CIVString [
	^ FamixStImporter CIVString
]

{ #category : #'method-classifying' }
SmalltalkMethodVisitor >> classifyMethodNode: aMethodNode [ 
	 
	self matchGetter: aMethodNode. 
	self matchSetter: aMethodNode. 
	self matchConstructor: aMethodNode. 
	self matchConstant: aMethodNode
]

{ #category : #visiting }
SmalltalkMethodVisitor >> createAccessTo: aNamedEntity writing: isWriteAccess [

	^ self factory access new
		  isWrite: isWriteAccess;
		  variable: aNamedEntity;
		  accessor: self methodEntity;
		  yourself
]

{ #category : #visiting }
SmalltalkMethodVisitor >> createReferenceTo: aNamedEntity [

	^ self factory reference source: self methodEntity target: (self resolveInstanceSide: aNamedEntity)
]

{ #category : #'method-classifying' }
SmalltalkMethodVisitor >> extractCommentsFromNode: aSequenceNode [

	importer importingContext shouldImportComment ifTrue: [
		aSequenceNode comments do: [ :aComment |
			| comment anchor |
			comment := self factory comment new
				           commentedEntity: self methodEntity;
				           yourself.
			anchor := self factory sourceTextAnchor new
				          element: comment;
				          source: (aSequenceNode source copyFrom: aComment start to: aComment stop) asString;
				          yourself.
			importer addEntity: comment ] ]
]

{ #category : #accessing }
SmalltalkMethodVisitor >> factory [

	^ self importer factory
]

{ #category : #accessing }
SmalltalkMethodVisitor >> importer [ 
	 
	^importer
]

{ #category : #accessing }
SmalltalkMethodVisitor >> importer: anObject [ 
	 
	importer := anObject
]

{ #category : #initialization }
SmalltalkMethodVisitor >> initializeForMethod: aMethod inClass: aClass [
	theClass := aClass.
	famixMethod := aMethod.
	methodScope := SmalltalkScope extend: (importer scopeOfClass: aClass).

]

{ #category : #'method-classifying' }
SmalltalkMethodVisitor >> matchConstant: aMethodNode [

	aMethodNode body isSequence ifTrue: [
		aMethodNode body statements ifNotEmpty: [ :statements |
			statements last isReturn ifTrue: [ statements last value isLiteralNode ifTrue: [ famixMethod beConstant ] ] ] ]
]

{ #category : #'method-classifying' }
SmalltalkMethodVisitor >> matchConstructor: aMethodNode [

	famixMethod protocol ifNotNil: [ 
		('*instance*creation*' match: famixMethod protocol asLowercase) 
			ifTrue: [ famixMethod beConstructor ] ]
]

{ #category : #'method-classifying' }
SmalltalkMethodVisitor >> matchGetter: aMethodNode [

	aMethodNode arguments ifNotEmpty: [ ^ self ].
	aMethodNode body isSequence ifTrue: [
		aMethodNode body statements size = 1 ifTrue: [
			| return |
			return := aMethodNode body statements first.
			return isReturn ifTrue: [
				return value isVariable ifTrue: [
					(methodScope resolve: return value name ifAbsent: [ nil ]) ifNotNil: [ :attribute |
						attribute class = self importer factory attribute ifTrue: [ famixMethod beGetter ] ] ] ] ] ]
]

{ #category : #'method-classifying' }
SmalltalkMethodVisitor >> matchSetter: aMethodNode [

	| assignment |
	aMethodNode arguments size = 1 ifTrue: [
		aMethodNode body isSequence ifTrue: [
			aMethodNode body statements size = 1 ifTrue: [
				assignment := aMethodNode body statements first.
				assignment isReturn ifTrue: [ assignment := assignment value ].
				assignment isAssignment ifTrue: [
					(methodScope resolve: assignment variable name ifAbsent: [ nil ]) ifNotNil: [ :attribute |
						attribute class = self importer factory attribute ifTrue: [
							assignment value isVariable ifTrue: [ assignment value name = aMethodNode arguments first name ifTrue: [ famixMethod beSetter ] ] ] ] ] ] ] ]
]

{ #category : #accessing }
SmalltalkMethodVisitor >> methodEntity [ 
	 
	^famixMethod
]

{ #category : #private }
SmalltalkMethodVisitor >> parseTreeForSource: methodSourceString [

	^ RBParser parseMethod: methodSourceString onError: [ :aString :pos | ^ nil ]
]

{ #category : #private }
SmalltalkMethodVisitor >> resolve: name [
	"Return a famix entity that correspond to the reference 'name' contained in a source code. It does the lookup according to the Smalltalk semantics"

	| object klass pool |
	(name = 'self' or: [ name = 'super' or: [ name = 'thisContext' ] ]) ifTrue: [ ^ importer ensureImplicitVariable: name asSymbol inFamixMethod: famixMethod ].
	object := self methodEntity isClassSide ifTrue: [ methodScope resolve: self CIVString , name ifAbsent: [ nil ] ].
	object ifNil: [ object := methodScope resolve: name ifAbsent: nil ].
	object ifNotNil: [ ^ object ].
	name asString = 'Smalltalk' ifTrue: [ ^ importer ensureNamespace: Smalltalk ].
	klass := self methodEntity smalltalkClass instanceSide.
	(klass usesLocalPoolVarNamed: name)
		ifTrue: [ pool := klass sharedPoolOfVarNamed: name.
			^ self importer ensureClassVarAttribute: name for: pool ].
	(Smalltalk globals includesKey: name asSymbol) ifFalse: [ ^ importer ensureUnknownVariable: name ].

	"The name must be a global accessible variable"
	object := Smalltalk at: name asSymbol.
	object isBehavior ifTrue: [ ^ importer ensureClass: object class ].
	^ importer ensureGlobalVariable: name asSymbol value: object
]

{ #category : #visiting }
SmalltalkMethodVisitor >> resolveInstanceSide: aNamedEntity [
	"We ensure that a reference to a metaclass is considered as a reference to the class itself"

	^ ((aNamedEntity isKindOf: self importer factory classEntity) and: [ '*_class' match: aNamedEntity name ])
		ifTrue: [ | className |
			className := aNamedEntity name removeSuffix: '_class'.
			importer ensureClass: (Smalltalk at: className asSymbol) ]
		ifFalse: [ aNamedEntity ]
]

{ #category : #accessing }
SmalltalkMethodVisitor >> runWith: aCompiledMethod and: anEntity [

	| parseTree |
	self
		initializeForMethod: anEntity
		inClass: aCompiledMethod methodClass.

	parseTree := theClass parseTreeForSelector: aCompiledMethod selector.
	parseTree ifNotNil: [
		self visitMethodNode: parseTree "sourceCodeAt:" ]
]

{ #category : #accessing }
SmalltalkMethodVisitor >> runWithSource: sourceAsString and: aFamixMethod [
	| parseTree |
	self initializeForMethod: aFamixMethod inClass: aFamixMethod parentType.

	parseTree := self parseTreeForSource: sourceAsString. 
	parseTree ifNotNil: [self visitMethodNode: parseTree]	"sourceCodeAt:"
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitAssignmentNode: anAssignmentNode [

	| access |
	importer importingContext shouldImportAccess ifTrue: [
		access := self factory access new.
		access isWrite: true.
		access variable: (self resolve: anAssignmentNode variable name).
		access accessor: self methodEntity.
		importer addEntity: access ].
	self extractCommentsFromNode: anAssignmentNode.
	self visitNode: anAssignmentNode value
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitBlockNode: aBlockNode [

	| local |
	importer importingContext shouldImportLocalVariable ifTrue: [
		aBlockNode arguments do: [ :aVariableNode |
			local := self factory localVariable new.
			local name: aVariableNode name asSymbol.
			local parentBehaviouralEntity: self methodEntity.
			importer addEntity: local.
			methodScope at: aVariableNode name bind: local ] ].
	self extractCommentsFromNode: aBlockNode. "self visitArguments: aBlockNode arguments."
	self visitNode: aBlockNode body
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitCascadeNode: aCascadeNode [
	aCascadeNode messages ifNotEmpty: [ :messages | messages do: [ :each | self visitNode: each ] ].
	self extractCommentsFromNode: aCascadeNode
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitMessageNode: aMessageNode [

	| invocation |
	importer importingContext shouldImportInvocation ifTrue: [
		invocation := self factory invocation new.
		invocation sender: self methodEntity.

		invocation signature: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: aMessageNode selector).
		"invocation  
				setInvokes: 
					(FAMIXNameResolver signatureFromSmalltalkSelector: aMessageNode selector)."
		aMessageNode receiver isVariable ifTrue: [ invocation receiver: (self resolve: aMessageNode receiver name asString) ].
		"aMessageNode receiver isVariable 
				ifTrue: 
					[invocation 
						setReceivingVariable: (self resolve: aMessageNode receiver name)]. "
		aMessageNode selector == #subclassResponsibility ifTrue: [ self methodEntity isAbstract: true ].
		importer addEntity: invocation ].
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ]) ifTrue: [ self visitNode: aMessageNode receiver ].
	importer importingContext shouldImportArgument ifTrue: [ aMessageNode arguments do: [ :each | self visitNode: each ] ].
	self extractCommentsFromNode: aMessageNode
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitMethodNode: aMethodNode [

	importer importingContext shouldImportArgument ifTrue: [
		aMethodNode arguments do: [ :aVariableNode |
			| argument |
			argument := self factory parameter new.
			argument name: aVariableNode name asSymbol.
			argument parentBehaviouralEntity: self methodEntity.
			importer addEntity: argument.
			methodScope at: aVariableNode name bind: argument ] ].
	self extractCommentsFromNode: aMethodNode.
	self visitNode: aMethodNode body.
	aMethodNode pragmas do: [ :each | self visitNode: each ].

	"recognize getters/setters/constructors/..."
	self classifyMethodNode: aMethodNode
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitPragmaNode: aPragmaNode [

	| annotationInstance annotationType |
	annotationType := self importer ensureAnnotationType: aPragmaNode.
	annotationInstance := self importer factory annotationInstance new.
	annotationInstance annotationType: annotationType.
	self importer addEntity: annotationInstance.
	annotationInstance annotatedEntity: self methodEntity.
	aPragmaNode arguments doWithIndex: [ :each :i |
		| attribute |
		attribute := self factory annotationInstanceAttribute new.
		attribute value: each value.
		attribute parentAnnotationInstance: annotationInstance.
		attribute annotationTypeAttribute: (annotationInstance annotationType attributes at: i).
		self importer addEntity: attribute ]
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitReturnNode: aReturnNode [ 
	 
	self visitNode: aReturnNode value. 
	self extractCommentsFromNode: aReturnNode
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitSequenceNode: aSequenceNode [
	"self visitArguments: aSequenceNode temporaries."

	| local |
	importer importingContext shouldImportLocalVariable ifTrue: [
		aSequenceNode temporaries do: [ :aVariableNode |
			local := self factory localVariable new.
			local name: aVariableNode name asSymbol.
			local parentBehaviouralEntity: self methodEntity.
			importer addEntity: local.
			methodScope at: aVariableNode name bind: local ] ].
	self extractCommentsFromNode: aSequenceNode.
	aSequenceNode statements do: [ :each | self visitNode: each ]
]

{ #category : #visiting }
SmalltalkMethodVisitor >> visitVariableNode: aVariableNode [

	importer importingContext shouldImportAccess ifTrue: [
		| access namedEntity global |
		"Warning! Smalltalk is both a Namespace and a GlobalVariable.
		By default the importer resolves Smalltalk to the namespace (for class and namespace creation).
		When we access Smalltalk as a variable, we create an access to the SmalltalkGlobalVariable instead"
		access := aVariableNode name = 'Smalltalk'
			          ifTrue: [
				          global := importer ensureGlobalVariable: #SmalltalkGlobalVariable value: Smalltalk.
				          self createAccessTo: global writing: false ]
			          ifFalse: [
				          namedEntity := self resolve: aVariableNode name.
				          (namedEntity isKindOf: self factory classEntity)
					          ifTrue: [ self createReferenceTo: namedEntity ]
					          ifFalse: [ self createAccessTo: namedEntity writing: false ] ].
		importer addEntity: access ].
	self extractCommentsFromNode: aVariableNode
]
