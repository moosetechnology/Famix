Class {
	#name : #FamixUMLMicroUMLBackendTest,
	#superclass : #FamixUMLAbstractBackendTest,
	#category : #'Famix-UMLDocumentor-Tests-Generation'
}

{ #category : #running }
FamixUMLMicroUMLBackendTest >> newBackend [

	^FamixUMLMicroUMLBackend new
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateAggregationSource [

	| umlLink microAssoc |
	backend generateClass: (self classNamed: 'ClassA').
	backend generateClass: (self classNamed: 'ClassB').

	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.
	umlLink aggregation: #source.

	backend generateAssociation: umlLink.

	microAssoc := backend microUmlAssociations anyOne.

	self assert: microAssoc leftHead equals: 'aggregation'.
	self assert: microAssoc leftLabel isNil.

	self assert: microAssoc rightHead isNil.
	self assert: microAssoc rightLabel isNil.
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateAggregationTarget [

	| umlLink microAssoc |
	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.
	umlLink aggregation: #target.

	backend generateAssociation: umlLink.

	microAssoc := backend microUmlAssociations anyOne.

	self assert: microAssoc leftHead isNil.
	self assert: microAssoc leftLabel isNil.

	self assert: microAssoc rightHead equals: 'aggregation'.
	self assert: microAssoc rightLabel isNil.
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateAssociationCardinality [

	| umlLink |
	self skip.

	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.
	umlLink sourceCardinality: #multi.
	umlLink targetCardinality: #multi.

	backend generateAssociation: umlLink.

]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateAssociationRole [

	| umlLink microAssoc |
	backend generateClass: (self classNamed: 'ClassA').
	backend generateClass: (self classNamed: 'ClassB').

	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.
	umlLink sourceRole: 'roll'.
	umlLink targetRole: 'lol'.

	backend generateAssociation: umlLink.

	microAssoc := backend microUmlAssociations anyOne.

	self assert: microAssoc leftHead isNil.
	self assert: microAssoc leftLabel equals: 'roll'.

	self assert: microAssoc rightHead isNil.
	self assert: microAssoc rightLabel equals: 'lol'
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateAssociationSimple [

	| umlLink microAssoc |
	backend generateClass: (self classNamed: 'ClassA').
	backend generateClass: (self classNamed: 'ClassB').

	umlLink := self link: FamixUMLAssociation from: 'ClassA' to: 'ClassB'.

	backend generateAssociation: umlLink.

	self assert: backend microUmlAssociations size equals: 1.

	microAssoc := backend microUmlAssociations anyOne.

	self assert: microAssoc leftClass equals: 'ClassA'.
	self assert: microAssoc leftHead isNil.
	self assert: microAssoc leftLabel isNil.

	self assert: microAssoc rightClass equals: 'ClassB'.
	self assert: microAssoc rightHead isNil.
	self assert: microAssoc rightLabel isNil.
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateClass [
	| umlClass |
	umlClass := self classNamed: 'AClass'.

	backend generateClass: umlClass.

	self assert: backend microUmlClasses size equals: 1.
	self assert: backend microUmlClasses anyOne name equals: 'AClass'.
	self assert: backend microUmlClasses anyOne superclass isNil.
	self assert: backend microUmlClasses anyOne members isEmpty.
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateClassProperties [

	| umlClass microMember |
	umlClass := (self classNamed: 'AClass').
	umlClass 	properties: {
			self property: 'prop1' type: 'integer' .
			self property: 'prop2' type: 'whatever' .
		}.

	backend generateClass: umlClass.

	self assert: backend microUmlClasses anyOne members size equals: 2.

	microMember := backend microUmlClasses anyOne members first.
	self assert: microMember name equals: 'prop1'.
	self assert: microMember type equals: 'integer'.
	self assert: microMember isAttribute.

	microMember := backend microUmlClasses anyOne members second.
	self assert: microMember name equals: 'prop2'.
	self assert: microMember type equals: 'whatever'.
	self assert: microMember isAttribute.
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateInheritance [
	| umlLink |
	backend generateClass: (self classNamed: 'AClass').
	backend generateClass: (self classNamed: 'ASuperClass').

	self assert: (backend microUmlClasses at: 'AClass') superclass isNil.

	umlLink := self link: FamixUMLInheritance from: 'AClass' to: 'ASuperClass'.

	backend generateInheritance: umlLink.

	self assert: (backend microUmlClasses at: 'AClass') superclass equals: 'ASuperClass'
]

{ #category : #tests }
FamixUMLMicroUMLBackendTest >> testGenerateUse [
	| umlLink |
	umlLink := self link: FamixUMLUse from: 'AClass' to: 'Trait'.

	backend generateUse: umlLink.

	self assert: backend microUmlAssociations isEmpty
]
