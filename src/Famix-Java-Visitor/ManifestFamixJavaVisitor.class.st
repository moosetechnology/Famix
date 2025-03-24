Class {
	#name : #ManifestFamixJavaVisitor,
	#superclass : #PackageManifest,
	#category : #'Famix-Java-Visitor-Manifest'
}

{ #category : #asserting }
ManifestFamixJavaVisitor class >> shouldBeIncludedByDefaultInMetamodelsWith: aCollectionOfPackages [

	^ aCollectionOfPackages anySatisfy: [ :package | package definedClasses anySatisfy: [ :class | class = FamixJavaClass ] ]
]
