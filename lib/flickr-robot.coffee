# flickr-robot
# https://github.com/cw/flickr
#
# Copyright (c) 2012 Christian Wilcox
# Licensed under the MIT license.

fs = require('fs')
path = require('path')
Flickr = require('flickr-with-uploads').Flickr

# internal helper functions
readOptions = (callback) ->
  pth = path.join(__dirname, "../.env")
  console.log "env file: #{pth}"
  fs.readFile(pth, 'utf8', (err, text) ->
    opts = {}
    if not err
      text.split(/\n/).forEach((line) ->
        line_parts = line.split(/\=/)
        opts[line_parts[0]] = line_parts[1]
      )
    callback(err, opts)
  )

# read client login info and get client
client = readOptions((err, opts) ->
  console.log "options: #{opts}"
#  client = new Flickr('0RjUImXvsYx2P8Gi4eZScFh9fkLJltDV', 'mbu87dOB0FWncTRJ',
#    '3XF0pqP4daZf9oIlx-a7H1uMLeGrBidkJU', 'KpslBxHoh4QYk6ad')
#  console.log "connected to client #{client}"
#  client
  null
)

api = (method_name, data, callback) ->
  # overloaded as (method_name, data, callback)
  client.createRequest(method_name, data, true, callback).send()

get_photos = ->
  params =
    user: "test"
  api('get_photos', params, (err, response) ->
    if err
      console.error("Could not upload photo:", err.toString())
    else
      # usually, the method name is precisely the name of the API method, as they are here:
      api('flickr.people.getPhotos', {
          photo_id: response.photoid
        }, (err, response) ->
        api('flickr.photosets.addPhoto', {photoset_id: 1272356126, photo_id: response.photo.id}, (err) ->
          console.log("Full photo info:", response.photo)
        )
      )
  )


exports.awesome = ->
#  get_photos()
  try
    get_photos()
  catch error
  'awesome'
