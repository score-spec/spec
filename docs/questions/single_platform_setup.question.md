---
title: "Does it make sense for me to adopt Score in a single platform set up?"
---

One of the main pain points that Score solves is configuration mismatch between environments that run on different platforms. For example: You might run Docker Compose locally while deploying to a Kubernetes-based development environment. A Score Implementation CLI allows you to translate your Score file into all kinds of configuration formats (Docker Compose, Helm, Kustomize, ECS etc.) and thereby ensure consistent configuration. In a single platform set up, this translation element won’t come into effect. Whether adopting Score makes sense for you anyway depends on your team's set up. If you’re running into config bottlenecks and are wanting to abstract away the complexity of platforms such as Kubernetes from developers and instead expose them to a tightly scoped workload spec, Score might be worth investigating - at the very least as a source of inspiration for your team.
