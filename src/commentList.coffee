templateName = 'commentList'
TemplateClass = Template[templateName]

TemplateClass.created = ->
  series = @data?.series
  unless series then throw new Error('No series ID provided for comment list.')
  @isEditing = new ReactiveVar(false)
  # Old subscriptions are retained if we need to view the same series later.
  Meteor.subscribe 'comments', series: series

TemplateClass.rendered = ->
  $commentList = @$('.comment-list')
  $items = $('.items', $commentList)
  $innerItems = $('.inner-items', $items)
  scrollToBottom = _.debounce ->
    $items.scrollTop $innerItems.height()
  , 300
  Collections.observe getCursor(), scrollToBottom
  scrollToBottom()

TemplateClass.helpers
  items: -> getCursor()
  hasItems: -> getCursor().count() > 0
  isEditing: -> getTemplate().isEditing.get()

TemplateClass.events
  'click a.login': -> Router.go('login')

getCursor = -> Comments.find series: getTemplate().data.series
getTemplate = (template) -> Templates.getNamedInstance(templateName, template)
