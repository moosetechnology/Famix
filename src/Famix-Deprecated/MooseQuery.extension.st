Extension { #name : 'MooseQuery' }

{ #category : '*Famix-Deprecated' }
MooseQuery >> lineage [

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ MQScopeQuery new
		  receiver: receiver;
		  direction: MQScopeAllStrategy;
		  yourself
]
