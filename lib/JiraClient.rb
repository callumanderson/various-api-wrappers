require_relative 'lib_require'
require 'rubygems'
require 'httparty'
require 'json'
require 'openssl'

class JiraClient
  attr_accessor :auth
  attr_accessor :req_path
  attr_accessor :host
  attr_accessor :port

  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

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

      url = URI.encode(@host + @req_path)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      request.basic_auth 'username', 'password'
      request["Content-Type"] = "application/json"

      @response = JSON.parse(http.request(request).body)
    end
  end

  def get_response
    connect
    return @response
  end
