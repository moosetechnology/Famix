"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `template` | `FamixTTemplateUser` | `templateUsers` | `FamixTTemplate` | |



"
Trait {
	#name : 'FamixTTemplateUser',
	#instVars : [
		'#template => FMOne type: #FamixTTemplate opposite: #templateUsers'
	],
	#category : 'Famix-Traits-Template',
	#package : 'Famix-Traits',
	#tag : 'Template'
}

{ #category : 'meta' }
FamixTTemplateUser classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTemplateUser super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTTemplateUser >> template [
	"Relation named: #template type: #FamixTTemplate opposite: #templateUsers"

	<ignoreForCoverage>
	<generated>
	^ template
]

{ #category : 'accessing' }
FamixTTemplateUser >> template: anObject [

	<ignoreForCoverage>
	<generated>
	template := anObject
]
