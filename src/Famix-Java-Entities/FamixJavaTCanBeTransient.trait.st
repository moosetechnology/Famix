"
I allow an entity to be transient
ex:

```java
public class Student implements Serializable{  
 transient int age; //Now it will not be serialized  
}  
```

## Properties
======================

- Named: #isTransient Type: Boolean Comment: Entity can be declared transient

"
Trait {
	#name : #FamixJavaTCanBeTransient,
	#instVars : [
		'#isTransient => FMProperty defaultValue: false'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTCanBeTransient classSide >> annotation [

	<FMClass: #TCanBeTransient super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaTCanBeTransient >> isTransient [

	<FMProperty: #isTransient type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared transient'>
	^ isTransient ifNil: [ isTransient := false ]
]

{ #category : #accessing }
FamixJavaTCanBeTransient >> isTransient: anObject [
	<generated>
	isTransient := anObject
]
