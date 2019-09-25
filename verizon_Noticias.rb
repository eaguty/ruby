#!/usr/bin/ruby

require 'rubygems'
require 'active_support'
require 'fileutils'
require "uri"
require "json"

event_data = nil
name= ""
segundo= "poster_file ="
tercero= "external_id ="
json = '{-"Programa":"",-"tipo_de_video":"",-"capitulo":"",-"Canal":"",-"name":"",-"description":"",-"tags":"",-"categories":"",-"created_at":"",-"updated_at":"",-"access_control_id": "",-"start_date": "",-"end_date": ""-}'


begin
  ARGV.each_with_index do |arg,index|
	event_data = ActiveSupport::JSON.decode(arg) if index == 0
  end
	for input in event_data["inputs"] do
		values = input["uri"].split("/")
		name = values.last
		nameEdit = name.split(".")
	end if event_data["inputs"]
	str = "/data/mnt/aztecaN/verizon/Upload/Noticias"
	path = str + name + ".cfg"
	path2 = str + name + ".meta.json"	
	file = File.open(path, "w")
	file.puts("description= #{nameEdit.first}")
	file.puts(segundo)
	file.puts(tercero)
	file.close()
	file2 = File.open(path2, "w")
	contenido = json.split("-")
	#file2.puts(contenido.first)
	contenido.each { |item|
    		file2.puts item
	}
	file2.close() 
  end

