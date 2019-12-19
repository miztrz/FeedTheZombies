class TextGen
  def initialize
    @textgen = RestClient::Request.execute(method: :post, url: 'https://api.deepai.org/api/text-generator', timeout: 120, headers: { 'api-key' => ENV['DEEPAI_KEY'] }, payload: { 'text' => $articlechoice })
  end
  def raw_output
    JSON.parse(@textgen)
  end
  def clean_text
    raw_output['output'].gsub($articlechoice, '')
  end
end

### I built the below with the idea to use it to pass arguments to the api, but the code was simpler to leave it out.
#  module_function
#   def getarticles(**args)
#     ThisNews.get_everything(**args)
#   end
#   def getsources(**args)
#     ThisNews.get_sources(**args)
#   end
#   def getheadlines(**args)
#     ThisNews.get_top_headlines(**args)
#   end
# end
