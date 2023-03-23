<!-- 
Add a project state badge

See <https://github.com/BCDevExchange/Our-Project-Docs/blob/master/discussion/projectstates.md> 
If you have bcgovr installed and you use RStudio, click the 'Insert BCDevex Badge' Addin.
-->

Offsite trial establishment app
============================

## Overview

Simple digital solution for tree-planters and other reforestation professionals to record the establishment of 'guinnessometric' style reforestation trials and save information to a common dataset for display in a web portal spatial environment.

## Platforms

### Minimum

* iOS: 11.0
* Android: Android 6.0 (API 23)

### Target:

* iOS: 15/16
* Android: 12/13 (API 31/33)

## Environment

This app required remote PostgreSQL server to work. Please go
[here](lib/common/constants/database/database.dart) and fill in the info for your database.

## Run

Requires Dart SDK >=2.18.4 <2.19.0

Requires Flutter SDK >=3.3.7 <3.4.0

Available environments:

- Debug environment
- Profile environment
- Release environment

Current environments differences:

- Debug environments:
    - All logs are written to the console and to a file
    - Flutter dev tools available
    - Freeze animations
- Profile environments:
    - Only error logs are written to a file
    - Some debugging ability is maintained—enough to profile your app’s performance
    - No freeze animations
- Release environments:
    - Only error logs are written to a file
    - Flutter dev tools not supported
    - No freeze animations

There are two core scripts in the project:

-   assemble.bash
-   run.bash

They are used to build artifacts and run the application on a real device.

There are also three supported scripts in the project:

-   env_reader.bash
-   init.bash
-   setup_keybase.bash

They are used to read the main script arguments and set up the project to build or run.

> **Warning**: For iOS, you need to set up a signature before running scripts. For Android, you can customize the signature with the assemble script.

### Script arguments

Core scripts have enough arguments to set the build.
| Argument                | Values                                      | Description                                                                             | Avaliable in run script | Avaliable in assemble script |
| ----------------------- | ------------------------------------------- | --------------------------------------------------------------------------------------- | ----------------------- | ---------------------------- |
| `--android`             | `apk`, `appbundle` - default                | Specifies whether to generate an Android version and what type of artifact to generate. | :x:                     | :heavy_check_mark:           |
| `--ios`                 | No values.                                  | Indicates whether to build the iOS version.                                             | :x:                     | :heavy_check_mark:           |
| `--no-setup-keystore`   | No values.                                  | Specifies that no keystore needs to be set up.                                          | :x:                     | :heavy_check_mark:           |
| `--flutter-path`        | path to flutter(default value is `flutter`) | Specifies the path to the flutter sdk that must be used for assembly.                   | :heavy_check_mark:      | :heavy_check_mark:           |
| `--debug`               | No values.                                  | Specifies that you want to build the project with a debug environment.                  | :heavy_check_mark:      | :heavy_check_mark:           |
| `--release`             | No values.                                  | Specifies that you want to build the project with a release environment.                | :heavy_check_mark:      | :heavy_check_mark:           |
| `--profile`             | No values.                                  | Specifies that you want to build the project with a profile environment.                | :heavy_check_mark:      | :heavy_check_mark:           |
| `--keystore-properties` | Path to keystore properties.                | Specifies the path to the keystore properties that must be used for signed.             | :heavy_check_mark:      | :heavy_check_mark:           |
| `--keystore-path`       | Path to keystore.                           | Specifies the path to the keystore that must be used for signed.                        | :heavy_check_mark:      | :heavy_check_mark:           |
| `--store-password`      | Keystore password.                          | Specifies the keystore password that must be used for signed.                           | :heavy_check_mark:      | :heavy_check_mark:           |
| `--key-alias`           | Key alias from keystore.                    | Specifies the key alias that must be used for signed.                                   | :heavy_check_mark:      | :heavy_check_mark:           |
| `--key-password`        | Key alias password from keystore.           | Specifies the key alias password that must be used for signed.                          | :heavy_check_mark:      | :heavy_check_mark:           |

> **Warning**: To set up a signature, you need to use either `--keystore-properties` alone or `--keystore-path`, `--store-password`, `--key-alias` and `--key-password` together.

### Example

This is a basic example that shows how to run a build:

```bash
/bin/bash assemble.bash --android --release --keystore-path keystore.jks --store-password password --key-alias key0 --key-password password
```

This is a basic example showing how to start a run:

```bash
/bin/bash run.bash --release
```

or

```bash
/bin/bash run.bash --debug
```

## Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an [issue](https://github.com/bcgov/Offsite_Trial_Establishment_App/issues/).

## How to Contribute

If you would like to contribute, please see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## License

```
Copyright 2022 Province of British Columbia

Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
```
