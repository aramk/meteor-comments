templateName = 'commentList'
TemplateClass = Template[templateName]

TemplateClass.created = ->
  series = @data.series
  unless series
    throw new Error('No series ID provided for comment list.')
  @isEditing = new ReactiveVar(false)

TemplateClass.helpers
  items: -> getCursor()
  hasItems: -> getCursor().count() > 0
  isEditing: -> getTemplate().isEditing.get()

TemplateClass.events
  'click .toolbar .add.button': (e, template) ->
    template.isEditing.set(true)
    # getAddButton().hide()
    # getAddButton().hide()
    $container = template.$('.form-container')
    template.formView = Blaze.renderWithData Template.commentForm, {}, $container[0]
  'click .toolbar .save.button': (e, template) ->
    
  'click .toolbar .cancel.button': (e, template) ->
    Blaze.remove(template.formView)

getCursor = -> Comments.find()
# getAddButton = (template) -> getTemplate(template).$('.add.button')
getTemplate = (template) -> Templates.getNamedInstance(templateName, template)
