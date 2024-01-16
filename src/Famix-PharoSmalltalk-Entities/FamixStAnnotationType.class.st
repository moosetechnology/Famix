"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `annotationTypesContainer` | `FamixTWithAnnotationTypes` | `definedAnnotationTypes` | Container in which an AnnotationType may reside|
| `parentPackage` | `FamixTPackage` | `childEntities` | Package containing the entity in the code structure (if applicable)|

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|

### Other
| Relation | Type | Opposite | Comment |
| `instances` | `FamixTTypedAnnotationInstance` | `annotationType` | Annotations of this type|



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
