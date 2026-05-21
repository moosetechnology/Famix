Extension { #name : 'FmxMBMethodsFactory' }

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> acceptFor: aName [

	^ 'accept: aVisitor

	<generated>
	^ aVisitor visit{1}: self' format: { aName }
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> visitBehavioral: aBehavioral builder: aBuilder [

	^ String streamContents: [ :aStream |
			  | parameter |
			  parameter := 'a' , aBehavioral fullName.
			  aStream << ('visit{1}: {2}

	<generated>
' format: {
					   aBehavioral fullName.
					   parameter }).

			  aBehavioral behaviorsToVisit
				  do: [ :behavior | "In case we generate the behaviors to visit of a trait, we might reject the visit for some implementors because their superclasses might already visit those behaviors."
						  aBehavioral isTraitEntity
							  ifTrue: [
									  | concreteUsers |
									  concreteUsers := aBuilder concreteClasses select: [ :class | class allTransitiveTraits includes: aBehavioral ].
									  (concreteUsers select: [ :user | (user allSuperclasses flatCollectAsSet: #allTransitiveTraits) includes: behavior ])
										  ifEmpty: [
												  aStream << ('	self visit{1}: {2}' format: {
																   behavior fullName.
																   parameter }) ]
										  ifNotEmpty: [ :usersToReject |
												  concreteUsers size = usersToReject size
													  ifTrue: [
															  aStream
																  nextPutAll: '	"We should visit ';
																  nextPutAll: behavior fullName;
																  nextPutAll: ' but all its users in this language already visit it in their superclasses so we skip the call here."' ]
													  ifFalse: [
															  aStream
																  tab;
																  nextPutAll: '"We do not visit all behaviorals because some classes already visit it in their superclasses in this language implementation. Visiting them here also would cause a double visit of this trait."';
																  cr;
																  tab;
																  nextPutAll: '({ '.
															  usersToReject do: [ :user | aStream nextPutAll: user fullName ] separatedBy: [ aStream nextPutAll: ' . ' ].
															  aStream
																  nextPutAll: ' } includes: ';
																  nextPutAll: parameter;
																  nextPutAll: ' class)
		ifFalse: [ self visit';
																  nextPutAll: behavior fullName;
																  nextPutAll: ': ';
																  nextPutAll: parameter;
																  nextPutAll: ' ]' ] ] ]
							  ifFalse: [
									  aStream << ('	self visit{1}: {2}' format: {
											   behavior fullName.
											   parameter }) ] ]
				  separatedBy: [
						  aStream
							  << '.';
							  cr ];
				  ifNotEmpty: [
						  aBehavioral relations ifNotEmpty: [
								  aStream
									  << $.;
									  cr;
									  cr ] ].
			  (aBehavioral relations reject: #isContainer)
				  do: [ :relation |
						  aStream << ('	self visit{1}: {2} {3}' format: {
								   (relation isOne
									    ifTrue: [ 'Entity' ]
									    ifFalse: [ 'Collection' ]).
								   parameter.
								   relation name }) ]
				  separatedBy: [
						  aStream
							  << $.;
							  cr ] ]
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> visitCollection [

	^ 'visitCollection: aCollection

	<generated>
	^ aCollection collect: [ :each | each accept: self ]'
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBMethodsFactory class >> visitEntity [

	^ 'visitEntity: aFamixEntity

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]'
]
