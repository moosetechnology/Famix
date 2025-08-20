Class {
	#name : #FamixUMLMicroUMLBackend,
	#superclass : #FamixUMLAbstractBackend,
	#instVars : [
		'canvas',
		'microUmlAssociations',
		'microUmlClasses'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #api }
FamixUMLMicroUMLBackend >> export: entities [

	microUmlClasses := Dictionary new: (entities count: [ :each | each class = FamixUMLClass ]).
	microUmlAssociations := OrderedCollection new: (entities count: [ :each | each class = FamixUMLAssociation ]).

	super export: entities.

	canvas := MicroUMLRoassalBuilder new
		classDiagramNode: self microUmlClassDiagram ;
		build.

	canvas @ RSCanvasController.
	canvas open.
	^canvas
]

{ #category : #generating }
FamixUMLMicroUMLBackend >> generateAssociation: association [

	| microUmlNode |

	microUmlNode := MicroUMLAssociationNode new
		leftClass: association source ;
		rightClass: association target ;
		yourself.

	(association aggregation = #source)
		ifTrue: [ microUmlNode leftHead: #aggregation ].
	(association aggregation = #target)
		ifTrue: [ microUmlNode rightHead: #aggregation ].

	association sourceRole
		ifNotNil: [ :role | microUmlNode leftLabel: role ].
	association targetRole
		ifNotNil: [ :role | microUmlNode rightLabel: role ].

	microUmlAssociations add: microUmlNode 
]

{ #category : #generating }
FamixUMLMicroUMLBackend >> generateClass: aClass [

	microUmlClasses
		at: aClass name
		put: (MicroUMLClassNode new
			name: aClass name).

	super generateClass: aClass 
]

{ #category : #generating }
FamixUMLMicroUMLBackend >> generateClass: aClass property: property [

	(microUmlClasses at: aClass name)
		addAttribute: property name.
	((microUmlClasses at: aClass name)
		attributeAt: property name)
			type: property type.
]

{ #category : #generating }
FamixUMLMicroUMLBackend >> generateInheritance: inheritance [

	(microUmlClasses at: inheritance source)
		superclass: inheritance target
]

{ #category : #generating }
FamixUMLMicroUMLBackend >> generateUse: aUseLink [
	"MicroUML currently does not handle multiple inheritance"

	"(microUmlClasses at: aUseLink source)
		superclass: aUseLink target"
]

{ #category : #generating }
FamixUMLMicroUMLBackend >> microUmlClassDiagram [

	^MicroUMLClassDiagramNode new
		classes: microUmlClasses values ;
		associations: microUmlAssociations ;
		yourself
]
