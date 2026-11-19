"
I project the complete FmxMB DSL definition into a Fame metamodel before Pharo code is installed. Fame owns the structural description; additional generation information preserves Famix support methods, trait composition and helper classes. I never install code.
"
Class {
	#name : 'FamixFameMetamodelBuilder',
	#superclass : 'Object',
	#instVars : [
		'metamodel',
		'descriptions',
		'propertyDescriptions',
		'sourceBuilder',
		'propertySelectors'
	],
	#category : 'Famix-MetamodelBuilder-Core-Basic',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Basic'
}

{ #category : 'building' }
FamixFameMetamodelBuilder >> addPropertiesOf: aBehavior [

	aBehavior propertiesAndRelations do: [ :property |
			| description |
			description := self descriptionOfProperty: property in: aBehavior.
			property isRelation ifTrue: [ self descriptionOfProperty: property oppositeSide in: property oppositeClass ] ]
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> buildFrom: aBuilder [

	| builders |
	sourceBuilder := aBuilder.
	aBuilder prepareGeneration.
	builders := { aBuilder } , aBuilder allSubBuilders asArray.
	self importInfrastructure.
	builders do: [ :each |
		(self metamodelBehaviorsIn: each) do: [ :behavior | self descriptionFor: behavior ] ].
	builders do: [ :each |
		(self metamodelBehaviorsIn: each) do: [ :behavior | self addPropertiesOf: behavior ] ].
	self resolveRelations.
	self importHandwrittenDescriptions.
	self recordGenerationFor: aBuilder.
	metamodel updateCache.
	^ metamodel
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> descriptionFor: aBehavior [

	| description |
	descriptions at: aBehavior fullName ifPresent: [ :existing |
		metamodel additionalProperty: #famixTag for: existing ifAbsentPut: [
			existing properties do: [ :property |
				metamodel additionalProperty: #famixHandwrittenProperty for: property ifAbsentPut: [ true ] ].
			aBehavior tag ].
		^ existing ].
	description := (aBehavior isMetamodelClass ifTrue: [ FM3Class ] ifFalse: [ FM3Trait ]) named: aBehavior name.
	description package: (self ensurePackageNamed: aBehavior packageName).
	descriptions at: aBehavior fullName put: description.
	metamodel add: description.
	metamodel additionalProperty: #famixImplementationName for: description ifAbsentPut: [ aBehavior fullName ].
	metamodel additionalProperty: #famixTag for: description ifAbsentPut: [ aBehavior tag ].
	description comment: aBehavior commentWithRelations.
	metamodel additionalProperty: #famixTraitExclusions for: description ifAbsentPut: [
		aBehavior additionalProperties at: #methodsToRemoveFromTraitComposition ifAbsent: [ Dictionary new ] ].
	aBehavior additionalProperties at: #precedingTrait ifPresent: [ :name |
		metamodel additionalProperty: #famixPrecedingTrait for: description ifAbsentPut: [ name ] ].
	aBehavior isMetamodelClass ifTrue: [
		description isAbstract: aBehavior isAbstractClass.
		description superclass: (aBehavior superclass
			ifNotNil: [ :superclass | self descriptionFor: superclass ]
			ifNil: [ descriptions at: aBehavior defaultSuperclassName ]) ].
	description traits: (aBehavior allLocalTraits collect: [ :trait | self descriptionFor: trait ]).
	description traits do: [ :trait | trait addUser: description ].
	self class environment at: aBehavior fullName ifPresent: [ :implementation | description implementingClass: implementation ].
	^ description
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> descriptionOfProperty: aProperty in: aBehavior [

	| description owner definingPackage declaredProperty |
	propertyDescriptions at: aProperty ifPresent: [ :existing | ^ existing ].
	aProperty validate.
	aProperty isRelation ifTrue: [
		declaredProperty := aBehavior propertiesAndRelations detect: [ :property | property name = aProperty name ] ifNone: [ aProperty ].
		declaredProperty == aProperty ifFalse: [
			description := self descriptionOfProperty: declaredProperty in: aBehavior.
			propertyDescriptions at: aProperty put: description.
			^ description ] ].
	owner := self descriptionFor: aBehavior.
	aProperty isRelation ifTrue: [
		owner properties detect: [ :existing | existing name = aProperty name ]
			ifFound: [ :existing | propertyDescriptions at: aProperty put: existing. ^ existing ] ].
	description := FM3Property named: aProperty name.
	description comment: aProperty comment.
	description implementingSelector: aProperty name asSymbol.
	owner properties add: description.
	propertyDescriptions at: aProperty put: description.
	metamodel add: description.
	aProperty isRelation
		ifTrue: [
			description
				type: (self descriptionFor: aProperty oppositeClass);
				isMultivalued: aProperty isMany;
				isContainer: aProperty isContainer;
				isDerived: aProperty isDerived;
				isSource: aProperty isSource;
				isTarget: aProperty isTarget ]
		ifFalse: [
			description
				type: (FM3Constant constants detect: [ :constant | constant name = aProperty propertyType ]
					ifNone: [ descriptions at: aProperty propertyType ]);
				isMultivalued: aProperty isMultivalued;
				defaultValue: aProperty defaultValue ].
	definingPackage := aProperty additionalProperties at: #definingPackage ifAbsent: [
		aProperty isRemote ifTrue: [ sourceBuilder packageName ] ifFalse: [ aBehavior packageName ] ].
	definingPackage ~= aBehavior packageName ifTrue: [
		description package: (self ensurePackageNamed: definingPackage) ].
	^ description
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> ensurePackageNamed: aString [

	^ metamodel packageNamed: aString ifAbsentPut: [
			  | package |
			  package := FM3Package named: aString.
			  metamodel add: package.
			  package ]
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> importHandwrittenDescriptions [

	| implementingPackages packages originalProperties |
	implementingPackages := ({ sourceBuilder } , sourceBuilder allSubBuilders asArray)
		collect: [ :each | each packageName asPackageIfAbsent: [ nil ] ] as: Set.
	implementingPackages remove: nil ifAbsent: [ ].
	implementingPackages add: MooseModel package.
	packages := implementingPackages , (MooseModel defaultPackagesToProcessWith: implementingPackages).
	originalProperties := metamodel properties asIdentitySet.
	FMMetaModelBuilder new extend: metamodel withPackages: packages.
	metamodel properties reject: [ :property | originalProperties includes: property ] thenDo: [ :property |
		metamodel additionalProperty: #famixHandwrittenProperty for: property ifAbsentPut: [ true ] ].
	(metamodel classes , metamodel traits) do: [ :type |
		type implementingClass ifNotNil: [ :implementation |
			metamodel additionalProperty: #famixImplementationName for: type ifAbsentPut: [ implementation name ] ] ]
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> importInfrastructure [

	| infrastructure |
	infrastructure := FMMetaModelBuilder metamodelFromPackages: { MooseModel package }.
	metamodel addAll: infrastructure elements.
	(infrastructure classes , infrastructure traits) do: [ :type |
		descriptions at: type implementingClass name put: type.
		metamodel additionalProperty: #famixImplementationName for: type ifAbsentPut: [ type implementingClass name ] ]
]

{ #category : 'initialization' }
FamixFameMetamodelBuilder >> initialize [

	super initialize.
	metamodel := FMMetaModel new.
	descriptions := Dictionary new.
	propertyDescriptions := IdentityDictionary new
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> isSupportMethod: aChange [

	aChange isClassSide ifTrue: [ ^ aChange selector ~= #annotation ].
	aChange protocol = #adding ifTrue: [ ^ false ].
	^ ((self propertySelectors at: aChange className ifAbsent: [ #(  ) ]) includes: aChange selector) not
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> metamodelBehaviorsIn: aBuilder [

	^ aBuilder traits , (aBuilder classes select: [ :behavior |
		behavior isClassEntity or: [ behavior isModelClass and: [ aBuilder shouldGenerateModel ] ] ])
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> propertySelectors [

	propertySelectors ifNotNil: [ ^ propertySelectors ].
	propertySelectors := Dictionary new.
	{ sourceBuilder } , sourceBuilder allSubBuilders asArray do: [ :each |
			each classes , each traits do: [ :behavior |
					propertySelectors at: behavior fullName put: (behavior propertiesAndRelations flatCollect: [ :property |
								 {
									 property name asSymbol.
									 (property name , ':') asSymbol } ]) ] ].
	^ propertySelectors
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> recordGenerationFor: aBuilder [

	| changes supportNames additionalChanges |
	changes := (FmxMBChangesBuilderVisitor visit: aBuilder) changesToApply.
	supportNames := (aBuilder classes reject: [ :behavior | behavior isClassEntity or: [ behavior isModelClass ] ])
		collect: #fullName.
	additionalChanges := changes select: [ :change |
		((change isKindOf: FmxMethodAddition) and: [ self isSupportMethod: change ]) or: [
			(change isKindOf: FmxBehavioralAddition)
				ifTrue: [ supportNames includes: change name ]
				ifFalse: [ (change isKindOf: FmxClassCommentUpdate) and: [ supportNames includes: change className ] ] ] ].
	aBuilder generator ifNotNil: [
		aBuilder generator subBuilders do: [ :remote |
			additionalChanges addAll: ((FmxMBRemoteChangesBuilderVisitor visit: remote) changesToApply select: [ :change |
				(change isKindOf: FmxMethodAddition) not or: [ self isSupportMethod: change ] ]) ] ].
	metamodel additionalProperty: #famixAdditionalChanges for: metamodel ifAbsentPut: [ additionalChanges ].
	metamodel additionalProperty: #famixPackageName for: metamodel ifAbsentPut: [ aBuilder packageName ].
	metamodel additionalProperty: #famixGeneratedTypes for: metamodel ifAbsentPut: [
		(self metamodelBehaviorsIn: aBuilder) collect: [ :behavior | self descriptionFor: behavior ] ]
]

{ #category : 'building' }
FamixFameMetamodelBuilder >> resolveRelations [

	| opposites |
	opposites := IdentityDictionary new.
	propertyDescriptions keysDo: [ :property |
			property isRelation ifTrue: [
					| description opposite |
					description := propertyDescriptions at: property.
					opposite := propertyDescriptions at: property oppositeSide.
					opposites at: description ifAbsentPut: [ opposite ].
					description type == opposite owner ifTrue: [ opposites at: description put: opposite ] ] ].
	(opposites keys sorted: #fullName ascending) do: [ :property | property opposite: (opposites at: property) ].
	"FM3 has one opposite; generation also needs the displaced polymorphic inverses."
	opposites keysAndValuesDo: [ :property :opposite |
		property opposite ifNil: [ metamodel additionalProperty: #famixDeclaredOpposite for: property ifAbsentPut: [ opposite ] ] ]
]
