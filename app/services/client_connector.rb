module ClientConnector
  private

  def showoff_client
    @showoff_client ||= ShowoffClient.new
  end
end