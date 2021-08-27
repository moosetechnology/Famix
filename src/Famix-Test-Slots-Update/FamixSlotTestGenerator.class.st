Class {
	#name : #FamixSlotTestGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'method',
		'attribute',
		'association',
		'file',
		'fileAnchor',
		'folder',
		'indexedFileAnchor',
		'multipleFileAnchor',
		'class',
		'model',
		'tCanBeClassSide'
	],
	#category : #'Famix-Test-Slots-Update'
}

{ #category : #accessing }
FamixSlotTestGenerator class >> packageName [

	^ #'Famix-Test-Slots-Update-Entities'
]

{ #category : #accessing }
FamixSlotTestGenerator class >> prefix [

	^ #'FmxSlotTest'
]

{ #category : #definition }
FamixSlotTestGenerator >> defineClasses [
	super defineClasses.

	model := builder model.
	model comment: 'This is a the comment of the model class'.

	class := builder newClassNamed: #Class.
	class comment: 'This a comment for the Class entity'.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute.
	association := builder newClassNamed: #Association.

	file := builder newClassNamed: #File.
	fileAnchor := builder newClassNamed: #FileAnchor.
	folder := builder newClassNamed: #Folder.
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.
	multipleFileAnchor := builder newClassNamed: #MultipleFileAnchor
]

{ #category : #definition }
FamixSlotTestGenerator >> defineHierarchy [
	super defineHierarchy.

	association --|> #TAssociation.

	attribute
		--|> namedEntity ;
		--|> #TWithSourceLanguages ;
		--|> #TAttribute;
	  --|> tCanBeClassSide.

	class
		--|> namedEntity ;
		--|> #TWithSourceLanguages ;
		--|> #TClass ;
		--|> #TWithComments.

	file --|> namedEntity.
	file --|> #TFile.

	fileAnchor --|> sourceAnchor.
	fileAnchor --|> #TFileNavigation.

	folder --|> namedEntity.
	folder --|> #TFolder.

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	method
		--|> namedEntity ;
		--|> #TWithSourceLanguages ;
		--|> #TMethod; 
		--|> #THasKind;
		--|> tCanBeClassSide ;
		--|> #TWithComments.
		

	multipleFileAnchor --|> sourceAnchor.
	multipleFileAnchor --|> #TMultipleFileAnchor.

	sourcedEntity
		--|> #TWithFiles ;
		--|> #TWithSourceLanguages.
]

{ #category : #definition }
FamixSlotTestGenerator >> defineProperties [
	super defineProperties.
	model property: #modelHasProperties type: #Object.
	((tCanBeClassSide property: #isClassSide type: #Boolean) 
		comment: 'Entity can be declared class side i.e. static').	
]

{ #category : #definition }
FamixSlotTestGenerator >> defineTraits [ 

	super defineTraits.
	tCanBeClassSide := builder newTraitNamed: #TCanBeClassSide. 
]

{ #category : #definition }
FamixSlotTestGenerator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
