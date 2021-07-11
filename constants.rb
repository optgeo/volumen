ZXY = [11, 1818, 806]
Z = 18
ROOT_URL = 'https://maps.gsi.go.jp/xyz'
BASE_URL = 'http://m343:9966'
#BASE_URL = 'https://optgeo.github.io/volumen-11-1815-810'
TS = %w{experimental_dem10b experimental_dem5a}
EXT = 'geojson'
MAXZOOMS = {
  'dem10b' => 16,
  'dem5a' => 16,
}
MINZOOMS = {
  'dem10b' => 14,
  'dem5a' => 16,
}
MAXZOOM = 16
MINZOOM = 14
COMMON_OPACITY = 0.7
