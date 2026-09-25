"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `templateOwner` | `FamixTTemplate` | `templates` | `FamixTWithTemplates` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `templateUsers` | `FamixTTemplate` | `template` | `FamixTTemplateUser` | |



"
Trait {
	#name : 'FamixTTemplate',
	#instVars : [
		'#templateOwner => FMOne type: #FamixTWithTemplates opposite: #templates',
		'#templateUsers => FMMany type: #FamixTTemplateUser opposite: #template'
	],
	#category : 'Famix-Traits-Template',
	#package : 'Famix-Traits',
	#tag : 'Template'
}

{ #category : 'meta' }
FamixTTemplate classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTemplate super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTTemplate >> addTemplateUser: anObject [

	templateUsers add: anObject

]

{ #category : 'accessing' }
FamixTTemplate >> templateOwner [
	"Relation named: #templateOwner type: #FamixTWithTemplates opposite: #templates"

	<ignoreForCoverage>
	<generated>
	<container>
	^ templateOwner
]

{ #category : 'accessing' }
FamixTTemplate >> templateOwner: anObject [

	<ignoreForCoverage>
	<generated>
	templateOwner := anObject
]

{ #category : 'accessing' }
FamixTTemplate >> templateUsers [
	"Relation named: #templateUsers type: #FamixTTemplateUser opposite: #template"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ templateUsers
]

{ #category : 'accessing' }
FamixTTemplate >> templateUsers: anObject [

	<ignoreForCoverage>
	<generated>
	templateUsers value: anObject
]
