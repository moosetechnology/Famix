"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentModule` | `FamixTDefinedInModule` | `moduleEntities` | `FamixTModule` | Module that contains the definition of this entity|



"
Trait {
	#name : #FamixTDefinedInModule,
	#instVars : [
		'#parentModule => FMOne type: #FamixTModule opposite: #moduleEntities'
	],
	#category : #'Famix-Traits-Module'
}

{ #category : #meta }
FamixTDefinedInModule classSide >> annotation [

	<FMClass: #TDefinedInModule super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTDefinedInModule >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTDefinedInModule: self
]

{ #category : #accessing }
FamixTDefinedInModule >> parentModule [
	"Relation named: #parentModule type: #FamixTModule opposite: #moduleEntities"

	<generated>
	<FMComment: 'Module that contains the definition of this entity'>
	<container>
	^ parentModule
]

{ #category : #accessing }
FamixTDefinedInModule >> parentModule: anObject [

	<generated>
	parentModule := anObject
]

{ #category : #navigation }
FamixTDefinedInModule >> parentModuleGroup [
	<generated>
	<navigation: 'ParentModule'>
	^ MooseSpecializedGroup with: self parentModule
]
