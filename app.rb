require 'json'
require 'sinatra'
require 'ruby_cowsay'
require_relative 'slack'


not_found do
  status 404
  'Seems like you are lost'
end

get '/' do
  status 200
  "<pre>#{Cow.new({cow: Cow.cows.sample, face_type: Cow.faces.sample}).say('Moo!')}</>"
end

post '/' do
  content_type 'application/json'
  return 401 unless request[:token] == ENV['SLACK_TOKEN']
  status 200
  text = request[:text].strip
  channel = request[:channel_name]

  if text.start_with? '--list'
    list = Cow.cows.map { |c| "`#{c}`" }.join("\n")
    post_msg('ephemeral', 'cowsay', "##{channel}", nil, ':cow2:', list)
  else
    cow, msg = 'default', text
    cow, msg = text.split[1], text.split[2..-1].join(' ') if text.start_with? '--cow'
    moo = Cow.new({cow: cow, face_type: 'default'}).say(msg)
    post_msg('in_channel', 'cowsay', "##{channel}", nil, ':cow:', "```#{moo}```")
  end.to_json
end
