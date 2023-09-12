Trait {
	#name : #FDTrait2,
	#traits : 'FDTrait1',
	#classTraits : 'FDTrait1 classTrait',
	#category : #'Famix-MetamodelDocumentor-tests'
}

{ #category : #meta }
FDTrait2 classSide >> annotation [

	<FMClass: #Trait2 super: #Object>
	<package: #'Famix-TestModel1MetamodelDocumentor'>
	<generated>
	^ self
]
