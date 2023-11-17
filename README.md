# gdextension

GDExtension template that automatically builds into a self-contained addon for the Godot Asset Library.

### Getting started:
1. Clone this repository (or a new repository with this template) with submodules.
    - `git clone --recurse-submodules https://github.com/nathanfranke/gdextension.git`
    - `cd gdextension`
2. Update to the latest `godot-cpp`.
    - `git submodule update --remote`
2. Build a debug binary for the current platform.
    - `scons`
3. Import, edit, and play `project/` using Godot Engine 4+.
    - `godot --path project/`
4. Check the output:
   ```
   Hello GDScript!
   Hello GDExtension Node!
   Hello GDExtension Singleton!
   ```

### Repository structure:
- `project/` - Godot project boilerplate.
  - `addons/example/` - Files to be distributed to other projects.¹
  - `demo/` - Scenes and scripts for internal testing. Not strictly necessary.
- `src/` - Source code of this extension.
- `godot-cpp/` - Submodule needed for GDExtension compilation.

¹ Before distributing as an addon, all binaries for all platforms must be built and copied to the `bin/` directory. This is done automatically by GitHub Actions.

### Make it your own:
1. Rename `project/addons/example/` and `project/addons/example/example.gdextension`.
2. Replace `LICENSE`, `README.md`, and your code in `src/`.
3. Not required, but consider leaving a note about this template if you found it helpful!

### Distributing your extension on the Godot Asset Library with GitHub Actions:
1. Go to Repository→Actions and download the latest artifact.
2. Test the artifact by extracting the addon into a project.
3. Create a new release on GitHub, uploading the artifact as an asset.
4. On the asset, Right Click→Copy Link to get a direct file URL. Don't use the artifacts directly from GitHub Actions, as they expire.
5. When submitting/updating on the Godot Asset Library, Change "Repository host" to `Custom` and "Download URL" to the one you copied.

## Build

As well as for the engine itself, you will need to configure the [environment](https://docs.godotengine.org/en/4.1/contributing/development/compiling/index.html).
And also you need to apply several patches:

```bash
cd godot-cpp
# Optional
## Build only the necessary classes
git apply --ignore-space-change --ignore-whitespace ../patches/godot_cpp_exclude_unused_classes.patch
## Faster build
git apply --ignore-space-change --ignore-whitespace ../patches/unity_build.patch
```

Then you can just run scons as usual:

```bash
# build for the current system.
# target=editor is used for both the editor and the debug template.
scons target=editor dev_build=yes debug_symbols=yes
# build for the android. ANDROID_NDK_ROOT is required in your environment variables.
scons platform=android target=template_release arch=arm64v8
```
