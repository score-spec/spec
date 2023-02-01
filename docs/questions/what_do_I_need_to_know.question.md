---
title: "What do I need to know about the Score Specification before getting started?"
---

The Score Specification is a file that describes your workload's runtime requirements. It is characterized by being:

- platform-agnostic: The Score Specification is not tied to a specific platform or tool. As a fully platform-agnostic spec can it be integrated with many container orchestration platforms and tooling such as Kustomize, Amazon ECS, Google Cloud Run, or Nomad for example.
- environment-agnostic: The score.yaml file captures the configuration that stays the same across all environments. This allows combining it with environment-specific parameters in the target environment. For example: Your Score spec might specify a parameterized database connecting string such as `postgres://${postgres.username}:{postgres.password}}@${postgres.host}:${postgres.port}/${postgres.name}` which is resolved in each environment the workload is deployed to by injecting the according credentials.
- tightly scoped: Score describes workload level properties. It does not intend to be a fully featured YAML replacement for any platform. Instead, it draws a line between developer-owned workload related configuration and operations-owned platform related configuration.
- declarative: Developers declare what their workload requires to run as part of `score.yaml`. The platform in the target environment is responsible for resolving individual runtime requirements. This establishes a contract between dev and ops: If the requirements listed in the spec are honored, the workload will run as intended.

The counterpart of the Score Specification is a Score Implementation, a CLI tool (such as [`score-compose`](https://github.com/score-spec/score-compose)) that the spec can be executed against to generate the required configuration (such as compose.yaml).
