Class {
	#name : #FmxImportingPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'importingContext',
		'entitiesList',
		'associationList',
		'toolbar'
	],
	#category : #'Moose-Core-Import'
}

{ #category : #initialization }
FmxImportingPresenter class >> numberOfEntitiesPerColumn [

	^ 15
]

{ #category : #specs }
FmxImportingPresenter class >> title [

	^ 'Select entities to be imported in your model'
]

{ #category : #specs }
FmxImportingPresenter class >> windowExtent [

	^ 600 @ 400
]

{ #category : #initialization }
FmxImportingPresenter >> initializeAssociationsList [

	associationList := self instantiate:
		                   SpFilteringSelectableListPresenter.

	associationList
		items: importingContext importedAssociations asArray;
		display: #name;
		onActivation: [ :fm3Class | 
			fm3Class ifNotNil: [ 
					importingContext importAssociation: fm3Class.
					self updateSelection ] ];
		onDeactivation: [ :fm3Class | 
			fm3Class ifNotNil: [ 
					importingContext doNotImportAssociation: fm3Class.
					self updateSelection ] ].

	associationList listPresenter sortingBlock: [ :a :b | 
		a name < b name ]
]

{ #category : #initialization }
FmxImportingPresenter >> initializeEntitiesList [

	entitiesList := self instantiate: SpFilteringSelectableListPresenter.
	entitiesList
		items: importingContext importedEntities asArray;
		display: #name;
		onActivation: [ :fm3Class | 
			fm3Class ifNotNil: [ 
					importingContext importConcreteEntity: fm3Class.
					self updateSelection ] ];
		onDeactivation: [ :fm3Class | 
			fm3Class ifNotNil: [ 
					importingContext doNotImportConcreteEntity: fm3Class.
					self updateSelection ] ].

	entitiesList listPresenter sortingBlock: [ :a :b | a name < b name ]
]

{ #category : #initialization }
FmxImportingPresenter >> initializeLayout [

	self layout: (SpBoxLayout newVertical
			 add: toolbar expand: false;
			 add: (SpBoxLayout newLeftToRight
					  add: (SpBoxLayout newVertical
							   add: 'Associations' expand: false;
							   add: associationList;
							   yourself);
					  spacing: 5;
					  add: (SpBoxLayout newVertical
							   add: 'Entities' expand: false;
							   add: entitiesList;
							   yourself);
					  yourself);
			 yourself)
]

{ #category : #initialization }
FmxImportingPresenter >> initializePresenters [

	self initializeToolbar.
	self initializeAssociationsList.
	self initializeEntitiesList.
	self initializeLayout.
	self updateSelection
]

{ #category : #initialization }
FmxImportingPresenter >> initializeToolbar [

	toolbar := self newToolbar.
	toolbar
		add: (self newToolbarButton
				 label: 'Select All';
				 icon: (self iconNamed: #smallAdd);
				 action: [ 
					 importingContext importMaximum.
					 self updateSelection ]);
		add: (self newToolbarButton
				 label: 'Unselect All';
				 icon: (self iconNamed: #smallDelete);
				 action: [ 
					 importingContext importNone.
					 self updateSelection ])
]

{ #category : #initialization }
FmxImportingPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self class title;
		initialExtent: self class windowExtent
]

{ #category : #'accessing - model' }
FmxImportingPresenter >> setModelBeforeInitialization: aFmxImportingContext [

	importingContext := aFmxImportingContext
]

{ #category : #initialization }
FmxImportingPresenter >> updateSelection [

	associationList
		selectItems: Set new;
		selectItems: importingContext importedAssociations copy.
	entitiesList
		selectItems: Set new;
		selectItems: importingContext importedEntities copy
]
