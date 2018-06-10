#!/usr/bin/env ruby

require 'erb'
require 'pathname'

def new_and_up
  id = (Dir.glob('./words-cards-instance-*').map do |instance|
    Integer(instance.sub('./words-cards-instance-', ''))
  end.to_a.max || 0) + 1
  instance = "words-cards-instance-#{id}"
  
  puts "id = #{id}, instance = #{instance} ..."

  instance_path = Pathname.new(File.dirname(__FILE__)).join(instance)
  `mkdir #{instance_path.to_s}`
  File.write(
    instance_path.join('docker-compose.yml').to_s,
    ERB.new(File.read('docker-compose.yml.erb')).result_with_hash(id: id)
  )
  `sh -c 'cd #{instance_path} && docker-compose up -d'`
  puts "up!"
end

Integer(ARGV[0] || 1).times do
  new_and_up
end

