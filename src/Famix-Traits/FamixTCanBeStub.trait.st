"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Trait {
	#name : #FamixTCanBeStub,
	#instVars : [
		'#isStub => FMProperty defaultValue: false'
	],
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-Traits-PrimitiveProperties'
}

{ #category : #meta }
FamixTCanBeStub classSide >> annotation [

	<FMClass: #TCanBeStub super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTCanBeStub >> isStub [

	<FMProperty: #isStub type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub ifNil: [ isStub := false ]
]

{ #category : #accessing }
FamixTCanBeStub >> isStub: anObject [
	<generated>
	isStub := anObject
]
