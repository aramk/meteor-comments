Comments =

  config: (args) ->

  add: (arg) ->
    user = Meteor.user()
    unless user
      throw new Error()

    if Types.isString(arg)
      arg = {content: arg}
    if Types.isArray(arg)
      _.each arg, (anArg) => @add(anArg)
    else if Types.isObjectLiteral(arg)
      arg.dateCreated = new Date()
      arg.author = Meteor.user()
      collection.insert(arg)
    else
      throw new Error('Invalid comment argument: ' + arg)

  find: (args, options) ->
    args = Setter.merge({
      order: 'descending'
    }, args)
    sortOrder = if args.order == 'descending' then -1 else 1
    delete args.order
    options = Setter.merge({
      sort: {date: sortOrder}
    }, options)
    collection.find(args, options)

  findByAuthor: (author) -> @find(author: author)

  findBySeries: (series) -> @find(series: series)

  getSchema: -> schema

schema = new SimpleSchema
  # Username of the author.
  author:
    type: String
    index: true
  title:
    type: String
    optional: true
  content:
    type: String
    optional: true
  dateCreated:
    type: Date
  dateModified:
    type: Date
    optional: true
  # An ID which is shared by all comments in a series.
  series:
    type: String
    index: true

collection = new Meteor.Collection('comments')
collection.attachSchema(schema)
allowUser = (userId, doc) -> userId?
allowAuthor = (userId, doc) -> if doc.owner then doc.owner == userId else true
collection.allow
  insert: allowUser
  update: allowAuthor
  remove: allowAuthor

if Meteor.isServer

  Meteor.publish 'comments', ->
    return unless @userId?
    collection.find().fetch()

