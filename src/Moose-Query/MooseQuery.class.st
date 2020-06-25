"
Description
--------------------

I am a class used to creat and execute MooseQuery queries. 

I allow the use of a DSL for scoping and navigation queries. 

Queries should start my sending `query` to an entity. For example: 

```st
method query
```

Then they are composed of 3 parts:
- A message to initialize a scope or navigation query
- A list of options
- A final message to execute the query

Scope queries
--------------------

Scope queries have 3 different messages to initialize them:

```st
	method query ancestors.	""Launches a scope up query""
	method query descendants. 	""Launches a scope down query""
	method query lineage.		""Launches a scope up and down query""
```

Then the query has different parameters:

```st
	method query ancestors recursively. ""With #recursively, the scope query will not stop at the first result found but proceed in checking for more results higher and lower in the containment DAG. Withtout the option, we stop at the first ancestors/descendents we find.""
	method query ancestors until: #isClass. ""With #until: it is possible to add a stop condition to the scope query.""
```

Last, you can have a parameter that will finish to configure and execute the query:

```st
	method ancestors ofType: FamixTClass. ""ofType: will select the ancestors/descendents matching the kind in parameter.""
	method ancestors ofAnyTypes: { FamixTClass . FamixTNamespace }. ""ofAnyTypes: will select the ancestors/descendents matching any kind in parameter.""
	method ancestors ofAnyType. ""Select all ancestors independently of the type.""
```

More examples:

```st
	method := model allModelMethods anyOne.

	method query ancestors ofType: FamixTNamespace.
	method query ancestors recursively ofType: FamixTNamespace.
	method query ancestors recursively ofAnyTypes: {FamixTNamespace . FamixTClass}.
	(method query ancestors recursively until: #isClass) ofAnyTypes: {FamixTNamespace . FamixTClass}.

	method query descendants recursively ofType: FamixTNamespace.
	(method query descendants recursively until: #isClass) ofAnyTypes: {FamixTNamespace . FamixTClass}.

	method query lineage recursively ofType: FamixTNamespace.
	(method query lineage recursively until: #isClass) ofAnyTypes: {FamixTNamespace . FamixTClass}.
```

Navigation queries
--------------------

Navigation queries have 3 different messages to initialize them:

```st
	method query has.	""Launches a navigation query checking the presence of dependencies instead of collecting a result.""
	method query incoming. 	""Launches a navigation query in the incoming direction.""
	method query outgoing.		""Launches a navigation query in the outgoing direction.""
```

Then the query has different parameters.

Some parameters act as the parameters to launch the queries.

```st
	method query has incoming. 	""Define that the query will check incoming dependencies.""
	method query has outgoing. 	""Define that the query will check outgoing dependencies.""
	method query icoming has. ""Define that the incoming or outgoing query needs to check the presence of dependencies instean of collectiong a result.""
```

You can also choose if you want to check dependencies only locally or also in children.

```st
	method query incoming local. ""Without the parameter #local, the query will check the children. With #local, the query will only check the dependencies of a specific entity and not its children.""
```

By default the queries will return a collection of associations (if the parameters #has is not passed). You can change this to collect the entities at the opposite of the association instead:

```st
	method query incoming objects.
```

Last, you can have a parameter that will finish to configure and execute the query:

```st
	method ancestors dependencies. ""Will select all kinds of dependencies.""
	method ancestors dependenciesOfType: FamixTReference. ""Will select the dependencies of the type passed has parameter.""
	method ancestors dependenciesOfAnyTypes: { FamixTReference . FamixTInvocation }. ""Will select the dependencies whose types are present in the collection of types in parameter.""
```

More examples:

```st
	method := model allModelMethods anyOne.

	method query incoming dependencies.
	method query incoming dependenciesOfType: FamixTReference.
	method query incoming local dependenciesOfType: FamixTReference.
	method query incoming local object dependenciesOfType: FamixTReference.
	method query incoming local object dependenciesOfAnyTypes: { FamixTReference . FamixTInvocation }.
	
	method query outgoing local object dependenciesOfType: FamixTReference.
	
	method query has incoming local object dependenciesOfAnyTypes: { FamixTReference . FamixTInvocation }.
	
```



"
Class {
	#name : #MooseQuery,
	#superclass : #Object,
	#instVars : [
		'receiver'
	],
	#category : #'Moose-Query-Core'
}

{ #category : #'instance creation' }
MooseQuery class >> receiver: anEntity [
	^ self new
		receiver: anEntity;
		yourself
]

{ #category : #scoping }
MooseQuery >> ancestors [
	^ MQScopeQuery new
		receiver: receiver;
		direction: MQScopeUpStrategy;
		yourself
]

{ #category : #scoping }
MooseQuery >> descendants [
	^ MQScopeQuery new
		receiver: receiver;
		direction: MQScopeDownStrategy;
		yourself
]

{ #category : #navigation }
MooseQuery >> has [
	^ MQNavigationQuery new
		receiver: receiver;
		resultKindStrategy: MQNavigationHasDependencyBooleanKindStrategy;
		yourself
]

{ #category : #navigation }
MooseQuery >> incoming [
	^ (MQNavigationQuery directionStrategy: MQNavigationIncomingDirectionStrategy)
		receiver: receiver;
		yourself
]

{ #category : #scoping }
MooseQuery >> lineage [
	^ MQScopeQuery new
		receiver: receiver;
		direction: MQScopeAllStrategy;
		yourself
]

{ #category : #navigation }
MooseQuery >> navigation: aSymbol [
	^ (MQNavigationQuery direction: aSymbol)
		receiver: receiver;
		yourself
]

{ #category : #navigation }
MooseQuery >> outgoing [
	^ (MQNavigationQuery directionStrategy: MQNavigationOutgoingDirectionStrategy)
		receiver: receiver;
		yourself
]

{ #category : #accessing }
MooseQuery >> receiver [
	^ receiver
]

{ #category : #accessing }
MooseQuery >> receiver: anObject [
	receiver := anObject
]
