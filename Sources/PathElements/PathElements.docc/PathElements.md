# ``PathElements``

A SwiftUI Package to let you process each element in a Shape

## Overview

| Before | After |
|--------|-------|
![Before](01_Elements.png)|![After](04_Elements.png)

```
import PathElements

var body: some View {
  Rectangle()
    .elements { index, lastPoint, element in
      ...
    }
}
```

## Topics

### Group

- <doc:Getting-Started-with-PathElements>
