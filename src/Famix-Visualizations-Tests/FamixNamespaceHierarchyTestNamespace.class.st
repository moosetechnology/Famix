"A nested-namespace fixture with self-inclusive scope queries, as in Famix.
The standard Smalltalk namespace metamodel only provides flat namespaces."
Class {
	#name : 'FamixNamespaceHierarchyTestNamespace',
	#superclass : 'Object',
	#instVars : [ 'name', 'parent', 'children' ],
	#category : 'Famix-Visualizations-Tests',
	#package : 'Famix-Visualizations-Tests'
}

{ #category : 'initialization' }
FamixNamespaceHierarchyTestNamespace >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : 'accessing' }
FamixNamespaceHierarchyTestNamespace >> name [
	^ name
]

{ #category : 'accessing' }
FamixNamespaceHierarchyTestNamespace >> name: aString [
	name := aString
]

{ #category : 'accessing' }
FamixNamespaceHierarchyTestNamespace >> addChild: aNamespace [
	children add: aNamespace.
	aNamespace parent: self
]

{ #category : 'accessing' }
FamixNamespaceHierarchyTestNamespace >> parent: aNamespace [
	parent := aNamespace
]

{ #category : 'queries' }
FamixNamespaceHierarchyTestNamespace >> containers [
	^ parent ifNil: [ #() ] ifNotNil: [ { parent } ]
]

{ #category : 'queries' }
FamixNamespaceHierarchyTestNamespace >> containersOfType: aType [
	^ { self }
]

{ #category : 'queries' }
FamixNamespaceHierarchyTestNamespace >> allContainersOfType: aType [
	^ parent
		ifNil: [ { self } ]
		ifNotNil: [ { self }, (parent allContainersOfType: aType) ]
]

{ #category : 'queries' }
FamixNamespaceHierarchyTestNamespace >> allContainedEntitiesOfType: aType [
	^ { self }, (children flatCollect: [ :child | child allContainedEntitiesOfType: aType ]) asArray
]
