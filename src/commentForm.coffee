templateName = 'commentForm'
TemplateClass = Template[templateName]

TemplateClass.created = ->
  series = @data?.series
  unless series then throw new Error('No series ID provided for comment list.')

TemplateClass.events
  'submit form': (e, template) ->
    console.log('submit')
    $content = template.$('textarea')
    content = $content.val().trim()
    Comments.add content: content, series: template.data.series
    e.preventDefault()

TemplateClass.helpers
  author: -> @doc?.author ? Meteor.user()?.profile.name ? 'Anonymous'
