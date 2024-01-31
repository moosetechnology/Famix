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

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FamixJavaGenerator)) #'2024-01-31T17:17:11.328708+01:00') )
]
