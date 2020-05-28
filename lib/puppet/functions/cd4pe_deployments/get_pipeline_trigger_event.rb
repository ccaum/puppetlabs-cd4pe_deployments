require 'puppet_x/puppetlabs/cd4pe_client'
require 'puppet_x/puppetlabs/cd4pe_function_result'

# @summary Search which recent pipeline(s) match for a given commit SHA for a repository
Puppet::Functions.create_function(:'cd4pe_deployments::get_pipeline_trigger_event') do
  # @param repo_name
  #   The name of the repository
  # @param pipeline_id
  #   The pipelineId of the pipeline
  # @param commit_sha
  #   The commit SHA to get the pipeline result for
  # @example Get pipeline trigger event for a repository named 'control-repo'
  #   $pipeline = get_pipeline_trigger_event('control-repo', '1mfxk3kc4ic1w0nny0zcq5l7cw', '47b552dc15448b4e306fcf8df320e5124b2cbd63')
  # @return [Hash] contains the results of the function
  #   See [README.md]() for information on the CD4PEFunctionResult hash format
  #   * result [Hash]:
  #     * `rows [Array] array of hashes with pipeline results. Contains 1 hash for the result of the matching commit SHA`
  #   * error [Hash] contains error information if any
  #
  dispatch :get_pipeline_trigger_event do
    required_param 'String', :repo_name
    required_param 'String', :pipeline_id
    required_param 'String', :commit_sha
  end

  def get_pipeline_trigger_event(repo_name, pipeline_id, commit_sha)
    results = call_function('cd4pe_deployments::get_pipeline_trigger_events', repo_name, pipeline_id, commit_sha)
    if results['error']
      return PuppetX::Puppetlabs::CD4PEFunctionResult.create_error_result(results)
    end

    return_hash = {}
    unless results['result'].empty?
      return_hash = results['result'].first
    end

    PuppetX::Puppetlabs::CD4PEFunctionResult.create_result(return_hash)
  end
end
