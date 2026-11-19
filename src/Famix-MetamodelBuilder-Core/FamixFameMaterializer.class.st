"
I materialize Famix Fame descriptions using the existing change filtering, ordering and handwritten-code preservation. I bind the same descriptions to the installed Pharo classes.
"
Class {
	#name : 'FamixFameMaterializer',
	#superclass : 'FMMaterializer',
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'api' }
FamixFameMaterializer >> changesFor: aMetamodel [

	^ FmxMBFameChangesBuilderVisitor new
		  buildChangesFor: aMetamodel;
		  filterRedoundantChanges;
		  changesToApply
]

{ #category : 'api' }
FamixFameMaterializer >> materialize: aMetamodel [

	FmxMBFameChangesBuilderVisitor new
		buildChangesFor: aMetamodel;
		filterRedoundantChanges;
		applyChanges.
	aMetamodel classes , aMetamodel traits do: [ :type |
		type implementingClass: (self class environment at: type famixImplementationName) ].
	aMetamodel updateCache.
	^ aMetamodel
]
