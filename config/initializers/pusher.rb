require 'pusher'

Pusher.url = "http://#{ENV['PUSHER_ACCESS_KEY']}:#{ENV['PUSHER_SECRET_KEY']}@api.pusherapp.com/apps/#{ENV['PUSHER_APP_ID']}"
Pusher.logger = Rails.logger
