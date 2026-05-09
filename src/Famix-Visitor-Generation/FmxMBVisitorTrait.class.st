"
I am responsible for the generation of a visitor trait when generating a Famix metamodel.
See `FamixVisitorGenerator`.
"
Class {
	#name : 'FmxMBVisitorTrait',
	#superclass : 'FmxMBTrait',
	#category : 'Famix-Visitor-Generation-MetamodelBuilder',
	#package : 'Famix-Visitor-Generation',
	#tag : 'MetamodelBuilder'
}

{ #category : 'generating' }
FmxMBVisitorTrait >> acceptMethodProtocol [

	^ self packageName == self builder configuration packageName
		  ifTrue: [ #visitor ]
		  ifFalse: [ '*' , self packageName ]
]

{ #category : 'visitor' }
FmxMBVisitorTrait >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitVisitor: self
]

{ #category : 'accessing' }
FmxMBVisitorTrait >> comment [

	^ 'I am a visitor for {1}Entities. 
I am generated with the metamodel.' format: { self prefix }
]

{ #category : 'generating' }
FmxMBVisitorTrait >> generate [

	self builder environment
		createTraitNamed: self fullName asSymbol
		traitDefinitions: self allTraitDefinitions
		precedingTrait: (self additionalProperties at: #precedingTrait ifAbsent: [ nil ])
		properties: (self propertiesAndRelations select: #producesSlot)
		in: self packageName
		tag: self tag
		comment: self comment.

	self generateAnnotation.

	self allLocalTraits ifEmpty: [
			self addMethod: FmxMBMethodsFactory visitEntity protocol: #visiting.
			self addMethod: FmxMBMethodsFactory visitCollection protocol: #visiting ].

	(builder classes select: #isClassEntity) , (builder traits select: [ :fmxTrait | fmxTrait isMetamodelTrait and: [ fmxTrait isVisitorTrait not ] ]) do: [
			:fmxMBBehavior |
			self addMethod: (FmxMBMethodsFactory visitBehavioral: fmxMBBehavior) protocol: #visiting.
			fmxMBBehavior addMethod: (FmxMBMethodsFactory acceptFor: fmxMBBehavior fullName) protocol: self acceptMethodProtocol ]
]

{ #category : 'initialization' }
FmxMBVisitorTrait >> initialize [

	super initialize.
	name := #TVisitor.
	tag := 'Visitor'
]

{ #category : 'testing' }
FmxMBVisitorTrait >> isVisitorTrait [

	^ true
]
