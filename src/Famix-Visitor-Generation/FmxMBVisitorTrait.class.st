"
I am responsible for the generation of a visitor trait when generating a Famix metamodel.

I will generate a visitor that is ""Top down"" and not ""Bottom up"". This means that the visit should start from the top entities and will propagate in the children. 

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
