Extension { #name : #FamixMetamodelBuilder }

{ #category : #'*Famix-Visitor' }
FamixMetamodelBuilder >> newVisitorTrait [

	| visitorTrait |
	self traits
		detect: [ :each |
		each fullName = (self configuration prefix , #TVisitor) ]
		ifFound: [ FmxMBEntityAlreadyExists signal ].

	visitorTrait := FmxMBVisitorTrait new.
	visitorTrait builder: self.
	visitorTrait prefix: self configuration prefix.

	extensionBehaviors add: visitorTrait.
	^ visitorTrait
]
