require 'yaml'
require 'json'
require './constants.rb'

metadata = JSON.parse(File.open('docs/zxy/metadata.json').read)
center = metadata['center'].split(',').map {|v| v.to_f}

style = <<-EOS
version: 8
center: #{center[0..1]}
zoom: #{center[2].to_i}
sources: 
  v: 
    type: vector
    minzoom: #{MINZOOM}
    maxzoom: #{MAXZOOM}
    attribution: 国土地理院ベクトルタイル提供実験
    tiles: 
      - #{BASE_URL}/zxy/{z}/{x}/{y}.pbf
  i:
    type: raster
    minzoom: 2
    maxzoom: 18
    attribution: 国土地理院
    tiles:
      - https://maps.gsi.go.jp/xyz/pale/{z}/{x}/{y}.png
    tileSize: 256
layers: 
  -
    id: sky
    type: sky
    paint: 
      sky-type: atmosphere
  -
    id: background
    type: background
    paint: 
      background-color: "#607d8b"
  -
    id: pale
    type: raster
    source: i
  - 
    id: dem10b
    type: fill-extrusion
    source: v
    source-layer: dem10b
    minzoom: #{MINZOOMS['dem10b']}
    maxzoom: 22
    paint: 
      fill-extrusion-height: 
        - "+"
        -
          - get
          - a
        - 5
      fill-extrusion-color: "#3f51b5"
      fill-extrusion-opacity: #{COMMON_OPACITY}
  -
    id: dem5a
    type: fill-extrusion
    source: v
    source-layer: dem5a
    minzoom: #{MINZOOMS['dem5a']}
    maxzoom: 22
    paint:
      fill-extrusion-height:
        - get
        - a
      fill-extrusion-color: "#ffeb3b"
      fill-extrusion-opacity: #{COMMON_OPACITY}
EOS

print JSON.pretty_generate(YAML.load(style))

