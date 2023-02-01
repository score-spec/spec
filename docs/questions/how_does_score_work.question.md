---
title: "How does Score work?"
---

The Score Specification file is a platform-agnostic workload specification which can be run against a Score Implementation (CLI) such as [score-compose](https://github.com/score-spec/score-compose) or [score-helm](https://github.com/score-spec/score-helm) to generate a platform configuration file such as `docker-compose.yaml` or a helm `values.yaml` file. The generated configuration file can then be combined with environment-specific parameters to run the workload in the target environment.

![How Score works](/docs/images/run-workload.png).
