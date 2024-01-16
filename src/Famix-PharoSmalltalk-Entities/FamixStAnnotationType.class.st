"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `annotationTypesContainer` | `FamixTAnnotationType` | `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | Container in which an AnnotationType may reside|
| `parentPackage` | `FamixTPackageable` | `childEntities` | `FamixTPackage` | Package containing the entity in the code structure (if applicable)|

### Children
| Relation | Origin | Opposite | Type | Comment |
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `instances` | `FamixTAnnotationType` | `annotationType` | `FamixTTypedAnnotationInstance` | Annotations of this type|



"
Class {
	#name : #FamixStAnnotationType,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTAnnotationType + FamixTPackageable + FamixTWithAttributes + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #compatibility }
FamixStAnnotationType >> directSubclasses [
	^ OrderedCollection new
]

{ #category : #compatibility }
FamixStAnnotationType >> hierarchyNestingLevel [ 

	^ 1
]
