templateName = 'commentList'
TemplateClass = Template[templateName]

TemplateClass.created = ->
  series = @data?.series
  unless series then throw new Error('No series ID provided for comment list.')
  @isEditing = new ReactiveVar(false)

TemplateClass.helpers
  items: -> getCursor()
  hasItems: -> getCursor().count() > 0
  isEditing: -> getTemplate().isEditing.get()

TemplateClass.events
  'click a.login': -> Router.go('login')

getCursor = -> Comments.find()
getTemplate = (template) -> Templates.getNamedInstance(templateName, template)
