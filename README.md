[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
[![good first issues](https://img.shields.io/github/issues-search/score-spec/spec?query=type%3Aissue%20is%3Aopen%20label%3A%22good%20first%20issue%22&label=good%20first%20issues&style=flat&logo=github)](https://github.com/score-spec/spec/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)

![Score banner](/docs/images/banner.png)

## ![Score](/docs/images/logo.svg) The Score Specification

Score is an open-source workload specification designed to simplify development for cloud-native developers. The specification enables you to describe your workload's configuration in a vendor-neutral way, eliminating the need for tooling-specific syntax from platforms such as Docker Compose or Kubernetes. By leveraging familiar concepts and semantics, defining a workload’s configuration becomes as simple as stating, “I want a database of type X and an event queue of type Y to accompany my workload”.

Below is an example of a Score specification describing a web server that queries a Postgres database on each request. Typically, this file is saved alongside the workload's source code in version control.

```YAML
# The version string helps identify the Score file syntax
apiVersion: score.dev/v1b1
metadata:
  name: sample

# A set of containers deployed together for this Workload.
containers:
  main:
    # The "default" image for our service. When deploying, we may override this with a particular tag.
    image: ghcr.io/score-spec/sample-app-gif:sha-2533037
    variables:
      # Pass the resource outputs to our container as environment variables. The Score implementation takes care of securing any secret access as needed.
      PG_CONNECTION_STRING: "postgresql://${resources.db.username}:${resources.db.password}@${resources.db.host}:${resources.db.port}/${resources.db.database}?sslmode=disable"

# The service ports indicate which ports of the Workload are exposed for other services to call.
service:
  ports:
    web:
      port: 8080

# Each resource dependency has a name and definition that helps the Score implementation link or provision the required resource.
resources:
  db:
    # This database is specific to this Workload and not shared.
    type: postgres
  dns:
    # Ensure a dns name is available for request routing.
    type: dns
  route:
    # We want to ensure that requests on the Workload hostname go to our service port.
    type: route
    params:
      host: ${resources.dns.host}
      path: /
      port: 8080
```

### Key Features of Score

Looking at the example above, you'll notice that the Score specification is:

* **platform-agnostic**: Score is not tied to any specific platform or tool. It integrates seamlessly with Docker, Kubernetes, Helm, and other container orchestration platforms, allowing developers to define the Score spec once, independently of the target environments.

* **environment-agnostic**: Score captures the configuration that remains consistent across all environments, effectively separating environment-agnostic from environment-specific configurations. For instance, the database connection string `PG_CONNECTION_STRING` in the example above is parameterized (i.e. described in an environment-agnostic way), allowing it to be resolved in each target environment with the appropriate credentials.

* **tightly scoped**: Score describes workload-level properties. It does not intend to be a fully featured YAML replacement for any platform, thereby shielding developers from the complexity of container orchestration tools like Kubernetes.

* **declarative**: With Score, developers declare what their workload requires to run as part of the Score specification. The platform in the target environment is responsible for resolving individual runtime requirements. This establishes a contract between dev and ops: If the requirements listed in the spec are honoured, the workload will run as intended.

The current version of the specification schema is stored [here](./score-v1b1.json). For a more detailed specification reference, check out our [developer documentation](https://docs.score.dev/docs/score-specification/score-spec-reference/).

## ![Score](/docs/images/logo.svg) Implementation of the Score Specification

Once you define your workload's runtime requirements with the Score specification, a Score Implementation translates it into the desired target output format as illustrated in the graphic below.

![how-score-works](/docs/images/how-score-works.png)

Currently, we offer two reference implementations:

* [score-compose](https://github.com/score-spec/score-compose): Converts your Score specification into a `docker-compose.yaml` file.
* [score-k8s](https://github.com/score-spec/score-k8s): Generates `manifests.yaml` files from your Score specification to deploy to a Kubernetes cluster.

These implementations are suitable for practical use and serve as blueprints for creating custom implementations. If you're interested in building a Score implementation but need guidance, feel free to reach out — we're here to help!

Community-built implementations are typically hosted and maintained by their creators. These can be referenced in our documentation or kept private. If a contributor wishes to donate their implementation to our project, we are open to exploring that option.

## ![Score](/docs/images/logo.svg) Benefits of Score

Score aims to reduce developer toil and cognitive load by only having to define a single specification file that works across multiple platforms. Cloud native developers often struggle with configuration inconsistencies between environments. This gets even more complicated when the technology stack in each environment is different. For example: What if you use Docker Compose for local development, but deploy to a Kubernetes-based development environment? Not only do you have to figure out Docker Compose and Kubernetes, but you need to keep them in sync. This results in various bottlenecks along the application delivery lifecycle:

- Tech & tools that require specialized knowledge and operational expertise are imposed on developers.

- Different configuration rules, constructs and values between local and remote environments increase the risk of configuration inconsistencies.

- Keeping a multitude of platforms and environment-specific configuration files in sync leads to repetitive configuration work.

Score provides a single, easy to understand specification for each workload that describes its runtime requirements in a declarative manner. The `score.yaml` file allows generating configuration in an automated, standardized and one directional way.

By reducing the risk of incorrect or inconsistent configurations across environments, Score helps developers focus on their core tasks and enhances their day-to-day work experience.

## ![Get in touch](/docs/images/get-involved.svg) Get in touch

Connect with us through the [Score](https://cloud-native.slack.com/archives/C07DN0D1UCW) channel in the CNCF Slack (<https://slack.cncf.io/>) or contact us via email at team@score.dev.

We host regular community meetings to discuss updates, share ideas, and collaborate. Here are the details:

| Community call | Info |
|:-----------|:------------|
| Meeting Link | Join via [Google Meet](https://meet.google.com/znt-usdc-hzs) or call +49 40 8081618260 (Pin: 599 887 196)
| Meeting Agenda & Notes | Add to our agenda or review minutes [here](https://github.com/score-spec/spec/discussions/categories/community-meetings)
| Meeting Time | 1:00-2:00pm UTC, every first Thursday of the month

If you can't attend at the scheduled time but would like to discuss something, please reach out. We’re happy to arrange an ad-hoc meeting that fits your schedule.

### Documentation

You can find our documentation at [docs.score.dev](https://docs.score.dev/docs/).

### Roadmap

See [Roadmap](roadmap.md). You can [submit an idea](https://github.com/score-spec/spec/issues/new) anytime.

### Contribution Guidelines and Governance

Our general contributor guidelines can be found in [CONTRIBUTING.md](CONTRIBUTING.md). Please note that some repositories may have additional guidelines. For more information on our governance model, please refer to [GOVERNANCE.md](GOVERNANCE.md).
