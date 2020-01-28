#!/usr/bin/ruby

require 'net/http'

year = ARGV[0] || 2019
last_partner_id = ARGV[1]&.to_i || 44

partner_ids = 1..last_partner_id

partner_ids.each do |partner_id|
  uri = URI("http://localhost:8080/partner/#{partner_id}/earning-report/#{year}")
  req = Net::HTTP::Post.new(uri)
  puts "calling #{uri}"
  res = Net::HTTP.start(uri.hostname, uri.port) {|http|
    http.request(req)
  }
  puts res.body
end
