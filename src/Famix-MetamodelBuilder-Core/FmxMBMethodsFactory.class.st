"
The Famix metamodel generator needs to generate a lot of methods. Those can be quite verbose.

My responsisbility is to return the code of all methods to generate.

I'll be used during the generation of a metamodel.
"
Class {
	#name : 'FmxMBMethodsFactory',
	#superclass : 'Object',
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'code generation' }
FmxMBMethodsFactory class >> addToCollectionFor: aName [

	^ 'add{1}: anObject
	<generated>
	^ self {2} add: anObject' format: {
			  aName capitalized asSingular.
			  aName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> allSubmetamodelsPackagesNamesFor: subBuilders [

	^ String streamContents: [ :stream |
			  | packages |
			  stream nextPutAll: 'allSubmetamodelsPackagesNames
	<generated>
	^ #('.

			  packages := (subBuilders collect: [ :subBuilder | subBuilder packageName ]) asOrderedCollection sorted: #yourself descending.

			  packages do: [ :package | stream print: package ] separatedBy: [ stream space ].

			  stream nextPut: $) ]
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> annotationFor: aName super: superclassName package: package isAbstract: aBoolean [

	^ 'annotation

	<FMClass: #{1} super: #{2}>
	<package: {3}>
	<generated>{4}' format: {
			  aName.
			  superclassName.
			  package.
			  (aBoolean
				   ifTrue: [
						   '
	<abstract>' ]
				   ifFalse: [ '' ]) }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> canBeImportedFromFile [

	^ 'canBeImportedFromFile
	<generated>
	^true'
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> equalsForVariableNamed: variableName properties: properties [

	^ String streamContents: [ :stream |
			  stream
				  << '= ';
				  << variableName;
				  << '

	<generated>
	^ ';
				  << variableName;
				  << ' ';
				  << properties first;
				  << ' = self ';
				  << properties first.
			  properties size > 1 ifTrue: [
					  2 to: properties size do: [ :idx |
							  stream << ' and: [ '.
							  stream
								  << variableName;
								  << ' ';
								  << (properties at: idx);
								  << ' = self ';
								  << (properties at: idx) ].
					  2 to: properties size do: [ :idx | stream << '] ' ] ] ]
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> getTypedProperty: aProperty [

	| propertyDefinition commentDefinition pragmaFormat |
	pragmaFormat := aProperty defaultValue
		                ifNil: [ '<FMProperty: #{1} type: #{2}>' ]
		                ifNotNil: [ '<FMProperty: #{1} type: #{2} defaultValue: {3}>' ].
	propertyDefinition := pragmaFormat format: {
			                      aProperty name.
			                      aProperty propertyType.
			                      aProperty defaultValue printString }.

	commentDefinition := aProperty comment ifNotEmpty: [ '<FMComment: {1}>' format: { aProperty comment printString } ].

	^ String streamContents: [ :s |
			  s
				  nextPutAll: aProperty name;
				  cr;
				  cr.
			  s
				  tab;
				  nextPutAll: propertyDefinition;
				  cr.
			  s
				  tab;
				  nextPutAll: '<generated>';
				  cr.
			  aProperty isMultivalued ifTrue: [
					  s
						  tab;
						  nextPutAll: '<multivalued>';
						  cr ].
			  commentDefinition ifNotEmpty: [
					  s
						  tab;
						  nextPutAll: commentDefinition;
						  cr ].
			  s
				  tab;
				  nextPutAll: '^ '.

			  aProperty isRemote
				  ifTrue: [
						  s
							  nextPutAll: 'self attributeAt: #';
							  nextPutAll: aProperty name;
							  nextPutAll: ' ifAbsent: [ nil ]' ]
				  ifFalse: [ s nextPutAll: aProperty name ].


			  aProperty defaultValue ifNotNil: [
					  s nextPutAll: (' ifNil: [ {1} := {2} ]' format: {
								   aProperty name.
								   aProperty defaultValue printString }) ] ]
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> groupAnnotationNamed: aName [

	^ 'annotation{1}
	<generated>
	<mooseGroup>
	^ {1}' format: { aName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> hashForProperties: properties [

	^ String streamContents: [ :stream |
			  stream << 'hash'.
			  stream << '

	<generated>
	^ '.
			  stream
				  << 'self ';
				  << properties first;
				  << ' hash '.
			  properties size > 1 ifTrue: [
					  2 to: properties size do: [ :idx |
							  stream
								  << 'bitXor: self ';
								  << (properties at: idx);
								  << ' hash ' ] ] ]
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> importAssociationNamed: aName [

	^ 'import{1}

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #{1})' format: { aName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> importEntityNamed: aName [

	^ 'import{1}

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #{1})' format: { aName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> importedMetamodelForPrefix: prefix [

	^ 'importedMetamodel

	<generated>
	^ {1}Model metamodel' format: { prefix }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> importingClassNamed: aName [

	^ 'importingContextClass

	<generated>
	^ {1}' format: { aName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> instantiate: aClass [

	^ 'new{1}

	<generated>
	^ self add: {2} new' format: {
			  aClass name.
			  aClass fullName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> instantiateNamed: aClass [

	^ 'new{1}Named: aName

	<generated>
	^ self add: ({2} named: aName)' format: {
			  aClass name.
			  aClass fullName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> isAbstractFor: className [

	^ 'isAbstract

	<generated>
	^ self == {1}' format: { className }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> metamodelFor: className [

	^ 'metamodel

	<generated>
	^ {1} metamodel' format: { className }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> setTypedProperty: aName remote: aBoolean [

	^ (String streamContents: [ :stream |
			   stream nextPutAll: '{1}: anObject
	<generated>
	'.
			   aBoolean
				   ifTrue: [ stream nextPutAll: 'self attributeAt: #{1} put: anObject' ]
				   ifFalse: [ stream nextPutAll: '{1} := anObject' ] ]) format: { aName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> shouldImportNamed: aName [

	^ 'shouldImport{1}

	<generated>
	^ self shouldImport: #{1}' format: { aName }
]

{ #category : 'code generation' }
FmxMBMethodsFactory class >> testReturning: aBoolean for: aSelector [

	^ '{1}

	<generated>
	^ {2}' format: {
			  aSelector.
			  aBoolean printString }
]
