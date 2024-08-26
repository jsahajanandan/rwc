class PlaceholderService

  BASE_URL = "https://jsonplaceholder.typicode.com"

  def self.fetch()
    response = Net::HTTP.get(URI("#{BASE_URL}/posts"))
    JSON.parse(response)
  end

  def self.fetch2()
    uri = URI("#{BASE_URL}/posts")

    res = Net::HTTP.start(uri.host, uri.port, {use_ssl: true} ) do |http|
      request = Net::HTTP::Get.new uri

      http.request request # Net::HTTPResponse object
    end

    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      # OK
      JSON.parse(res.body)
    else
      return nil
    end
  end

  def self.post()
    uri = URI("#{BASE_URL}/posts")

    res = Net::HTTP.post_form(uri, 'title' => 'foo', 'body' => 'bar', 'userId' => '1')
    JSON.parse(res.body)
  end

  def self.post2()
    uri = URI("#{BASE_URL}/posts")

    res = Net::HTTP.start(uri.host, uri.port, {use_ssl: true} ) do |http|
      req = Net::HTTP::Post.new(uri, { 'title' => 'foo', 'body' => 'bar', 'userId' => '1' })

      http.request(req)
    end
    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      # OK
      JSON.parse(res.body)
    else
      return nil
    end
  end
end