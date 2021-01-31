# frozenpants

[Pants](https://github.com/pantsbuild/pants) is a scalable build system that works well for monorepos.

The default ./pants wrapper for building a project is a bootstrap script.  That script goes and downloads pants and its dependencies from the internet (by default).  

Those dependencies or their transitive dependencies can break, as individual maintainers update their own projects.

Those breaks can be frustrating to debug, especially since developers collaborating on a project may have different dependencies already cached, or run different operating systems.


The goal of frozenpants is to create a toolset and default distribution for building the pants tool itself just once, and then distributing it as a stable and fully self-contained version.