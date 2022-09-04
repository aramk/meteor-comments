// Meteor package definition.
Package.describe({
  name: 'aramk:comments',
  version: '2.0.0',
  summary: 'User comments',
  git: 'https://github.com/aramk/meteor-comments.git'
});

Package.onUse(function (api) {
  api.versionsFrom('METEOR@1.6.1');
  api.use([
    'coffeescript@2.2.1_1',
    'underscore',
    'templating@1.3.2',
    'less@4.0.0',
    'reactive-var@1.0.4',
    'tracker@1.0.5',
    'aldeed:simple-schema@1.3.2',
    'aldeed:collection2@3.5.0',
    'urbanetic:utility@3.0.0'
  ], ['client', 'server']);
  api.use([
    'aramk:semantic-ui@2.4.1_1'
  ], {weak: true});
  api.imply('aramk:semantic-ui');
  api.export([
    'Comments'
  ], ['client', 'server']);
  api.addFiles([
    'src/comment.html',
    'src/comment.coffee',
    'src/commentList.html',
    'src/commentList.coffee',
    'src/layout.less',
    'src/commentList.less',
    'src/commentForm.html',
    'src/commentForm.coffee'
  ], 'client');
  api.addFiles([
    'src/Comments.coffee'
  ], ['client', 'server']);
});
