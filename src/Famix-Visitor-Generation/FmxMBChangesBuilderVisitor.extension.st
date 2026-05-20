Extension { #name : 'FmxMBChangesBuilderVisitor' }

{ #category : '*Famix-Visitor-Generation' }
FmxMBChangesBuilderVisitor >> generateVisitMethodsIn: aTrait [

	| localBehaviorsToVisit remoteTraits |
	localBehaviorsToVisit := (builder classes select: #isClassEntity) , (builder traits select: #isTraitEntity).

	localBehaviorsToVisit do: [ :fmxMBBehavior |
			| protocol |
			self addMethod: (self methodFactory visitBehavioral: fmxMBBehavior) protocol: #visiting.

			protocol := aTrait packageName == builder configuration packageName
				            ifTrue: [ #visitor ]
				            ifFalse: [ '*' , aTrait packageName ].

			self addMethod: (self methodFactory acceptFor: fmxMBBehavior fullName) in: fmxMBBehavior fullName protocol: protocol ].

	remoteTraits := localBehaviorsToVisit flatCollect: [ :class | class allTransitiveTraits select: #isRemote ] as: Set.

	"remoteTraits do: [ :fmxMBBehavior |
			| protocol |
			self addMethod: (self methodFactory visitBehavioral: fmxMBBehavior) protocol: #visiting.

			protocol := aTrait packageName == builder configuration packageName
				            ifTrue: [ #visitor ]
				            ifFalse: [ '*' , aTrait packageName ].

			self addMethod: (self methodFactory acceptFor: fmxMBBehavior fullName) in: fmxMBBehavior fullName protocol: protocol ]"
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBChangesBuilderVisitor >> visitVisitor: aTrait [

	super visitVisitor: aTrait.

	aTrait allLocalTraits ifEmpty: [
			self addMethod: self methodFactory visitEntity protocol: #visiting.
			self addMethod: self methodFactory visitCollection protocol: #visiting ].

	self generateVisitMethodsIn: aTrait
]
