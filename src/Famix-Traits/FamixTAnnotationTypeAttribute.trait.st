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
- Relation: #parentType Type: #FamixTWithAttributes Opposite: #attributes Comment: Type declaring the attribute. belongsTo implementation
### Incomming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #annotationAttributeInstances Type: #FamixTTypedAnnotationInstanceAttribute Opposite: #annotationTypeAttribute Comment: A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Trait {
	#name : #FamixTAnnotationTypeAttribute,
	#instVars : [
		'#annotationAttributeInstances => FMMany type: #FamixTTypedAnnotationInstanceAttribute opposite: #annotationTypeAttribute'
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

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> addAnnotationAttributeInstance: anObject [
	annotationAttributeInstances add: anObject

]

{ #category : #accessing }
FamixTAnnotationTypeAttribute >> annotationAttributeInstances [
	"Relation named: #annotationAttributeInstances type: #FamixTTypedAnnotationInstanceAttribute opposite: #annotationTypeAttribute"

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
