# encoding: utf-8

module BitBucket
  class Users < API
    extend AutoloadHelper

    DEFAULT_REPO_OPTIONS = {
        "username"     => "",
        "first_name"   => "",
        "last_name"    => "",
        "display_name" => "",
        "is_team"      => "",
        "avatar"       => "",
        "resource_uri" => ""
    }.freeze

    VALID_REPO_OPTIONS = %w[
      username
      first_name
      last_name
      display_name
      is_team
      avatar
      resource_uri
    ].freeze

    # Creates new Users API
    def initialize(options = { })
      super(options)
    end

    # Get a single unauthenticated user
    #
    # = Examples
    #  bitbucket = BitBucket.new
    #  bitbucket.users.get 'user-name' 
    #
    # Get the authenticated user
    #
    # = Examples
    #  bitbucket = BitBucket.new oauth_token: '...'
    #  bitbucket.users.get 'user-name'
    #
    def get(user_name = nil, params={ })
      normalize! params

      user_name.present? ? get_request("/users/#{user_name}", params) : get_request("/user", params)
    end

    alias :find :get
    
    # get priviledges (teams?)
    # get follows (repositories)
    # create user
    # delete user
    # get events
    # get followers (of the user)
    # consumers (crud)
    # ssh (crud)
    # email (crud)

  end # Users
end # BitBucket
