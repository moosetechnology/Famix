"
I am the superclass of Moose visualizations, using Roassal 3.


I provide an API to be displayed
	- in a gt pane: #appearInPaneComposite: 
	- in a new window: #open.

My subclasses should define a default title and icon, and can override #...Title methods.

I know my visualization canvas and provide an accessor for it.
"
Class {
	#name : #MooseAbstractVisualization,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'Famix-Visualizations-Core'
}

{ #category : #accessing }
MooseAbstractVisualization class >> defaultTitle [
	^ self subclassResponsibility
]

{ #category : #accessing }
MooseAbstractVisualization class >> icon [
	^ self subclassResponsibility
]

{ #category : #building }
MooseAbstractVisualization >> build [
	self buildLegend.
	canvas nodes
		@
			(RSMenuActivable new
				menuDo: [ :menu :node | 
					menu addTitle: (self mooseInterestingEntityForNode: node) mooseName.
					menu
						addAllFrom: (self mooseInterestingEntityForNode: node) mooseMenu ])
]

{ #category : #display }
MooseAbstractVisualization >> buildInspectorPresenter: aBuilder [

	self build.
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		  canvas: self canvas;
		  yourself
]

{ #category : #building }
MooseAbstractVisualization >> buildLegend [
	self subclassResponsibility
]

{ #category : #accessing }
MooseAbstractVisualization >> canvas [
	^ canvas
]

{ #category : #accessing }
MooseAbstractVisualization >> canvas: aRSCanvas [

	canvas := aRSCanvas
]

{ #category : #initialization }
MooseAbstractVisualization >> initialize [
	super initialize.
	canvas := RSCanvas new.
	canvas @ RSCanvasController new noLegend
]

{ #category : #building }
MooseAbstractVisualization >> mooseInterestingEntityForNode: node [
	^ node model
]

{ #category : #display }
MooseAbstractVisualization >> open [
	self build.
	^ self canvas openWithTitle: self windowTitle
]

{ #category : #accessing }
MooseAbstractVisualization >> windowTitle [
	^ self class defaultTitle
]
