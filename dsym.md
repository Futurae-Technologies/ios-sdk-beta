## dSym

Starting with Xcode 16, Apple has introduced stricter checks for native libraries included in frameworks during the App Store upload process. 
This results in warnings about missing debug symbols (dSYM files), even when these symbols are intentionally excluded to reduce the final XCFramework's binary size.

However, starting with version 3.9.0-beta, we provide dSYM files separately to help you avoid related warnings. 
Additionally, for your convenience, we offer distinct dSYM files specifically tailored for iOS simulators.

### Incorporating dSYM Files into Your Project

The simplest way to integrate these dSYM files into your project is as follows:

1. Download and unzip the dSYM files manually. (You can find links to these files provided with every release starting from version [3.9.0-beta](https://github.com/Futurae-Technologies/ios-sdk-beta/releases/tag/3.9.0))

2. Place the files in a convenient location, for example at the root of your project.

3. Create a new Run Script Build Phase in your Xcode project and insert the following script:

```
set -euo pipefail

DSYM_DEVICE="${PROJECT_DIR}/FuturaeKit-iphoneos.framework.dSYM"
DSYM_SIM="${PROJECT_DIR}/FuturaeKit-iphonesimulator.framework.dSYM"
DEST="${DWARF_DSYM_FOLDER_PATH}"

echo "Copying dSYMs to ${DEST}"
mkdir -p "${DEST}"

case "${PLATFORM_NAME}" in
  iphoneos)
    [ -d "${DSYM_DEVICE}" ] || { echo "Missing: ${DSYM_DEVICE}"; exit 1; }
    rsync -a "${DSYM_DEVICE}" "${DEST}/"
    ;;
  iphonesimulator)
    [ -d "${DSYM_SIM}" ] || { echo "Missing: ${DSYM_SIM}"; exit 1; }
    rsync -a "${DSYM_SIM}" "${DEST}/"
    ;;
  *)
    echo "Unknown platform: ${PLATFORM_NAME}"
    ;;
esac
```

4. Replace the placeholder variables in the script with the actual paths to the downloaded .dSYM bundles on your machine:

```
DSYM_DEVICE="${PROJECT_DIR}/FuturaeKit-iphoneos.framework.dSYM"
DSYM_SIM="${PROJECT_DIR}/FuturaeKit-iphonesimulator.framework.dSYM"

```

Xcode runs Run Script phases inside a restricted sandbox, which can prevent the script from reading and copying files. The simplest way to fix the issue is by setting `No` for `User Script Sandboxing` in `Build Settings`.
