# Famix

Famix is an abstract representation of source code. It is generic and can describe applications in multiple programming languages.

  - [Installation](#installation)
  - [Documentation](#documentation)
  - [Version management](#version-management)

## Installation

To install the project on your Pharo image, execute the following script: 

```Smalltalk
Metacello new
  baseline: 'Famix';
  repository: 'github://moosetechnology/Famix:development/src';
  onConflict: [ :ex | ex allow ];
  load.
```

To add the project to your baseline:

```Smalltalk
spec
	baseline: 'Famix'
	with: [ spec repository: 'github://moosetechnology/Famix:development/src' ]
```

Note you can replace the #master by another branch such as #development or a tag such as #v1.0.0, #v1.? or #v1.2.? .

## Documentation

Check out the [Moose wiki](https://modularmoose.org/beginners/install-moose/).

### Metamodel generation

Define entities and relations with the existing generator DSL, then run:

```Smalltalk
MyMetamodelGenerator generate
```

Generation first builds a Fame `FMMetaModel`, then materializes Pharo code and
installs that same description on the generated Moose model class. Changes are
filtered and ordered before application; obsolete generated code is removed and
handwritten code is preserved.

To inspect the description before installing code:

```Smalltalk
metamodel := MyMetamodelGenerator buildMetamodel
```

This does not install classes or methods. The description includes dependencies,
handwritten property annotations, and metamodel extensions included by default.
Famix support methods and helper classes are retained as generation metadata.

An inspected or modified description can be materialized explicitly:

```Smalltalk
FamixFameMaterializer new materialize: metamodel.
MyModel metamodel: metamodel
```

Use the generator's `generate` entry point when applying its configured cleaning
strategy and updating existing model instances.

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.
