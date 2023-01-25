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
	^ #(#(#(#RGMethodDefinition #(#FamixGenerator #defineHierarchy #false)) #'2022-02-25T13:58:54.050352+01:00') #(#(#RGMethodDefinition #(#FamixGenerator #defineTraits #false)) #'2022-02-25T15:49:05.41552+01:00') )
]
