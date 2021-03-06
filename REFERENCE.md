# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Functions**

* [`cd4pe_deployments::create_temp_node_group`](#cd4pe_deploymentscreate_temp_node_group): Create a temporary Puppet Enterprise node group
* [`cd4pe_deployments::delete_git_branch`](#cd4pe_deploymentsdelete_git_branch): Delete a git branch on your VCS
* [`cd4pe_deployments::delete_node_group`](#cd4pe_deploymentsdelete_node_group): Delete a Puppet Enterprise node group
* [`cd4pe_deployments::deploy_code`](#cd4pe_deploymentsdeploy_code): Performs a Puppet Enterprise Code Manager deployment for the given environment
* [`cd4pe_deployments::get_node_group`](#cd4pe_deploymentsget_node_group): Get information about a Puppet Enterprise node group
* [`cd4pe_deployments::pin_nodes_to_env`](#cd4pe_deploymentspin_nodes_to_env): Pin a list of nodes to Puppet Enterprise environment group
* [`cd4pe_deployments::run_puppet`](#cd4pe_deploymentsrun_puppet): Run Puppet using the Puppet Orchestrator for a set of nodes in a given environment
* [`cd4pe_deployments::update_git_branch_ref`](#cd4pe_deploymentsupdate_git_branch_ref): Update a given git branch's HEAD ref to a new commit SHA
* [`cd4pe_deployments::wait_for_approval`](#cd4pe_deploymentswait_for_approval): Blocks further plan execution until the deployment is approved in CD4PE

## Functions

### cd4pe_deployments::create_temp_node_group

Type: Ruby 4.x API

Create a temporary Puppet Enterprise node group

#### Examples

##### Create temp node group with parent node group id '3ed5c6c0-be33-4c62-9f41-a863a282b6ae'

```puppet
$parent_node_group_id = "3ed5c6c0-be33-4c62-9f41-a863a282b6ae"
$test_environment = "development"
create_temp_node_group($parent_node_group_id, $test_environment, true)
```

#### `cd4pe_deployments::create_temp_node_group(String $parent_node_group_id, String $environment_name, Optional[Boolean] $is_environment_node_group)`

The cd4pe_deployments::create_temp_node_group function.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Hash] Contains the new node group described by the following documentation:
  https://puppet.com/docs/pe/2019.1/groups_endpoint.html#response-format-01
* error [Hash] Contains error info if any was encountered during the function call

##### Examples

###### Create temp node group with parent node group id '3ed5c6c0-be33-4c62-9f41-a863a282b6ae'

```puppet
$parent_node_group_id = "3ed5c6c0-be33-4c62-9f41-a863a282b6ae"
$test_environment = "development"
create_temp_node_group($parent_node_group_id, $test_environment, true)
```

##### `parent_node_group_id`

Data type: `String`

The ID string of the parent node group

##### `environment_name`

Data type: `String`

The name of the environment to be associated with the temp node group

##### `is_environment_node_group`

Data type: `Optional[Boolean]`

A Boolean to indicate if the node group should be an environment node group. Defaults to 'true'.

### cd4pe_deployments::delete_git_branch

Type: Ruby 4.x API

Delete a git branch on your VCS

#### Examples

##### Delete git branch "development_b"

```puppet
delete_git_branch("development_b")
```

#### `cd4pe_deployments::delete_git_branch(String $branch_name)`

The cd4pe_deployments::delete_git_branch function.

Returns: `Object` success object
* success [Boolean] whether or not the operation was successful

##### Examples

###### Delete git branch "development_b"

```puppet
delete_git_branch("development_b")
```

##### `branch_name`

Data type: `String`

The name of the branch you want to delete

### cd4pe_deployments::delete_node_group

Type: Ruby 4.x API

Delete a Puppet Enterprise node group

#### Examples

##### Delete node group 3ed5c6c0-be33-4c62-9f41-a863a282b6ae

```puppet
delete_node_group("3ed5c6c0-be33-4c62-9f41-a863a282b6ae")
```

#### `cd4pe_deployments::delete_node_group(String $node_group_id)`

The cd4pe_deployments::delete_node_group function.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Hash]:
  * success [Boolean] whether or not the operation was successful
* error [Hash] contains error information if any

##### Examples

###### Delete node group 3ed5c6c0-be33-4c62-9f41-a863a282b6ae

```puppet
delete_node_group("3ed5c6c0-be33-4c62-9f41-a863a282b6ae")
```

##### `node_group_id`

Data type: `String`

The ID string of the node group

### cd4pe_deployments::deploy_code

Type: Ruby 4.x API

Performs a Puppet Enterprise Code Manager deployment for the given environment

#### Examples

##### Perform a code deploy of the 'development' environment

```puppet
$my_cool_environment = "development"
deploy_code($my_cool_environment)
```

#### `cd4pe_deployments::deploy_code(String $environment_name, Optional[String] $default_branch_override)`

The cd4pe_deployments::deploy_code function.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Array[Hash]] a list of deployment status objects described by the following documentation:
  https://puppet.com/docs/pe/latest/code_manager_api.html#response-format
* error [Hash] Contains error info if any was encountered during the function call

##### Examples

###### Perform a code deploy of the 'development' environment

```puppet
$my_cool_environment = "development"
deploy_code($my_cool_environment)
```

##### `environment_name`

Data type: `String`

The name of the Puppet environment to deploy

##### `default_branch_override`

Data type: `Optional[String]`

Specifies a default branch to set when performing a code deploy

### cd4pe_deployments::get_node_group

Type: Ruby 4.x API

Get information about a Puppet Enterprise node group

#### Examples

##### Get information about node group 3ed5c6c0-be33-4c62-9f41-a863a282b6ae

```puppet
$node_group = get_node_group_info("3ed5c6c0-be33-4c62-9f41-a863a282b6ae")
```

#### `cd4pe_deployments::get_node_group(String $node_group_id)`

The cd4pe_deployments::get_node_group function.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Hash]:
  * `name [String] name of the node group`
  * `id [String] the node group's id`
  * `description [String] a short description of the node group`
  * `environment [String] the name of the environment`
  * `environmentTrumps [Boolean] is this an environment group?``
  * `parent [String] the name of the parent node group`
  * `rule [Array] puppetDB rule`
  * `classes [Hash] list of classes assigned to this node group`
  * `configData [Hash] node group's configuration`
  * `nodes [Array] list of nodes pinned to this group`
* error [Hash] contains error information if any

##### Examples

###### Get information about node group 3ed5c6c0-be33-4c62-9f41-a863a282b6ae

```puppet
$node_group = get_node_group_info("3ed5c6c0-be33-4c62-9f41-a863a282b6ae")
```

##### `node_group_id`

Data type: `String`

The ID string of the node group

### cd4pe_deployments::pin_nodes_to_env

Type: Ruby 4.x API

Pin a list of nodes to Puppet Enterprise environment group

#### Examples

##### Pin a list of nodes to an environment group

```puppet
$my_cool_node_group_id = "3ed5c6c0-be33-4c62-9f41-a863a282b6ae"
pin_nodes_to_env(["example.node1.net", "example.node2.net", "example.node3.net"], $my_cool_node_group_id)
```

#### `cd4pe_deployments::pin_nodes_to_env(Array $nodes, String $node_group_id)`

The cd4pe_deployments::pin_nodes_to_env function.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Hash]:
  * success [Boolean] whether or not the pinning succeeded
* error [Hash] contains error information if any

##### Examples

###### Pin a list of nodes to an environment group

```puppet
$my_cool_node_group_id = "3ed5c6c0-be33-4c62-9f41-a863a282b6ae"
pin_nodes_to_env(["example.node1.net", "example.node2.net", "example.node3.net"], $my_cool_node_group_id)
```

##### `nodes`

Data type: `Array`

List of nodes to pin to the group

##### `node_group_id`

Data type: `String`

The ID string of the node group

### cd4pe_deployments::run_puppet

Type: Ruby 4.x API

Run Puppet using the Puppet Orchestrator for a set of nodes in a given environment

#### Examples

##### Run Puppet on nodes in the 'development' environment

```puppet
$my_cool_environment = "development"
$nodes = ["test1.example.com", "test2.example.com", "test3.example.com"]
run_puppet($my_cool_environment, $nodes, false, 2)
```

#### `cd4pe_deployments::run_puppet(String $environment_name, Array[String] $nodes, Optional[Boolean] $noop, Optional[Integer] $concurrency)`

The cd4pe_deployments::run_puppet function.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Hash] This contains data described by the following documentation:
  https://puppet.com/docs/pe/latest/orchestrator_api_jobs_endpoint.html#get-jobs-job-id
* error [Hash] Contains error info if any was encountered during the function call

##### Examples

###### Run Puppet on nodes in the 'development' environment

```puppet
$my_cool_environment = "development"
$nodes = ["test1.example.com", "test2.example.com", "test3.example.com"]
run_puppet($my_cool_environment, $nodes, false, 2)
```

##### `environment_name`

Data type: `String`

The name of the Puppet environment to deploy

##### `nodes`

Data type: `Array[String]`

The list of nodes to Run puppet on

##### `noop`

Data type: `Optional[Boolean]`

A Boolean to run Puppet in Noop mode. Defaults to 'false'.

##### `concurrency`

Data type: `Optional[Integer]`

The number of nodes to concurrently run Puppet on. Defaults to the Puppet Orchestrator default.

### cd4pe_deployments::update_git_branch_ref

Type: Ruby 4.x API

Update a given git branch's HEAD ref to a new commit SHA

#### Examples

##### Update git branch "production" to commit c090ea692e67405c5572af6b2a9dc5f11c9080c0

```puppet
update_git_branch_ref("production", "c090ea692e67405c5572af6b2a9dc5f11c9080c0")
```

#### `cd4pe_deployments::update_git_branch_ref(String $branch_name, String $commit_sha)`

The cd4pe_deployments::update_git_branch_ref function.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Hash]:
  * success [Boolean] whether or not the operation was successful
* error [Hash] contains error information if any

##### Examples

###### Update git branch "production" to commit c090ea692e67405c5572af6b2a9dc5f11c9080c0

```puppet
update_git_branch_ref("production", "c090ea692e67405c5572af6b2a9dc5f11c9080c0")
```

##### `branch_name`

Data type: `String`

The name of the branch you want to update

##### `commit_sha`

Data type: `String`

The commit SHA that will become the branch's new HEAD

### cd4pe_deployments::wait_for_approval

Type: Ruby 4.x API

Blocks further plan execution until the deployment is approved in CD4PE and takes a lambda that is executed once
at the start of the wait time. The lambda includes the "url" which is a link to the approval page for the deployment. If
the max approval window is exceeded (24 hours) or approval is declined, a Bolt::PlanFailure is raised, otherwise a result
is returned to the user.

#### Examples

##### Notify Slack users that approval is needed

```puppet
wait_for_approval do |String $url|
  run_task("slack::notify", "#it-ops", "Please review this deployment for approval: ${url}")
end
```

#### `cd4pe_deployments::wait_for_approval(Callable &$block)`

Blocks further plan execution until the deployment is approved in CD4PE and takes a lambda that is executed once
at the start of the wait time. The lambda includes the "url" which is a link to the approval page for the deployment. If
the max approval window is exceeded (24 hours) or approval is declined, a Bolt::PlanFailure is raised, otherwise a result
is returned to the user.

Returns: `Hash` contains the results of the function
See [README.md]() for information on the CD4PEFunctionResult hash format
* result [Hash]:
  * approvalDecision [Enum['APPROVED', 'DECLINED']] whether the deployment was approved or declined
* error [Hash] contains error information if any

##### Examples

###### Notify Slack users that approval is needed

```puppet
wait_for_approval do |String $url|
  run_task("slack::notify", "#it-ops", "Please review this deployment for approval: ${url}")
end
```

##### `&block`

Data type: `Callable`

Takes a block that provides the URL to the deployment's approval page

