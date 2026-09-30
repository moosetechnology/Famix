Extension { #name : #FamixAnnotationTypeGroup }

{ #category : #'*Famix-Visualizations' }
FamixAnnotationTypeGroup >> annotationConstellation [

	^ FamixAnnotationTypeGroupConstellation forAnnotationTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixAnnotationTypeGroup >> inspectionAnnotationConstellation: aBuilder [

	<inspectorPresentationOrder: 10 title: 'Annotation Constellation'>
	^ self annotationConstellation buildInspectorPresenter: aBuilder
]
