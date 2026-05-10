Class {
	#name : 'FmxMBAbstractChangesBuilderVisitor',
	#superclass : 'FmxMBWalkerVisitor',
	#instVars : [
		'builder',
		'currentBehavioral',
		'changesToApply'
	],
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'instance creation' }
FmxMBAbstractChangesBuilderVisitor class >> generate: aBuilder [

	(self visit: aBuilder)
		filterRedoundantChanges;
		applyChanges
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> addMethod: sourceCode classSide: aBoolean protocol: protocol [

	self
		addMethod: sourceCode
		in: currentBehavioral fullName
		classSide: aBoolean
		protocol: protocol
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> addMethod: sourceCode in: aClassName classSide: aBoolean protocol: protocol [

	changesToApply add: (FmxMethodAddition
			 className: aClassName
			 isClassSide: aBoolean
			 sourceCode: sourceCode
			 protocol: protocol)
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> addMethod: sourceCode in: aClassName protocol: protocol [

	self
		addMethod: sourceCode
		in: aClassName
		classSide: false
		protocol: protocol
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> addMethod: sourceCode protocol: protocol [

	self addMethod: sourceCode in: currentBehavioral fullName protocol: protocol
]

{ #category : 'operations' }
FmxMBAbstractChangesBuilderVisitor >> applyChanges [

	| dependencies |
	changesToApply ifEmpty: [ ^ self ]. 
	
	"Now we have a list of changes to apply. Some changes needs to by applied before others (for example, we need to create a classe to compile its methods or compile superclasses before their subclasses or traits before their users)."
	dependencies := changesToApply inject: Dictionary new into: [ :dictionary :change |
			                dictionary
				                at: change put: (change followingChangesIn: (changesToApply copyWithout: change));
				                yourself ].
	(AITopologicalSorting sort: changesToApply followingIncomingProperty: [ :change | dependencies at: change ]) do: #apply
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> buildSlotsDefinitionsFor: properties existingClass: currentClass [

	| modelSlotDefinitions |
	currentClass
		ifNil: [ modelSlotDefinitions := properties collect: [ :property | property slotDefinition ] ]
		ifNotNil: [
				| currentCustomSlots |
				currentCustomSlots := currentClass localSlots copyWithoutAll: currentClass generatedSlots.

				(currentClass generatedSlots reject: [ :generatedSlot | properties anySatisfy: [ :property | property name = generatedSlot name ] ]) ifNotEmpty: [
					:slotRemovals | changesToApply add: (FmxSlotRemovals slots: slotRemovals) ].

				modelSlotDefinitions := properties
					                        reject: [ :property | currentCustomSlots anySatisfy: [ :slot | slot name = property name ] ]
					                        thenCollect: [ :property | property slotDefinition ].

				modelSlotDefinitions addAll: (currentCustomSlots collect: #definitionString) ].

	modelSlotDefinitions ifEmpty: [ ^ nil ].
	^ modelSlotDefinitions sorted
]

{ #category : 'accessing' }
FmxMBAbstractChangesBuilderVisitor >> changesOfType: aClass [

	^ changesToApply select: [ :change | change isKindOf: aClass ]
]

{ #category : 'accessing' }
FmxMBAbstractChangesBuilderVisitor >> changesToApply [
	^ changesToApply
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> createClassNamed: className superclass: superclassName traitDefinitions: traitDefinitions precedingTrait: precedingTrait properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| realClass packageName tag change |
	realClass := self class environment at: className ifAbsent: [ nil ].

	packageName := realClass
		               ifNil: [ defaultPackage ]
		               ifNotNil: [ realClass package name ].
	tag := realClass
		       ifNil: [ defaultTag ]
		       ifNotNil: [ realClass packageTag name ].

	change := FmxClassAddition new.
	change
		name: className;
		superclass: superclassName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].

	self validateProperties: properties.
	change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass).
	changesToApply add: change.

	self ensurePackageNamed: packageName.

	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: className comment: comment) ]
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> createTraitNamed: traitName traitDefinitions: traitDefinitions precedingTrait: precedingTrait properties: properties in: defaultPackage tag: defaultTag comment: comment [

	| packageName tag realClass change |
	realClass := self class environment at: traitName ifAbsent: [ nil ].

	packageName := realClass
		               ifNil: [ defaultPackage ]
		               ifNotNil: [ realClass package name ].
	tag := realClass
		       ifNil: [ defaultTag ]
		       ifNotNil: [ realClass packageTag name ].

	change := FmxTraitAddition new.
	change
		name: traitName;
		package: packageName;
		tag: tag.

	traitDefinitions ifNotEmpty: [ change traits: (self traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass) ].

	properties ifNotEmpty: [
			self validateProperties: properties.
			change slots: (self buildSlotsDefinitionsFor: properties existingClass: realClass) ].
	changesToApply add: change.

	self ensurePackageNamed: packageName.

	comment ifNotEmpty: [ changesToApply add: (FmxClassCommentUpdate className: traitName comment: comment) ]
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> ensurePackageNamed: packageName [

	((self changesOfType: FmxPackageAddition) anySatisfy: [ :change | change packageName = packageName ]) ifTrue: [ ^ self ].

	changesToApply add: (FmxPackageAddition named: packageName)
]

{ #category : 'operations' }
FmxMBAbstractChangesBuilderVisitor >> filterRedoundantChanges [

	changesToApply := changesToApply select: #isRequired
]

{ #category : 'initialization' }
FmxMBAbstractChangesBuilderVisitor >> initialize [

	super initialize.
	changesToApply := OrderedCollection new
]

{ #category : 'accessing' }
FmxMBAbstractChangesBuilderVisitor >> methodFactory [

	^ FmxMBMethodsFactory
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> traitStringFrom: traitDefinitions precedingTrait: precedingTrait existingClass: realClass [
	"We need to collect the generated traits + the custom traits added by the user."

	| customTraitNames traitCompositionString |
	customTraitNames := ((realClass
		                      ifNil: [ #(  ) ]
		                      ifNotNil: [ :class | class traitComposition rootMembers ]) select: [ :e | realClass customTraitNames includes: e name ]) collect:
		                    #traitCompositionExpression.
	"manage methods to remove."
	traitCompositionString := traitDefinitions , customTraitNames ifEmpty: [ ^ '{ }' ] ifNotEmpty: [ :definitions | definitions joinUsing: ' + ' ].

	precedingTrait ifNil: [ ^ traitCompositionString ].

	^ String streamContents: [ :s |
			  s
				  nextPutAll: '(';
				  nextPutAll: traitCompositionString;
				  nextPutAll: ' withPrecedenceOf: ';
				  nextPutAll: precedingTrait;
				  nextPutAll: ')' ]
]

{ #category : 'private' }
FmxMBAbstractChangesBuilderVisitor >> validateProperties: properties [

	| names |
	names := properties collect: #name.
	self assert: names size = names asSet size description: 'Two properties of the same class cannot have the same names.'.
	properties do: [ :property | property validate ]
]

{ #category : 'visiting' }
FmxMBAbstractChangesBuilderVisitor >> visitBuilder: aBuilder [

	builder := aBuilder.
	super visitBuilder: aBuilder
]

{ #category : 'visiting' }
FmxMBAbstractChangesBuilderVisitor >> visitRelation: aRelation [

	| generationStrategy protocol |
	super visitRelation: aRelation.

	generationStrategy := (aRelation producesSlot
		                       ifTrue: [ FmxMBRelationSlotsGenerationStrategy ]
		                       ifFalse: [ FmxMBRelationAttributesGenerationStrategy ]) defaultInstance.

	protocol := aRelation isRemote
		            ifTrue: [ '*' , builder parentBuilderPackageName ]
		            ifFalse: [ #accessing ].

	self addMethod: (generationStrategy generateSetterCodeFor: aRelation) protocol: protocol.
	self addMethod: (generationStrategy generateGetterCodeFor: aRelation) protocol: protocol
]

{ #category : 'visiting' }
FmxMBAbstractChangesBuilderVisitor >> visitTypedProperty: aTypedProperty [

	| protocol |
	super visitTypedProperty: aTypedProperty.

	protocol := aTypedProperty isRemote
		            ifTrue: [ '*' , builder parentBuilderPackageName ]
		            ifFalse: [ #accessing ].

	self addMethod: (self methodFactory getTypedProperty: aTypedProperty) protocol: protocol.

	self addMethod: (self methodFactory setTypedProperty: aTypedProperty name remote: aTypedProperty isRemote) protocol: protocol
]
