ZXY = [10, 909, 403]
Z = 18
ROOT_URL = 'https://maps.gsi.go.jp/xyz'
#BASE_URL = 'http://m343:9966'
BASE_URL = "https://optgeo.github.io/volumen-#{ZXY.join('-')}"
TS = %w{experimental_dem10b experimental_dem5a}
EXT = 'geojson'
MAXZOOMS = {
  'dem10b' => 14,
  'dem5a' => 14,
}
MINZOOMS = {
  'dem10b' => 14,
  'dem5a' => 14,
}
MAXZOOM = 14
MINZOOM = 14
COMMON_OPACITY = 0.7
