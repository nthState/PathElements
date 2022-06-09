# Chris's SwiftUI Path Elements

A SwiftUI Package to let you process each element in a Shape

## Overview

```
import PathElements

var body: some View {
  Rectangle()
    .elements { index, lastPoint, element in
      ...
    }
}
```

| Before | After |
|--------|-------|
![Before](Sources/PathElements/PathElements.docc/Resources/Images/01_Elements.png)|![After](Sources/PathElements/PathElements.docc/Resources/Images/04_Elements.png)


## Documentation

Documentation website here: https://nthstate.github.io/PathElements/documentation/pathelements/

Building the docs

```
swift build
```

```
PACKAGE_NAME=PathElements
REPOSITORY_NAME=PathElements
OUTPUT_PATH=./docs

swift package --allow-writing-to-directory $OUTPUT_PATH \
    generate-documentation --target $PACKAGE_NAME \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path $REPOSITORY_NAME \
    --output-path $OUTPUT_PATH
 ```
