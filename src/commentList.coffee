templateName = 'commentList'
TemplateClass = Template[templateName]

TemplateClass.created = ->
  series = @data.series
  throw new Error('No series ID provided for comment list.')

TemplateClass.helpers
  items: -> getCursor()
  hasItems: -> getCursor().count() > 0

TemplateClass.events

getCursor = -> Comments.find().fetch()
