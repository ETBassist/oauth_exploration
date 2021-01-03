class DashboardController < ApplicationController
  def show
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {'Authorization': "token #{current_user.token}"}
    )
    response = conn.get('/user/repos')

    @public_repos = JSON.parse(response.body, symbolize_names: true)
    response = conn.get('/user/repos?type=private')
    @private_repos = JSON.parse(response.body, symbolize_names: true)
  end
end
