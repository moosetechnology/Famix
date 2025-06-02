Extension { #name : #FamixTypeGroup }

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> inspectionNesting: aBuilder [

	<inspectorPresentationOrder: 10 title: 'Nesting'>
	^ self nesting buildInspectorPresenter: aBuilder
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> inspectionSystemComplexity: aBuilder [

	<inspectorPresentationOrder: 10 title: 'System Complexity'>
	^ self systemComplexity buildInspectorPresenter: aBuilder
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> inspectionUML: aBuilder [

	<inspectorPresentationOrder: 10 title: 'UML'>
	^ self uml buildInspectorPresenter: aBuilder
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> nesting [
	^ FamixTypeGroupNesting forTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> systemAttraction [
	^ FamixTypeGroupSystemAttraction forTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> systemComplexity [
	^ FamixTypeGroupSystemComplexity forTypeGroup: self
]

{ #category : #'*Famix-Visualizations' }
FamixTypeGroup >> uml [
	^ FamixTypeUML forTypeGroup: self
]
