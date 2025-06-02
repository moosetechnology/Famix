Extension { #name : #FamixNamespaceGroup }

{ #category : #'*Famix-Visualizations' }
FamixNamespaceGroup >> hierarchy [

	^ FamixNamespaceGroupHierarchy forNamespaceGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixNamespaceGroup >> inspectionHierarchy: aBuilder [

	<inspectorPresentationOrder: 10 title: 'Hierarchy'>
	^ self withinOverallHierarchy buildInspectorPresenter: aBuilder
]

{ #category : #'*Famix-Visualizations' }
FamixNamespaceGroup >> withinOverallHierarchy [

	^ FamixNamespaceGroupOverallHierarchy forNamespaceGroup: self
]
