Class {
	#name : #MooseMSEImporterTestGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'model',
		'class',
		'method',
		'attribute',
		'inheritance',
		'package',
		'namespace',
		'primitiveType',
		'entityTyping'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
MooseMSEImporterTestGenerator class >> packageName [

	^ #'Moose-Core-Tests-Entities'
]

{ #category : #accessing }
MooseMSEImporterTestGenerator class >> prefix [

	^ #'MooseMSEImporterTest'
]

{ #category : #definition }
MooseMSEImporterTestGenerator >> defineClasses [

	super defineClasses.

	model := builder model.

	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute.
	inheritance := builder newClassNamed: #Inheritance.
	package := builder newClassNamed: #Package.
	namespace := builder newClassNamed: #Namespace.
	primitiveType := builder newClassNamed: #PrimitiveType.
	entityTyping := builder newClassNamed: #EntityTyping
]

{ #category : #definition }
MooseMSEImporterTestGenerator >> defineHierarchy [

	super defineHierarchy.

	attribute
		--|> namedEntity;
		--|> #TAttribute;
		--|> #TSourceEntity.

	class
		--|> namedEntity;
		--|> #TClass;
		--|> #TSourceEntity.

	inheritance --|> #TInheritance.

	method
		--|> namedEntity;
		--|> #TMethod.

	package
		--|> namedEntity;
		--|> #TPackage;
		--|> #TPackageable;
		--|> #TWithClasses.

	namespace
		--|> namedEntity;
		--|> #TNamespace;
		--|> #TWithClasses.

	primitiveType --|> #TPrimitiveType.

	entityTyping --|> #TEntityTyping
]
