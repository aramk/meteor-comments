templateName = 'comment'
TemplateClass = Template[templateName]

TemplateClass.helpers
  author: -> Meteor.users.findOne(_id: @doc.author)?.profile.name ? 'Unknown User'
  date: -> moment(@doc.dateCreated).fromNow()
