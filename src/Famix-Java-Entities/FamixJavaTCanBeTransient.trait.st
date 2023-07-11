"
I allow an entity to be transient
ex:

```java
public class Student implements Serializable{  
 transient int age; //Now it will not be serialized  
}  
```
"
Trait {
	#name : #FamixJavaTCanBeTransient,
	#instVars : [
		'#isTransient => FMProperty'
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

	<FMProperty: #isTransient type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared transient'>
	^ isTransient
]

{ #category : #accessing }
FamixJavaTCanBeTransient >> isTransient: anObject [
	<generated>
	isTransient := anObject
]
