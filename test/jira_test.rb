require 'test/unit'
require '../lib/JiraClient'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    $jira_client = JiraClient.new(
        "ticket.expiry",
        "ic3ic3b4by",
        "/rest/api/2/search?jql=updated<=30d&type=Bug&status!=Closed&reporter in ('charlotte.organ', 'josh.cole')",
        "jira.mendeley.com",
        "8080"
    )
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail

    # To change this template use File | Settings | File Templates.
    fail('Not implemented')
  end

  def test_init
    p $jira_client.auth
    p $jira_client.host
    p $jira_client.req_path
  end

  def test_authenticate
    #Given a new jira client
    #When we authenticate
    $jira_client.connect()
    #Then we should have access to N issue
    p $jira_client.get_response
    assert_equal($jira_client.get_response, "200")
  end
end