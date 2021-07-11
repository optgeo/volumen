require 'json'
require './constants.rb'

t = ENV['URL'].split('/')[4].split('_')[1]
half = case t
       when 'dem5a'
         0.19 # actual value = 0.2
       when 'dem5b'
         0.19 # actual value = 0.2
       when 'dem10b'
         0.4 # actual value = 0.4
       else
         raise t
       end
half /= 3600 * 2

while gets
  f = JSON.parse($_.strip)
  f['properties'] = {
    :a => (f['properties']['alti'] / 5).to_i * 5
  }
  lng = f['geometry']['coordinates'][0]
  lat = f['geometry']['coordinates'][1]
  f['geometry'] = {
    :type => 'Polygon',
    :coordinates => [[
      [lng - half, lat - half],
      [lng + half, lat - half],
      [lng + half, lat + half],
      [lng - half, lat + half],
      [lng - half, lat - half]
    ]]
  }
  f['tippecanoe'] = {
    :layer => t,
    :maxzoom => MAXZOOMS[t],
    :minzoom => MINZOOMS[t] 
  }
  print "\x1e#{JSON.dump(f)}\n"
end

