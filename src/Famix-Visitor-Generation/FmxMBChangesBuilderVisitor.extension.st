Extension { #name : 'FmxMBChangesBuilderVisitor' }

{ #category : '*Famix-Visitor-Generation' }
FmxMBChangesBuilderVisitor >> visitVisitor: aTrait [

	super visitVisitor: aTrait.

	aTrait allLocalTraits ifEmpty: [
			self addMethod: self methodFactory visitEntity protocol: #visiting.
			self addMethod: self methodFactory visitCollection protocol: #visiting ].

	(builder classes select: #isClassEntity) , (builder traits select: [ :fmxTrait | fmxTrait isMetamodelTrait and: [ fmxTrait isVisitorTrait not ] ]) do: [
			:fmxMBBehavior |
			| protocol |
			self addMethod: (self methodFactory visitBehavioral: fmxMBBehavior) protocol: #visiting.

			protocol := aTrait packageName == builder configuration packageName
				            ifTrue: [ #visitor ]
				            ifFalse: [ '*' , aTrait packageName ].

			self addMethod: (self methodFactory acceptFor: fmxMBBehavior fullName) in: fmxMBBehavior fullName protocol: protocol ]
]
