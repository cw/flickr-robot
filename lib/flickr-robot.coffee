# flickr-robot
# https://github.com/cw/flickr
#
# Copyright (c) 2012 Christian Wilcox
# Licensed under the MIT license.


Flickr = require('flickr-with-uploads').Flickr
client = new Flickr('0RjUImXvsYx2P8Gi4eZScFh9fkLJltDV', 'mbu87dOB0FWncTRJ',
    '3XF0pqP4daZf9oIlx-a7H1uMLeGrBidkJU', 'KpslBxHoh4QYk6ad')

exports.awesome = ->
  'awesome'

exports.readOptions = (callback) ->
  fs.readFile(path.join(__dirname, '.env'), 'utf8', (err, text) ->
    opts = {}
    if not err
      text.split(/\n/).forEach((line) ->
        line_parts = line.split(/\=/)
        opts[line_parts[0]] = line_parts[1]
      )
    callback(err, opts)
  )

exports.api = (method_name, data, callback) ->
  # overloaded as (method_name, data, callback)
  client.createRequest(method_name, data, true, callback).send()

exports.get_f = ->
