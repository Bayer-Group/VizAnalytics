_ = require 'underscore'
webpack = require 'webpack'

plugins = []

# if process.env.NODE_ENV is 'production'
#   plugins.push new webpack.optimize.UglifyJsPlugin minimize: false

baseConfig =
  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee'
      }
    ]
  resolve:
    extensions: [
      ''
      '.js'
      '.json'
      '.coffee'
    ]

createConfig = (options) ->
  _({}).extend baseConfig, options

exports.buildConfig = createConfig
  entry:
    main: './src/coffee/main'
  output:
    path: "./lib/"
    filename: 'index.js'
    sourceMapFilename: 'sourceMap.js.map'
    library: 'Main'
    libraryTarget: 'var'
  devtool: '#source-map'
  plugins: plugins
