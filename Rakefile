require './constants.rb'

desc 'download and produce'
task :through do
  sh [
    "ruby yield.rb | shuf | ",
    "parallel --line-buffer 'curl --output - ",
    "--silent --fail {} | tippecanoe-json-tool | ",
    "URL={} ruby filter.rb' | ",
    "tippecanoe -f -o tiles.mbtiles ",
    "--detect-shared-borders --coalesce ",
    "--minimum-zoom=#{MINZOOM} ",
    "--maximum-zoom=#{MAXZOOM} ; ",
    "tile-join --force --no-tile-compression ",
    "--output-to-directory=docs/zxy --no-tile-size-limit ",
    "tiles.mbtiles"
  ].join
end

desc 'download source data'
task :download do
  sh [
    'ruby yield.rb | shuf | ',
    "parallel --line-buffer 'curl --output - ",
    "--silent --fail {} | tippecanoe-json-tool | ",
    "URL={} ruby filter.rb' > a.geojsons"
  ].join
end

desc 'produce tiles'
task :tiles do
  sh [
    "tippecanoe -f -o tiles.mbtiles ",
    "--minimum-zoom=#{MINZOOM} ",
    "--maximum-zoom=#{MAXZOOM} ",
    "a.geojsons; ",
    "tile-join --force --no-tile-compression ",
    "--output-to-directory=docs/zxy --no-tile-size-limit ",
    "tiles.mbtiles"
  ].join
end

desc 'run vt-optimizer'
task :optimize do
  sh "node ../vt-optimizer/index.js -m tiles.mbtiles"
end

desc 'host the site'
task :host do
  sh 'budo -d docs'
end

desc 'make style.json'
task :style do
  sh "ruby style.rb > docs/style.json"
  sh "gl-style-validate docs/style.json"
end

