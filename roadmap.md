# Score Roadmap

## Generalized Score extension mechanism

The Score Specification allows developers to define the main characteristics of their Workload. It reduces cognitive load by providing sensible defaults, meaning it only exposes the most important and commonly utilized properties of a Workload's definition. At the same time, should the spec be able to accommodate any additional configuration options that are needed by its users.
The implementation of a generalized extension mechanism allows users to extend their `score.yaml` files with properties that are not included as part of the core Workload specification.

## Score implementation CLIs

As a platform-agnostic Workload specification, the Score Spec integrates with many container orchestration platforms. To expose its full potential, additional implementations for popular tooling such as Kustomize, Amazon ECS, Google Cloud Run, or Nomad are needed.
This would allow an increasing amount of users to integrate Score into their existing tech stack, or migrate to a different tech stack without additional engineering effort.

## Score Developer Documentation

The developer documentation [docs.score.dev](https://docs.score.dev/docs/) plays a crucial role in onboarding new users to Score and supporting them in their day-to-day usage.
To be helpful for users of all experiences and for a variety of use cases, additional documentation in the form of real-world usage examples, tutorials, demos, and educational material on underlying concepts such as containers, container orchestration platforms, CLI tooling and similar is needed.
With this, a smooth onboarding experience that defines clear learning paths forward can be provided for Score's users.

# Get involved

You can start a discussion or submit an idea [here](https://github.com/score-spec/spec/issues/new) anytime.
