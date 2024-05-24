# Score

![Score banner](/docs/images/banner.png)

## ![Score](/docs/images/logo.svg) What is Score?

Score is an open source, platform-agnostic, container-based workload specification. This means you can define your workload once with the _Score Specification_ and then use a _Score Implementation_ to translate it to multiple platforms, such as Docker Compose, Kubernetes, Helm or Google Cloud Run.

In the example below, a `score.yaml` file is executed via [score-compose](https://github.com/score-spec/score-compose) to generate a `compose.yaml` file, which allows the user to spin up the workload via Docker Compose. The same `score.yaml` file is then run against [score-k8s](https://github.com/score-spec/score-k8s) to generate a `manifests.yaml` file for deployments with Kubernetes.

![demo.gif](/docs/images/demo.gif)

This project aims to reduce developer toil and cognitive load by only having to define a single specification file that works across multiple platforms.

Using Score provides the following advantages:

- **Creates a single source of truth for your workload's configuration**: Developers define their workload once with the _Score Specification_, independently of the environments it will run in.

- **Reduces cognitive load**: The _Score Specification_ is tightly scoped and shields developers from the configurational complexity of container orchestrators and tooling. By exposing only core workload constructs, developers can keep their focus.

- **Seperates concerns between dev and ops**: The _Score Specification_ clearly defines the responsibility of the developer. For the operations team it presents a recipe on how a workload should be run, providing clear instructions for the platform on the receiving end.

## ![Score](/docs/images/logo.svg) Why Score?

Cloud native developers often struggle with configuration inconsistencies between environments. This gets even more complicated when the technology stack in each environment is different. What if you use Docker Compose for local development, but deploy to a Kubernetes-based development environment?

Not only do you have to figure out Docker Compose and Kubernetes, but you need to keep them in sync.

This results in various bottlenecks along the application delivery lifecycle.

🎵 Tech & tools that require specialized knowledge and operational expertise are imposed on developers.

🎵 Different configuration rules, constructs and values between local and remote environments increase the risk of configuration inconsistencies.

🎵 Keeping a multitude of platforms and environment-specific configuration files in sync leads to repetitive configuration work.

Score provides a single, easy to understand specification for each workload that describes its runtime requirements in a declarative manner. The `score.yaml` file allows generating configuration in an automated, standardized and one directional way.

By reducing the risk of wrongly specified or inconsistent configuration between environments, are we hoping to foster focus and joy for developers in their day-to-day work.

## ![Score](/docs/images/logo.svg) How does Score work?

![how-score-works](/docs/images/how-score-works.png)

As shown in the graphic above, there are 3 core components to consider in the context of Score:

The _Score Specification_ file is a platform-agnostic workload specification which can be run against a _Score Implementation_ such as [score-compose](https://github.com/score-spec/score-compose) or [score-k8s](https://github.com/score-spec/score-k8s) to generate a platform configuration file such as `docker-compose.yaml` or `manifests.yaml`.
The generated configuration file can then be combined with environment-specific parameters to run the workload in the target environment.

## ![Installation](/docs/images/install.svg) Installation

To install one of our reference _Score Implementations_, see the installation guide in each repository:

- [score-compose](https://github.com/score-spec/score-compose?tab=readme-ov-file#-installation)
- [score-k8s](https://github.com/score-spec/score-k8s?tab=readme-ov-file#installation)

Can't find the implementation you are looking for? The _Score Specification_ has the potential to integrate with many container orchestration platforms and tooling such as Kustomize, Amazon ECS, Google Cloud Run, or Nomad. Help up shape the next generation of Score implementation CLI’s and start contributing [here](https://github.com/score-spec/spec/blob/main/roadmap.md#get-involved).

## ![Get involved](/docs/images/get-involved.svg) Get involved

- Give the project a star!
- Contact us via email:
  - team@score.dev
  - abuse@score.dev
- Join us on [Slack](https://join.slack.com/t/scorecommunity/shared_invite/zt-2a0x563j7-i1vZOK2Yg2o4TwCM1irIuA)
- See our [documentation](https://docs.score.dev/docs/overview/)

## ![Contributing](/docs/images/contributing.svg) Contributing

- Write a [blog post](https://score.dev/blog).
- Provide feedback on our [roadmap](https://github.com/score-spec/spec/blob/main/roadmap.md#get-involved).
- Contribute.

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also open an issue with the tag `enhancement`.

1. Fork the Project.
2. Create your Feature Branch. `git checkout -b feature/feature-name`
3. Commit your Changes. `git commit -s -m "Add some AmazingFeature"`
4. Push to the Branch. `git push origin feature/feature-name`
5. Open a Pull Request.

### Documentation

You can find our documentation at [docs.score.dev](https://docs.score.dev/docs/).

### Roadmap

See [Roadmap](roadmap.md). You can [submit an idea](https://github.com/score-spec/spec/issues/new) anytime.

### License

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

### Code of conduct

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

### Code of conduct

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
