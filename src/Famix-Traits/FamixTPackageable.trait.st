"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentPackage` | `FamixTPackageable` | `childEntities` | `FamixTPackage` | Package containing the entity in the code structure (if applicable)|



"
Trait {
	#name : 'FamixTPackageable',
	#instVars : [
		'#parentPackage => FMOne type: #FamixTPackage opposite: #childEntities'
	],
	#category : 'Famix-Traits-Package',
	#package : 'Famix-Traits',
	#tag : 'Package'
}

{ #category : 'meta' }
FamixTPackageable classSide >> annotation [

	<FMClass: #TPackageable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'visitor' }
FamixTPackageable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTPackageable: self
]

{ #category : 'accessing' }
FamixTPackageable >> isExtension [

	^ (self belongsTo containersOfType: FamixTPackage) ~= (self containersOfType: FamixTPackage)
]

{ #category : 'accessing' }
FamixTPackageable >> parentPackage [
	"Relation named: #parentPackage type: #FamixTPackage opposite: #childEntities"

	<generated>
	<FMComment: 'Package containing the entity in the code structure (if applicable)'>
	<container>
	^ parentPackage
]

{ #category : 'accessing' }
FamixTPackageable >> parentPackage: anObject [

	<generated>
	parentPackage := anObject
]
