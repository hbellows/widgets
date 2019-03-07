module UserConnector
  private

  def conn
    Faraday.new(url: 'https://showoff-rails-react-production.herokuapp.com/') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{@user_token}"
      faraday.params['client_id'] = ENV['API_CLIENT_ID']
      faraday.params['client_secret'] = ENV['API_CLIENT_SECRET']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def post_payload(payload)
    conn.post do |req|
      req.url '/api/v1/widgets'
      req.headers['Content-Type'] = 'application/json'
      req.body = payload.to_json
    end
  end

  def put_payload(widget_id, payload)
    conn.put do |req|
      req.url "/api/v1/widgets/#{widget_id}"
      req.headers['Content-Type'] = 'application/json'
      req.body = payload.to_json
    end
  end

  def delete(widget_id)
    conn.delete do |req|
      req.url "/api/v1/widgets/#{widget_id}"
      req.headers['Content-Type'] = 'application/json'
    end
  end

  # def post_response(payload)
  #   JSON.parse(post_payload(payload).body, symbolize_names: true)
  # end
end