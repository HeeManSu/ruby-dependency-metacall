require 'net/http'
require 'json'

# Fetch random joke function
def fetch_joke
  url = URI('https://official-joke-api.appspot.com/random_joke')
  response = Net::HTTP.get(url)
  joke = JSON.parse(response)
  {
    setup: joke['setup'],
    punchline: joke['punchline']
  }
rescue StandardError => e
  { message: 'Error fetching joke', error: e.message }
end

# Example usage
if __FILE__ == $0
  joke = fetch_joke
  puts joke
end
