"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationTypesContainer` | `FamixTAnnotationType` | `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | Container in which an AnnotationType may reside|
| `parentPackage` | `FamixTPackageable` | `childEntities` | `FamixTPackage` | Package containing the entity in the code structure (if applicable)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTTypeArgument` | `typeArgument` | `FamixTConcretization` | Concretizations where this type is the type argument.|
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implementations` | `FamixTImplementable` | `interface` | `FamixTImplementation` | Implementation relationships.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `instances` | `FamixTAnnotationType` | `annotationType` | `FamixTAnnotationInstance` | Annotations of this type|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `visibility` | `String` | nil | Visibility of the entity|

"
Class {
	#name : #FamixJavaAnnotationType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTAnnotationType + FamixTHasVisibility + FamixTImplementable + FamixTPackageable + FamixTTypeArgument + FamixTWithAttributes + FamixTWithComments + FamixTWithInheritances',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTHasVisibility classTrait + FamixTImplementable classTrait + FamixTPackageable classTrait + FamixTTypeArgument classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithInheritances classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixJavaAnnotationType >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaAnnotationType: self
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
