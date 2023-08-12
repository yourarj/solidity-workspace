# 09: function visibility in depth

In addition to `private` and `public` modifiers there are two more modifiers

|modifier   | Same contract| Inherited Contract | Can be Called |
|-----------|--------------|--------------------|---------------|
| `private` |    ✅        |        ❌         |       ❌       |
| `internal`|    ✅        |        ✅         |       ❌       |
| `public`  |    ✅        |        ✅         |       ✅       |
| `external`|    ❌        |        ❌         |       ✅       |