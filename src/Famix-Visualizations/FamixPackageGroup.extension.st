Extension { #name : #FamixPackageGroup }

{ #category : #'*Famix-Visualizations' }
FamixPackageGroup >> complexity [

	^ FamixPackageGroupComplexity forPackageGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixPackageGroup >> inspectionSystemComplexity: aBuilder [

	<inspectorPresentationOrder: 10 title: 'Complexity'>
	^ self complexity buildInspectorPresenter: aBuilder
]
