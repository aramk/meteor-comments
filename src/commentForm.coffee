templateName = 'commentForm'
TemplateClass = Template[templateName]

TemplateClass.created = ->
  series = @data?.series
  unless series then throw new Error('No series ID provided for comment list.')
  @reactiveContent = new ReactiveVar()

TemplateClass.rendered = ->
  Templates.bindVarToElement getInputElement(), @reactiveContent

TemplateClass.events
  'submit form': (e, template) ->
    content = template.reactiveContent.get()
    Comments.add(content: content, series: template.data.series).then ->
      template.reactiveContent.set('')
    e.preventDefault()
    # Prevent submission from triggering outer forms to submit.
    e.stopPropagation()
  'click a.send': (e, template) -> template.$('form').submit()

TemplateClass.helpers
  author: -> @doc?.author ? Meteor.user()?.profile.name ? 'Anonymous'
  hasContentClass: -> unless _.isEmpty getTemplate().reactiveContent.get()?.trim() then 'has-content'

getInputElement = (template) -> getTemplate(template).$('textarea')
getTemplate = (template) -> Templates.getNamedInstance(templateName, template)
