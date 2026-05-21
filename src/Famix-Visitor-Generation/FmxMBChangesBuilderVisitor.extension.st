Extension { #name : 'FmxMBChangesBuilderVisitor' }

{ #category : '*Famix-Visitor-Generation' }
FmxMBChangesBuilderVisitor >> generateVisitMethodsIn: aTrait [

	| localBehaviorsToVisit remoteTraits |
	localBehaviorsToVisit := (builder classes select: #isClassEntity) , (builder traits select: #isTraitEntity).

	localBehaviorsToVisit do: [ :fmxMBBehavior | self addMethod: (self methodFactory visitBehavioral: fmxMBBehavior builder: builder) protocol: #visiting ].

	remoteTraits := localBehaviorsToVisit flatCollect: [ :class | class allTransitiveTraits select: #isRemote ] as: Set.

	remoteTraits do: [ :fmxMBBehavior | self addMethod: (self methodFactory visitBehavioral: fmxMBBehavior builder: builder) protocol: #visiting ]
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBChangesBuilderVisitor >> visitVisitor: aTrait [

	super visitVisitor: aTrait.

	aTrait allLocalTraits ifEmpty: [
			self addMethod: self methodFactory visitEntity protocol: #visiting.
			self addMethod: self methodFactory visitCollection protocol: #visiting ].

	self generateVisitMethodsIn: aTrait
]
