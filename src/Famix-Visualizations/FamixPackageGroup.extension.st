Extension { #name : #FamixPackageGroup }

{ #category : #'*Famix-Visualizations' }
FamixPackageGroup >> complexity [

	^ FamixPackageGroupComplexity forPackageGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixPackageGroup >> inspectorShowComplexity [

	<inspectorPresentationOrder: 10 title: 'Complexity'>
	^ self complexity asInspectorPresenter
]
