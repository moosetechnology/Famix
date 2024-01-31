"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFamixMetamodelGeneration,
	#superclass : #PackageManifest,
	#category : #'Famix-MetamodelGeneration-Manifest'
}

{ #category : #'code-critics' }
ManifestFamixMetamodelGeneration class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FamixGenerator)) #'2024-01-31T17:11:51.063524+01:00') )
]
