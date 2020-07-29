Extension { #name : #TEntityMetaLevelDependency }

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryAllIncomingAssociations [
	"Be careful while using me. I hardcode the associations I should query. Users can override me if they want to query only certain types of association for performance reasons. If you prefere to be sure of your results you should use #queryAllIncoming instead."

	^ self queryStaticIncomingAssociations
		addAll: self queryAllIncomingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryAllIncomingInvocations [
	^ self queryIncoming: FamixTInvocation
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryAllOutgoingAssociations [
	"Be careful while using me. I hardcode the associations I should query. Users can override me if they want to query only certain types of association for performance reasons. If you prefere to be sure of your results you should use #queryAllOutgoing instead."

	^ self queryStaticOutgoingAssociations
		addAll: self queryAllOutgoingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryAllOutgoingInvocations [
	^ self queryOutgoing: FamixTInvocation
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryIncomingAccesses [
	^ self queryIncoming: FamixTAccess
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryIncomingReferences [
	^ self queryIncoming: FamixTReference
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryOutgoingAccesses [
	^ self queryOutgoing: FamixTAccess
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryOutgoingReferences [
	^ self queryOutgoing: FamixTReference
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryStaticIncomingAssociations [
	^ self queryIncomingAccesses
		addAll: self queryIncomingReferences;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> queryStaticOutgoingAssociations [
	^ self queryOutgoingAccesses
		addAll: self queryOutgoingReferences;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> querySureIncomingAssociations [
	^ self queryStaticIncomingAssociations
		addAll: self querySureIncomingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> querySureIncomingInvocations [
	^ self queryAllIncomingInvocations select: [ :invo | invo isASureInvocation ]
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> querySureOutgoingAssociations [
	^ self queryStaticOutgoingAssociations
		addAll: self querySureOutgoingInvocations;
		yourself
]

{ #category : #'*Moose-Query-Extensions' }
TEntityMetaLevelDependency >> querySureOutgoingInvocations [
	^ self queryAllOutgoingInvocations select: [ :invo | invo isASureInvocation ]
]
