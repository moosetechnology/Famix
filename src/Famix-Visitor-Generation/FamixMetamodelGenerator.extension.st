Extension { #name : #FamixMetamodelGenerator }

{ #category : #'*Famix-Visitor-Generation' }
FamixMetamodelGenerator class >> packageNameForVisitor [
	"Override to define a package name for a visitor.
	Examples: see overriding methods  "

	<ignoreForCoverage>
	self shouldBeImplemented
]

{ #category : #'*Famix-Visitor-Generation' }
FamixMetamodelGenerator >> packageNameForVisitor [

	^ self class packageNameForVisitor
]
