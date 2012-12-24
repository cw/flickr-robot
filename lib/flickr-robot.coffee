# flickr-robot
# https://github.com/cw/flickr
#
# Copyright (c) 2012 Christian Wilcox
# Licensed under the MIT license.

fs = require('fs')
path = require('path')
_ = require('underscore')
Flickr = require('flickr-with-uploads').Flickr

# internal helper functions
readOptions = (callback) ->
  pth = path.join(__dirname, "../.env")
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
  console.log "options: #{_.keys(opts)}"
  client = new Flickr(opts["FLICKR_API_KEY"], opts["FLICKR_API_SECRET"],
    opts["FLICKR_OA_TOKEN"], opts["FLICKR_OA_SECRET"])
  console.log "connected to client #{client}"
  client
)

api = (method_name, data, callback) ->
  # overloaded as (method_name, data, callback)
  client.createRequest(method_name, data, true, callback).send()

exports.get_photos = ->
  params =
    user_id: "user_id"
    per_page: 500
  count = 0
  api('flickr.people.getPhotos', params, (err, response) ->
    if err
      console.error("Could not upload photo:", err.toString())
    else
      # usually, the method name is precisely the name of the API method, as they are here:
      console.log("Photo count:", response.total)
      count = response.total
  )
  count

exports.awesome = ->
#  get_photos()
#  try
#    get_photos()
#  catch error
  'awesome'

