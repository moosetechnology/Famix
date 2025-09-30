Extension { #name : 'MooseQuery' }

{ #category : '*Famix-Deprecated' }
MooseQuery >> ancestors [

	self deprecated: 'Use #containers instead' transformWith: '`@rcv ancestors' -> '`@rcv containers'.
	^ self containers
]

{ #category : '*Famix-Deprecated' }
MooseQuery >> descendants [

	self deprecated: 'Use #containedEntities instead' transformWith: '`@rcv descendants' -> '`@rcv containedEntities'.
	^ self containedEntities
]

{ #category : '*Famix-Deprecated' }
MooseQuery >> lineage [

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ MQScopeQuery new
		  receiver: receiver;
		  direction: MQScopeAllStrategy;
		  yourself
]
