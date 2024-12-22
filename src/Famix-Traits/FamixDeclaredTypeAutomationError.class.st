"
This error occurs when sending #declaredType to an object using TTypedEntity that knows no moose model.

If we know the mooseModel, we can automatically create a new type declaration using #newTypeDeclaration.
Here we cannot, so we have at least 2 options: 
	- Set a model: user should know the model class to use.
	- Rewrite the code to add a type declaration manually instead of using #declaredType.
"
Class {
	#name : #FamixDeclaredTypeAutomationError,
	#superclass : #Exception,
	#category : #'Famix-Traits-Type'
}

{ #category : #accessing }
FamixDeclaredTypeAutomationError >> defaultMessageText [

	^ 'This entity has no model. Automatic type declaration is impossible.'
]

{ #category : #accessing }
FamixDeclaredTypeAutomationError >> messageText [

	^ messageText ifNil: [ self defaultMessageText ]
]
