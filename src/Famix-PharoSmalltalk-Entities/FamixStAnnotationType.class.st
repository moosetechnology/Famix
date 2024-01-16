"
## Relations
======================

### Parents
- Relation: #annotationTypesContainer Type: #FamixTWithAnnotationTypes Opposite: #definedAnnotationTypes Comment: Container in which an AnnotationType may reside
- Relation: #parentPackage Type: #FamixTPackage Opposite: #childEntities Comment: Package containing the entity in the code structure (if applicable)
### Children
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
### Other
- Relation: #instances Type: #FamixTTypedAnnotationInstance Opposite: #annotationType Comment: Annotations of this type


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
