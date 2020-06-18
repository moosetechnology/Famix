"
Description
--------------------

Result of a navigation query for the incoming associations of an entity.
"
Class {
	#name : #MooseIncomingQueryResult,
	#superclass : #MooseQueryResult,
	#traits : 'TDependencyQueryResult',
	#classTraits : 'TDependencyQueryResult classTrait',
	#category : #'Moose-Query-Results'
}

{ #category : #filtering }
MooseIncomingQueryResult >> allWithAnyScope: aCollectionOfFamixClasses [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into:
					[ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext recursivelyScopes: aCollectionOfFamixClasses) during: [ ((self opposite: dep) privateWithScopeIn: res) asSet ] ])
				asSet
]

{ #category : #filtering }
MooseIncomingQueryResult >> allWithScope: aClassFamix [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into: [ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext recursivelyScope: aClassFamix direction: MooseQueryScopeAllStrategy) during: [ (self opposite: dep) privateWithScopeIn: res ] ]) asSet
]

{ #category : #private }
MooseIncomingQueryResult >> opposite: aDependency [
	^ aDependency source
]

{ #category : #filtering }
MooseIncomingQueryResult >> withAnyScope: aCollectionOfFamixClasses [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into:
					[ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext scopes: aCollectionOfFamixClasses direction: MooseQueryScopeAllStrategy) during: [ (self opposite: dep) privateWithScopeIn: res ] ])
				asSet
]

{ #category : #filtering }
MooseIncomingQueryResult >> withScope: aClassFamix [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into: [ :res :dep | MooseQueryCurrentContext value: (MooseQueryContext scope: aClassFamix direction: MooseQueryScopeAllStrategy) during: [ (self opposite: dep) privateWithScopeIn: res ] ]) asSet
]
