"
I am responsible for the generation of a visitor trait when generating a Famix metamodel.
See `FamixVisitorGenerator`.
"
Class {
	#name : 'FmxMBVisitorTrait',
	#superclass : 'FmxMBTrait',
	#category : 'Famix-Visitor-Generation-MetamodelBuilder',
	#package : 'Famix-Visitor-Generation',
	#tag : 'MetamodelBuilder'
}

{ #category : 'visitor' }
FmxMBVisitorTrait >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitVisitor: self
]

{ #category : 'accessing' }
FmxMBVisitorTrait >> comment [

	^ 'I am a visitor for {1}Entities. 
I am generated with the metamodel.' format: { self prefix }
]

{ #category : 'initialization' }
FmxMBVisitorTrait >> initialize [

	super initialize.
	name := #TVisitor.
	tag := 'Visitor'
]

{ #category : 'testing' }
FmxMBVisitorTrait >> isVisitorTrait [

	^ true
]
