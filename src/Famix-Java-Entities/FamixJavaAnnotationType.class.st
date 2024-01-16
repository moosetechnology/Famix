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

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `implementations` | `FamixTImplementation` | `interface` | Implementation relationships.|
| `subInheritances` | `FamixTInheritance` | `superclass` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Type | Opposite | Comment |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `instances` | `FamixTTypedAnnotationInstance` | `annotationType` | Annotations of this type|


## Properties
======================

| Name | Type | Comment |
| `visibility` | String | Visibility of the entity|

"
Class {
	#name : #FamixJavaAnnotationType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTAnnotationType + FamixTHasVisibility + FamixTImplementable + FamixTPackageable + FamixTWithAttributes + FamixTWithComments + FamixTWithInheritances',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTHasVisibility classTrait + FamixTImplementable classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithInheritances classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'accessing-query' }
FamixJavaAnnotationType >> annotatedEntities [
	^ self instances collect: [:each | each annotatedEntity ]
]

{ #category : #'accessing-query' }
FamixJavaAnnotationType >> annotatedEntitiesGroup [
	<navigation: 'Annotated entities'>
	^ self annotatedEntities asMooseGroup
]

{ #category : #accessing }
FamixJavaAnnotationType >> typeContainer [

	^ self annotationTypesContainer
]

{ #category : #accessing }
FamixJavaAnnotationType >> typeContainer: anObject [

	^ self annotationTypesContainer: anObject
]
