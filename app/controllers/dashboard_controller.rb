class DashboardController < ApplicationController
  def show
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {'Authorization': "token #{current_user.token}"}
    )
    response = conn.get('/user/repos')

    @repos = JSON.parse(response.body, symbolize_names: true)
  end
end
