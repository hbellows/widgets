module ApiConnector
  private
    
  def conn
    Faraday.new(url: 'https://showoff-rails-react-production.herokuapp.com/') do |faraday|
      faraday.params['client_id'] = ENV['API_CLIENT_ID']
      faraday.params['client_secret'] = ENV['API_CLIENT_SECRET']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
