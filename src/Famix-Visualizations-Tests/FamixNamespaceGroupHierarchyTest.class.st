Class {
	#name : 'FamixNamespaceGroupHierarchyTest',
	#superclass : 'TestCase',
	#category : 'Famix-Visualizations-Tests',
	#package : 'Famix-Visualizations-Tests'
}

{ #category : 'helpers' }
FamixNamespaceGroupHierarchyTest >> flatNamespaces: aNumber [
	| model |
	model := FamixStModel new.
	^ (1 to: aNumber) collect: [ :index |
		FamixStNamespace new name: 'schema', index asString; mooseModel: model; yourself ]
]

{ #category : 'helpers' }
FamixNamespaceGroupHierarchyTest >> build: aVisualizationClass for: namespaces [
	^ (aVisualizationClass forNamespaceGroup: (FamixNamespaceGroup withAll: namespaces))
		build;
		yourself
]

{ #category : 'helpers' }
FamixNamespaceGroupHierarchyTest >> nestedNamespaces [
	| root child leaf |
	root := FamixNamespaceHierarchyTestNamespace new name: 'root'; yourself.
	child := FamixNamespaceHierarchyTestNamespace new name: 'child'; yourself.
	leaf := FamixNamespaceHierarchyTestNamespace new name: 'leaf'; yourself.
	root addChild: child.
	child addChild: leaf.
	^ { root. child. leaf }
]

{ #category : 'helpers' }
FamixNamespaceGroupHierarchyTest >> assertNestedEdges: aView namespaces: namespaces [
	self assert: (aView canvas nodes collect: #model) asSet equals: namespaces asSet.
	self assert: aView canvas nodes size equals: namespaces size.
	self assert: (aView canvas edges collect: [ :edge | edge from model -> edge to model ]) asSet
		equals: { namespaces second -> namespaces first. namespaces third -> namespaces second } asSet
]

{ #category : 'tests' }
FamixNamespaceGroupHierarchyTest >> testBuildEmptyHierarchies [
	{ FamixNamespaceGroupHierarchy. FamixNamespaceGroupOverallHierarchy } do: [ :type |
		| view |
		view := self build: type for: #().
		self assert: view canvas nodes isEmpty.
		self assert: view canvas edges isEmpty ]
]

{ #category : 'tests' }
FamixNamespaceGroupHierarchyTest >> testBuildSingleNamespace [
	{ FamixNamespaceGroupHierarchy. FamixNamespaceGroupOverallHierarchy } do: [ :type |
		| view |
		view := self build: type for: (self flatNamespaces: 1).
		self assert: view canvas nodes size equals: 1.
		self assert: view canvas edges isEmpty ]
]

{ #category : 'tests' }
FamixNamespaceGroupHierarchyTest >> testBuildFlatNamespaces [
	{ FamixNamespaceGroupHierarchy. FamixNamespaceGroupOverallHierarchy } do: [ :type |
		| view namespaces |
		namespaces := self flatNamespaces: 5.
		view := self build: type for: namespaces.
		self assert: view canvas nodes size equals: 5.
		self assert: (view canvas nodes collect: #model) asSet equals: namespaces asSet.
		self assert: view canvas edges isEmpty ]
]

{ #category : 'tests' }
FamixNamespaceGroupHierarchyTest >> testOverallNodesAreUniqueBeforeLayout [
	| namespaces view |
	namespaces := self flatNamespaces: 3.
	view := FamixNamespaceGroupOverallHierarchy forNamespaceGroup: (FamixNamespaceGroup withAll: namespaces).
	view buildNodes; connectNodes.
	self assert: view canvas nodes size equals: 3.
	self assert: view canvas edges isEmpty
]

{ #category : 'tests' }
FamixNamespaceGroupHierarchyTest >> testNestedNamespacesConnectToParents [
	| namespaces view |
	namespaces := self nestedNamespaces.
	view := self build: FamixNamespaceGroupHierarchy for: namespaces.
	self assertNestedEdges: view namespaces: namespaces
]

{ #category : 'tests' }
FamixNamespaceGroupHierarchyTest >> testOverallHierarchyIncludesAncestorsAndDescendants [
	| namespaces view |
	namespaces := self nestedNamespaces.
	view := self build: FamixNamespaceGroupOverallHierarchy for: { namespaces second }.
	self assertNestedEdges: view namespaces: namespaces.
	self assert: (view canvas shapeFromModel: namespaces second) color equals: view colorForNamespaceInGroup.
	self assert: (view canvas shapeFromModel: namespaces first) color equals: view colorForNamespaceOutsideGroup.
	self assert: (view canvas shapeFromModel: namespaces third) color equals: view colorForNamespaceOutsideGroup
]

{ #category : 'tests' }
FamixNamespaceGroupHierarchyTest >> testOverallHierarchyDeduplicatesOverlappingSelections [
	| namespaces view |
	namespaces := self nestedNamespaces.
	view := self build: FamixNamespaceGroupOverallHierarchy for: namespaces.
	self assertNestedEdges: view namespaces: namespaces
]
