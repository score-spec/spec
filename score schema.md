# Score Specification

The Score Specification is a YAML file that contains the following top-level schema definitions.

Use these definitions to describe a single Workload.

- [`containers`](#container-definition): (required) defines how the Workload's tasks are executed.
- [`resources`](#resources-definition): (optional) defines dependencies needed by the Workload.
- [`service`](#service-definition): (optional) defines how an application can expose its resources when executed.

## Workload definition

```yaml
apiVersion: string
metadata:
  name: string
```

`apiVersion`: the declared Score Specification version.

- Valid options: `score.dev/v1b1`

`metadata`: an optional metadata description of your Workload.

- `name`: specifies a name.

### Workload example

The following is a top-level description for a Workload.

```yaml
apiVersion: score.dev/v1b1

metadata:
  name: hello-world
service:
  ports:
  # . . .
containers:
  my-container:
  # . . .
resources:
  env:
  # . . .
```

## Resources definition

The Resource section of the Score Specification allows users to describe the relationship between Workloads and their dependent resources in an environment-agnostic way. The purpose of the Resource section is to validate resource references in the same Score file.

The resource could be anything. Score doesn't differentiate resources by types. The resource section can be used to provision multiservice setups with platforms like Docker Compose.

It is up to Score implementation tool to resolve the resource by name, type, or any other meta information available.

### Resource properties

```yaml
resources:
  [resource-name]:
    type: [resource-type]
    properties: # optional
      [property-name]:
        type: string # optional
        default: interface{} # optional
        required: [true | false] # false by default
        secret: [true | false] # false by default
```

`resources`: defines dependencies needed by the Workload.

`resource-name`: a required property that specifies the resource name.

- Type: string.
- Constraints: alphanumeric string.

`resource-type`: specifies the resource in the target environment.

- Type: string.
- Constraints: alphanumeric string.

`properties`: specifies properties definition that are available to the resource. Set properties that can be referenced in other places in the Score Specification file. For more information, see [Referencing Resources](#referencing-resources).

`property-name`: used to reference the resource property in other places in Score file.

- Type: string.
- Constraints: alphanumeric string.

  - `default`: specifies a value that can be defined for the property.
  - `type`: specifies a property type.
  - `required`: specifies a property as required.
  - `secret`: specifies a property value as a case-sensitive secret.

### Reserved resource types

In general, `resource-type` has no meaning for Score, but it can affect how the targeted Score implementation tool resolves the resource. The following conventions are _reserved_ resource types.

Resource type | `score-compose`|`score-humanitec`
--- | --- | ---
`environment` | Translates to the environment variables references. For example: `${PROPERTY-NAME}`. | Translates to the application values references. For example: `${values.property-name}`.
`volume` | Translates into a reference to the external volume. This reference is usually used in a container’s volume mount specification. | Translates into a reference to the external volume. This reference is usually used in a container’s volume mount specification.
`workload` | N/A | Translates to the module properties references. For example: `${modules.workload-name.property-name}`.

### Referencing resources

Resources are declared in the `containers` section of the Score file and must map to the YAML structure defined in the `resources` section to properly resolve.

For example, the following resource would map to the structure of the resource section.

```yaml
${resources.resource-name.property-name}
```

```yaml
resources:
  resource-name:
    property-name: my-property-name
```

> If the referenced resource or its property has not been defined, the Score implementation should report a syntax error.

### Resource example

It is up to the Score implementation (CLI) on how and when the resource reference is resolved, and when the referenced values' substitution occurs.

For example, `score-compose` would convert resource properties into environment variables references in a resulting `compose.yaml` configuration file, and produce a reference `.env` file that the user can then populate. For more information, see the [.env file](https://docs.docker.com/compose/environment-variables/#the-env-file).

The following Score file contains a single resource.

```yaml
apiVersion: score.dev/v1b1

metadata:
  name: backend

containers:
  container-id:
    image: busybox
    command: ["/bin/sh"]
    args: ["-c", "while true; do echo Hello $${FRIEND}!; sleep 5; done"]
    variables:
      CONNECTION_STRING: postgresql://${resources.db.username}:${resources.db.password}@${resources.db.host}:${resources.db.port}/${resources.db.name}

resources:
  db:
    type: postgres
    properties:
      host:
      port:
        default: 5432
      name:
      username:
        secret: true
      password:
        secret: true
```

## Service definition

A `service` contains one or more networks ports that can be exposed to external applications.

The `port` specification can include `public port` and should include `container port`.

```yaml
service:
  ports:
    port-name: string # (required)
      port: integer # (required)
      protocol: string # (optional)
      hostIP: integer # (optional)
      targetPort: integer # (optional)
```

`port-name`: describes the name of the port.

`port`: contains the port to expose to an external application.

`protocol`: describes the transportation layer protocol.

- Defaults: `TCP`
- Valid values: `SCTP` | `TCP` | `UDP`

`hostIP`: describes the host IP to bind to.

`targetPort`: describes the port to expose on the host. If the `targetPort` isn't specified, then it defaults to the required `port` property in the container.

### Service example

The following example advertises two public ports `80`, which points to the container's port `8080`, and `8080`, which also points to the container's port.

```yaml
apiVersion: score.dev/v1b1

metadata:
  name: web-app

service:
  ports:
    www:
      port: 80
      targetPort: 8080
    admin:
      port: 8080
      protocol: UDP
```

## Container definition

The Workload container’s specification describes how the Workload's tasks are executed.

```yaml
image: string
command: []string
args: []string
variables: map[string]string
files:
  target: string
  mode: string
  content: []string
volumes:
  source: string
  path: string
  target: string
read_only: [true | false]
resources:
  limits: map[string]interface{}
  requests: map[string]interface{}
livenessProbe: ContainerProbeSpec
  scheme: string
  host: string
  port: int
  path: string
  httpHeaders:
      name: string
      value: string
readinessProbe: ContainerProbeSpec
  scheme: string
  host: string
  port: int
  path: string
  httpHeaders:
      name: string
      value: string
```

<!-- string workload containers -->

`container-id`: specifies a name of the container image.

`image`: image name or tag.

`command`: overrides image entry point.

`args`: overrides entry point arguments.

`variables`: specifies environment variables.

`files`: specifies extra files to mount.

- `target`: specifies a path and name.
- `mode`: specifies access mode.
- `content`: specifies inline content and supports templates.

`volumes`: specifies volumes to mount.

- `source`: specifies external volume reference.
- `path` specifies a sub path in the volume.
- `target`: specifies a target mount on the container.
- `read_only`: if true, mounts as read only.

<!-- Optional CPU and memory resources needed -->

`limits`: maximum allowed memory.

- `memory`: a string value representing the maximum allowed memory.
- `cpu`: a string value representing the maximum allowed CPU.

`requests`: minimum required memory.

- `memory`: a string value representing the minimum required memory.
- `cpu`: a string value representing the minimum required CPU.

`livenessProbe`: indicates if the container is running.

- `httpGet`: performs an HTTP `Get` on a specified path and port.
  - `path`: specifies a path for the HTTP `Get` method.
  - `port`: specifies a port for the HTTP `Get` method.

`readinessProbe`: indicates if the container is ready to respond to requests.

- `httpGet`: performs an HTTP `Get` on a specified path and port.

  - `path`: specifies a path for the HTTP `Get` method.
  - `port`: specifies a port for the HTTP `Get` method.

  - `httpHeaders`: headers to set in the request. Allows repeated headers.
    - `name`: custom header to set in the request.
    - `value`: specifies a value.

### Container example

The following example creates a container with the `busybox` image.

```yaml
containers:
  container-id:
    image: busybox # Docker image name and tag

    command: # (Optional) Overrides image entry point
      - "/bin/echo"
    args: # (Optional) Overrides entry point point
      - "Hello $(FRIEND)"

    variables: # (Optional) Specifies environment variable
      FRIEND: World!

    files: # (Optional) Specifies extra files to mount
      - target: /etc/hello-world/config.yaml #    - Target file path and name
        mode: "666" #    - Access mode
        content: #    - Inline content (supports templates)
          - "---"
          - ${resources.env.APP_CONFIG}

    volumes: # (Optional) Specifies volumes to mount
      - source: ${resources.data} #    - External volume reference
        path: sub/path #    - (Optional) Sub path in the volume
        target: /mnt/data #    - Target mount path on the container
        read_only: true #    - (Optional) Mount as read-only

    resources: # (Optional) CPU and memory resources needed
      limits: #    - (Optional) Maximum allowed
        memory: "128Mi"
        cpu: "500m"
      requests: #    - (Optional) Minimal required
        memory: "64Mi"
        cpu: "250m"

    livenessProbe: # (Optional) Liveness probe
      httpGet: #    - Only HTTP GET is supported
        path: /alive
        port: 8080
    readinessProbe: # (Optional) Liveness probe
      httpGet: #    - Only HTTP GET is supported
        path: /ready
        port: 8080
        httpHeaders: #    - (Optional) HTTP Headers to include
          - name: Custom-Header
            value: Awesome
```