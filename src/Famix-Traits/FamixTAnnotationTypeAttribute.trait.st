"
This models the attribute defined in a Java AnnotationType. In Java, annotation type attributes have specific syntax and use.

For example, in Java the following AnnotationType has four AnnotationTypeAttributes (id, synopsis, engineer and date are attributes).

public @interface MyAnno {
    int    id();
    String synopsis(); 
    String engineer() default ""[unassigned]""; 
    String date()    default ""[unimplemented]"";
}

When using an annotation, an annotation instance is created that points back to the annotation type. The annotation instance has attributes that are annontation instance attributes and point back to their annotation type attributes.

Instance Variables:
	parentAnnotationType	<FamixTAnnotationType>
	annotationAttributeInstances	<(FMMultivalueLink of: FamixTAnnotationInstanceAttribute)>

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentType` | `FamixTAttribute` | `attributes` | `FamixTWithAttributes` | Type declaring the attribute. belongsTo implementation|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationAttributeInstances` | `FamixTAnnotationTypeAttribute` | `annotationTypeAttribute` | `FamixTAnnotationInstanceAttribute` | A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTAnnotationTypeAttribute,
	#instVars : [
		'#annotationAttributeInstances => FMMany type: #FamixTAnnotationInstanceAttribute opposite: #annotationTypeAttribute'
	],
	#traits : 'FamixTAttribute',
	#classTraits : 'FamixTAttribute classTrait',
	#category : #'Famix-Traits-AnnotationTypeAttribute'
}

{ #category : #meta }
FamixTAnnotationTypeAttribute classSide >> annotation [

	<FMClass: #TAnnotationTypeAttribute super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTAnnotationTypeAttribute >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTAnnotationTypeAttribute: self
]

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> addAnnotationAttributeInstance: anObject [
	annotationAttributeInstances add: anObject

]

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> annotationAttributeInstances [
	"Relation named: #annotationAttributeInstances type: #FamixTAnnotationInstanceAttribute opposite: #annotationTypeAttribute"

	<generated>
	<FMComment: 'A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances'>
	<derived>
	^ annotationAttributeInstances
]

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> annotationAttributeInstances: anObject [

	<generated>
	annotationAttributeInstances value: anObject
]
