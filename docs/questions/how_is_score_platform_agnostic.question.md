---
title: "Is Score really platform-agnostic?"
alt_titles:
    - "Is Score really platform-agnostic - given that score-compose and score-helm are the only available implementations?"
    - "Why are score-compose and score-helm the only reference implementations?"
---

Yes. `score-compose` and `score-helm` are reference implementations that were developed by the team to demonstrate how Score could be used. Depending on your use case, you might want to write your own implementation for - let’s say - `score-ecs` or `score-kustomize`. You can also use one of the existing implementations and extend it according to your needs. If you’re interested in doing so, don’t hesitate to reach out, we’d be happy to collaborate.
