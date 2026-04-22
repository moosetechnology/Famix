"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `templates` | `FamixTWithTemplates` | `templateOwner` | `FamixTTemplate` | |



"
Trait {
	#name : 'FamixTWithTemplates',
	#instVars : [
		'#templates => FMMany type: #FamixTTemplate opposite: #templateOwner'
	],
	#category : 'Famix-Traits-Template',
	#package : 'Famix-Traits',
	#tag : 'Template'
}

{ #category : 'meta' }
FamixTWithTemplates classSide >> annotation [

	<FMClass: #TWithTemplates super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : 'visitor' }
FamixTWithTemplates >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithTemplates: self
]

{ #category : 'accessing' }
FamixTWithTemplates >> addTemplate: anObject [
	templates add: anObject

]

{ #category : 'accessing' }
FamixTWithTemplates >> templates [
	"Relation named: #templates type: #FamixTTemplate opposite: #templateOwner"

	<generated>
	<derived>
	^ templates
]

{ #category : 'accessing' }
FamixTWithTemplates >> templates: anObject [

	<generated>
	templates value: anObject
]

{ #category : 'navigation' }
FamixTWithTemplates >> templatesGroup [
	<generated>
	<navigation: 'Templates'>
	^ MooseSpecializedGroup withAll: self templates asSet
]
