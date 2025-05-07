"
I am an extension for a FamixMetamodelGenerator.
I am responsible for the creation of a Visitor trait and the #accept: method in each entity of the metamodel.

To use me: in your metamodel generator class, define the two following methods:

```language=Pharo
metamodelToolGenerators

	^ { FamixVisitorGenerator }
```

```language=Pharo
packageNameForVisitor
	^ 'Famix-XYZ-Visitor' ""replace XYZ by your metamodel name""
```

Then generate normally.
Don't forget to commit the newly generated visitor package and to add it to your baseline:

```language=Pharo
	spec
		package: 'Famix-XYZ-Visitor' with: [ spec requires: #( 'Famix-XYZ-Entities' ) ]; ""replace XYZ by your metamodel name""
```
"
Class {
	#name : #FamixVisitorGenerator,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'builder'
	],
	#category : #'Famix-Visitor-Generation-MetamodelBuilder'
}

{ #category : #'instance creation' }
FamixVisitorGenerator class >> forGenerator: aFamixMetamodelGenerator [

	^ self new
		  configureForGenerator: aFamixMetamodelGenerator;
		  yourself
]

{ #category : #initialization }
FamixVisitorGenerator >> configureForGenerator: aFamixMetamodelGenerator [

	builder := aFamixMetamodelGenerator builder.
	packageName := aFamixMetamodelGenerator packageNameForVisitor
]

{ #category : #generating }
FamixVisitorGenerator >> define [

	| visitorTrait |
	visitorTrait := builder newVisitorTrait.
	visitorTrait packageName: packageName.

	builder allSubBuilders do: [ :subBuilder |
		subBuilder extensionBehaviors
			detect: [ :each | each isVisitorTrait ]
			ifFound: [ :famixTVistior | visitorTrait --|> famixTVistior ] ]
]
