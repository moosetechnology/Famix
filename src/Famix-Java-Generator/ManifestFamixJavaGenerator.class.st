"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFamixJavaGenerator,
	#superclass : #PackageManifest,
	#category : #'Famix-Java-Generator-Manifest'
}

{ #category : #'code-critics' }
ManifestFamixJavaGenerator class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FamixJavaGenerator #defineHierarchy #false)) #'2022-02-25T14:13:05.813733+01:00') )
]
