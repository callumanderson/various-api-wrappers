require_relative 'lib_require'
require 'rubygems'
require 'httparty'

class JiraClient
  attr_accessor :auth
  attr_accessor :req_path
  attr_accessor :host

  # Constructor for the JiraClient
  # @param [String] username - the connecting username
  # @param [String] password - the user password
  # @param [String] req_path
  #
  # @return [Hash] auth
  # @return [String] host
  # @return [String] req_path
  def initialize(username, password, req_path, server, port)
    @auth = {username: username, password: password }
    @host = "https://" + server + ":" + port
    @req_path = req_path
  end

  # Connects to Jira with basic authentication
  # @return [String] resp -  the http response from connection
  def connect
    req = URI.escape(@req_path)
    p req
    begin
      p "attempting to connect"
    @resp = HTTParty.get(
        "#{@host}#{req}",
        :basic_auth => @auth
    )
        p "done connecting"
    rescue => e
      p "entering fail"
      @resp = e.response
    end
    end

  def get_response
    connect
    @resp.code.to_s
  end
  end
