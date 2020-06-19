"
Description
--------------------

Result of a navigation query for the outgoing associations of an entity.
"
Class {
	#name : #MooseOutgoingQueryResult,
	#superclass : #MooseQueryResult,
	#traits : 'TDependencyQueryResult',
	#classTraits : 'TDependencyQueryResult classTrait',
	#category : #'Moose-Query-Results'
}

{ #category : #filtering }
MooseOutgoingQueryResult >> allWithAnyScope: aCollectionOfFamixClasses [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into:
					[ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext recursivelyScopes: aCollectionOfFamixClasses) during: [ ((self opposite: dep) withScopeIn: res) asSet ] ])
				asSet
]

{ #category : #filtering }
MooseOutgoingQueryResult >> allWithScope: aClassFamix [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into: [ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext recursivelyScope: aClassFamix direction: MooseQueryScopeAllStrategy) during: [ (self opposite: dep) withScopeIn: res ] ]) asSet
]

{ #category : #private }
MooseOutgoingQueryResult >> opposite: aDependency [
	^ aDependency target
]

{ #category : #filtering }
MooseOutgoingQueryResult >> withAnyScope: aCollectionOfFamixClasses [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into:
					[ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext scopes: aCollectionOfFamixClasses direction: MooseQueryScopeAllStrategy) during: [ (self opposite: dep) withScopeIn: res ] ])
				asSet
]

{ #category : #filtering }
MooseOutgoingQueryResult >> withScope: aClassFamix [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into: [ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext scope: aClassFamix direction: MooseQueryScopeAllStrategy) during: [ (self opposite: dep) withScopeIn: res ] ]) asSet
]
