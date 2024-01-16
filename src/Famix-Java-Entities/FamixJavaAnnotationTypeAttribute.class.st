"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentType` | `FamixTWithAttributes` | `attributes` | Type declaring the attribute. belongsTo implementation|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingAccesses` | `FamixTAccess` | `variable` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Type | Opposite | Comment |
| `annotationAttributeInstances` | `FamixTTypedAnnotationInstanceAttribute` | `annotationTypeAttribute` | A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances|
| `annotationTypeAttribute` | `FamixTAnnotationTypeAttribute` | `annotationAttributeInstances` | This corresponds to the type of the attribute in an AnnotationInstance|
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaAnnotationTypeAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute + FamixTWithComments',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationTypeAttribute class >> annotation [

	<FMClass: #AnnotationTypeAttribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType [
	<FMProperty: #parentAnnotationType type: #FamixJavaAnnotationType> 
	<derived> 
	<FMComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #accessing }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
