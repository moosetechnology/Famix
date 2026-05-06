Extension { #name : 'MooseObject' }

{ #category : '*Moose-Query' }
MooseObject >> allDeclaredProperties [
	"Do not use the class side version

This method allows us to look for its properties in the metadescription.
And, the metadescription might be different in the instance and in the class side since we can define for each instance its metamodel (with more or less properties)"

	^ self metadescription allProperties
]

{ #category : '*Moose-Query' }
MooseObject >> metadescription [

	^ self mooseModel
		  ifNil: [ super metadescription ]
		  ifNotNil: [ :model | model metadescriptionFor: self class ]
]

{ #category : '*Moose-Query' }
MooseObject >> miInspectionFame: aBuilder [

	<inspectorPresentationOrder: 3 title: 'Fame'>
	^ aBuilder newTable
		  items: self metadescription allComplexProperties;
		  sortingBlock: #fullName ascending;
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :item | item name ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'Type' evaluated: [ :item | item type name ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'Opposite' evaluated: [ :item |
						   item opposite
							   ifNil: [ '' ]
							   ifNotNil: [ :opposite | opposite name ] ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'Derived?' evaluated: [ :item | item isDerived ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'Container?' evaluated: [ :item | item isContainer ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'IsTarget?' evaluated: [ :item | item isTarget ]) beSortable;
		  addColumn: (SpStringTableColumn title: 'IsSource?' evaluated: [ :item | item isSource ]) beSortable;
		  beResizable
]
