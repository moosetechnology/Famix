Extension { #name : 'FamixTWithInheritances' }

{ #category : '*Famix-Deprecated' }
FamixTWithInheritances >> withSuperclassHierarchyGroup [

	self deprecated:
		'This method was used in old Moose interfaces but is not used anymore and is probably dead code. If you use it, contact the Moose team to ask the removal of the deprecation.'.

	^ MooseGroup withAll: self withSuperclassHierarchy asSet withDescription: 'With all superclasses of ' , self mooseName
]
