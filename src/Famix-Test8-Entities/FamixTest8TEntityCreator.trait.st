"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest8TEntityCreator',
	#category : 'Famix-Test8-Entities-Model',
	#package : 'Famix-Test8-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest8TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test8-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newAnimal [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8Animal new
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newBacteria [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8Bacteria new
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newBiotope [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8Biotope new
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newInfection [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8Infection new
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newLivingBeing [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8LivingBeing new
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newPlant [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8Plant new
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newResidence [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8Residence new
]

{ #category : 'entity creation' }
FamixTest8TEntityCreator >> newVirus [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest8Virus new
]
