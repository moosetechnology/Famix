"
I am an extension for FamixMetamodelBuidler.
I am responsible for the creation of a Visitor trait and the #accept: method in each entity of the metamodel.
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
			detect: [ :each | each name = #TVisitor ]
			ifFound: [ :famixTVistior | visitorTrait --|> famixTVistior ] ]
]
